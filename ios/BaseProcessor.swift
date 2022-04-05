import UIKit
import Foundation
import FaceTecSDK

class BaseProcessor: NSObject, Processor, FaceTecFaceScanProcessorDelegate, URLSessionTaskDelegate {
  var latestNetworkRequest: URLSessionTask!;
  var resolver: RCTPromiseResolveBlock;
  var faceScanResultCallback: FaceTecFaceScanResultCallback!;
  var requestPath: String;
  var success: Bool = false;
  var secret: String = "";

  init(requestPath: String, resolver: @escaping RCTPromiseResolveBlock) {
    self.resolver = resolver;
    self.requestPath = requestPath;
    super.init();

    self.getSessionToken() { sessionToken in
      DispatchQueue.main.async {
        let sessionVC = FaceTec.sdk.createSessionVC(faceScanProcessorDelegate: self, sessionToken: sessionToken);
        UIApplication.shared.keyWindow?.rootViewController?.present(sessionVC, animated: true, completion: nil);
      }
    }
  }

  func getSessionToken(sessionTokenCallback: @escaping (String) -> ()) {
    let endpoint = Config.BaseURL + "/session-token";
    let request = NSMutableURLRequest(url: NSURL(string: endpoint)! as URL);
    
    request.httpMethod = "GET";
    request.addValue(FaceTec.sdk.createFaceTecAPIUserAgentString(""), forHTTPHeaderField: "User-Agent");

    let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main);
    let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

      guard let data = data else {
        print("Exception raised while attempting HTTPS call.");
        return;
      }

      if let responseJSONObj = try? (JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]) {
        if((responseJSONObj["sessionToken"] as? String) != nil) {
          sessionTokenCallback(responseJSONObj["sessionToken"] as! String);
          return;
        }
      }
    })
    task.resume();
  }

  func processSessionWhileFaceTecSDKWaits(sessionResult: FaceTecSessionResult, faceScanResultCallback: FaceTecFaceScanResultCallback) {

    self.faceScanResultCallback = faceScanResultCallback;

    if sessionResult.status != FaceTecSessionStatus.sessionCompletedSuccessfully {
      if latestNetworkRequest != nil {
        latestNetworkRequest.cancel();
      }

      faceScanResultCallback.onFaceScanResultCancel();
      return;
    }

    var parameters: [String : Any] = [ : ];
    parameters["faceScan"] = sessionResult.faceScanBase64;
    parameters["auditTrailImage"] = sessionResult.auditTrailCompressedBase64![0];
    parameters["lowQualityAuditTrailImage"] = sessionResult.lowQualityAuditTrailCompressedBase64![0];

    let request = NSMutableURLRequest(url: NSURL(string: Config.BaseURL + self.requestPath)! as URL);
    request.httpMethod = "POST";
    request.addValue("application/json", forHTTPHeaderField: "Content-Type");
    request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions(rawValue: 0));
    request.addValue(FaceTec.sdk.createFaceTecAPIUserAgentString(sessionResult.sessionId), forHTTPHeaderField: "User-Agent");
    
    let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main);

    self.latestNetworkRequest = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
      guard let data = data else {
        self.faceScanResultCallback.onFaceScanResultCancel();
        return;
      }

      guard let responseJSON = try? (JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.fragmentsAllowed) as? [String: AnyObject]) else {
        self.faceScanResultCallback.onFaceScanResultCancel();
        return;
      }

      guard let scanResultBlob = responseJSON["scanResultBlob"] as? String,
            let wasProcessed = responseJSON["wasProcessed"] as? Bool else {
        self.faceScanResultCallback.onFaceScanResultCancel();
        return;
      }
      
      if wasProcessed == false {
        self.faceScanResultCallback.onFaceScanResultCancel();
        return;
      }
      
      if responseJSON["thisIsMySecret"] != nil {
        self.secret = responseJSON["thisIsMySecret"] as! String;
      }

      self.success = self.faceScanResultCallback.onFaceScanGoToNextStep(scanResultBlob: scanResultBlob);
      FaceTecCustomization.setOverrideResultScreenSuccessMessage("Liveness\nConfirmed");
    });
    self.latestNetworkRequest.resume();

    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
      if self.latestNetworkRequest.state == .completed { return; }

      let uploadMessage:NSMutableAttributedString = NSMutableAttributedString.init(string: "Still Uploading...");
      faceScanResultCallback.onFaceScanUploadMessageOverride(uploadMessageOverride: uploadMessage);
    }
  }
  
  func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
    let uploadProgress: Float = Float(totalBytesSent) / Float(totalBytesExpectedToSend)
    faceScanResultCallback.onFaceScanUploadProgress(uploadedPercent: uploadProgress)
  }

  func onFaceTecSDKCompletelyDone() {
    self.resolver([self.success, self.secret]);
  }
  
  func isSuccess() -> Bool {
    return success;
  }
}
