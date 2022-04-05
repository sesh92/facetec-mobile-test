import Foundation
import UIKit
import FaceTecSDK

class ThemeHelpers {

  public class func setAppTheme(theme: String) {
    Config.currentCustomization = getCustomizationForTheme(theme: theme)
    Config.currentLowLightCustomization = getLowLightCustomizationForTheme(theme: theme)
    Config.currentDynamicDimmingCustomization = getDynamicDimmingCustomizationForTheme(theme: theme)
    FaceTec.sdk.setCustomization(Config.currentCustomization)
    FaceTec.sdk.setLowLightCustomization(Config.currentLowLightCustomization)
    FaceTec.sdk.setDynamicDimmingCustomization(Config.currentDynamicDimmingCustomization)
  }

  class func getCustomizationForTheme(theme: String) -> FaceTecCustomization {
    var currentCustomization = FaceTecCustomization()
    let retryScreenSlideshowImages = [UIImage(named: "FaceTec_ideal_1")!, UIImage(named: "FaceTec_ideal_2")!, UIImage(named: "FaceTec_ideal_3")!, UIImage(named: "FaceTec_ideal_4")!, UIImage(named: "FaceTec_ideal_5")!]
    
    if theme == "FaceTec Theme" {
      // using default customizations -- do nothing
    }
    else if theme == "Config Wizard Theme" {
      currentCustomization = Config.retrieveConfigurationWizardCustomization()
    }
    else if theme == "Pseudo-Fullscreen" {
      let primaryColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1) // black
      let secondaryColor = UIColor(red: 0.235, green: 0.702, blue: 0.443, alpha: 1) // green
      let backgroundColor = UIColor(red: 0.933, green: 0.965, blue: 0.973, alpha: 1) // white
      let buttonBackgroundDisabledColor = UIColor(red: 0.678, green: 0.678, blue: 0.678, alpha: 1)
      
      let backgroundLayer = CAGradientLayer.init()
      backgroundLayer.colors = [secondaryColor.cgColor, secondaryColor.cgColor]
      backgroundLayer.locations = [0,1]
      backgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
      backgroundLayer.endPoint = CGPoint.init(x: 1, y: 0)
      
      var font = UIFont.init(name: "Futura-Medium", size: 26)
      if(font == nil) {
          font = UIFont.systemFont(ofSize: 26)
      }
      
      let feedbackShadow: FaceTecShadow? = nil
      let frameShadow: FaceTecShadow? = nil
      
      //
      // NOTE: For this theme, the Result Screen's activity indicator and result animations are overriden by the use of the FaceTecCustomAnimationDelegate and its methods to specify a custom UIView to display for the individual animations.
      //
      
      // Overlay Customization
      currentCustomization.overlayCustomization.backgroundColor = backgroundColor
      currentCustomization.overlayCustomization.showBrandingImage = false
      currentCustomization.overlayCustomization.brandingImage = nil
      // Guidance Customization
      currentCustomization.guidanceCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.guidanceCustomization.foregroundColor = primaryColor
      currentCustomization.guidanceCustomization.headerFont = font!
      currentCustomization.guidanceCustomization.subtextFont = font!
      currentCustomization.guidanceCustomization.buttonFont = font!
      currentCustomization.guidanceCustomization.buttonTextNormalColor = backgroundColor
      currentCustomization.guidanceCustomization.buttonBackgroundNormalColor = primaryColor
      currentCustomization.guidanceCustomization.buttonTextHighlightColor = backgroundColor
      currentCustomization.guidanceCustomization.buttonBackgroundHighlightColor = UIColor(red: 0.337, green: 0.337, blue: 0.337, alpha: 1)
      currentCustomization.guidanceCustomization.buttonTextDisabledColor = backgroundColor
      currentCustomization.guidanceCustomization.buttonBackgroundDisabledColor =  buttonBackgroundDisabledColor
      currentCustomization.guidanceCustomization.buttonBorderColor = UIColor.clear
      currentCustomization.guidanceCustomization.buttonBorderWidth = 0
      currentCustomization.guidanceCustomization.buttonCornerRadius = 25
      currentCustomization.guidanceCustomization.readyScreenOvalFillColor = UIColor.clear
      currentCustomization.guidanceCustomization.readyScreenTextBackgroundColor = backgroundColor
      currentCustomization.guidanceCustomization.readyScreenTextBackgroundCornerRadius = 5
      currentCustomization.guidanceCustomization.retryScreenImageBorderColor = primaryColor
      currentCustomization.guidanceCustomization.retryScreenImageBorderWidth = 2
      currentCustomization.guidanceCustomization.retryScreenImageCornerRadius = 10
      currentCustomization.guidanceCustomization.retryScreenOvalStrokeColor = backgroundColor
      currentCustomization.guidanceCustomization.retryScreenSlideshowImages = retryScreenSlideshowImages
      currentCustomization.guidanceCustomization.retryScreenSlideshowInterval = 2000
      currentCustomization.guidanceCustomization.enableRetryScreenSlideshowShuffle = true
      currentCustomization.guidanceCustomization.cameraPermissionsScreenImage = UIImage(named: "camera_shutter_offblack")
      // ID Scan Customization
      currentCustomization.idScanCustomization.showSelectionScreenDocumentImage = true
      currentCustomization.idScanCustomization.selectionScreenDocumentImage = UIImage(named: "document_offblack")
      currentCustomization.idScanCustomization.showSelectionScreenBrandingImage = false
      currentCustomization.idScanCustomization.selectionScreenBrandingImage = nil
      currentCustomization.idScanCustomization.selectionScreenBackgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.idScanCustomization.reviewScreenBackgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.idScanCustomization.captureScreenForegroundColor = primaryColor
      currentCustomization.idScanCustomization.reviewScreenForegroundColor = primaryColor
      currentCustomization.idScanCustomization.selectionScreenForegroundColor = primaryColor
      currentCustomization.idScanCustomization.captureScreenFocusMessageTextColor = UIColor(red: 0.337, green: 0.337, blue: 0.337, alpha: 1)
      currentCustomization.idScanCustomization.headerFont = font!
      currentCustomization.idScanCustomization.subtextFont = font!
      currentCustomization.idScanCustomization.buttonFont = font!
      currentCustomization.idScanCustomization.buttonTextNormalColor = backgroundColor
      currentCustomization.idScanCustomization.buttonBackgroundNormalColor = primaryColor
      currentCustomization.idScanCustomization.buttonTextHighlightColor = backgroundColor
      currentCustomization.idScanCustomization.buttonBackgroundHighlightColor = UIColor(red: 0.337, green: 0.337, blue: 0.337, alpha: 1)
      currentCustomization.idScanCustomization.buttonTextDisabledColor = backgroundColor
      currentCustomization.idScanCustomization.buttonBackgroundDisabledColor =  buttonBackgroundDisabledColor
      currentCustomization.idScanCustomization.buttonBorderColor = UIColor.clear
      currentCustomization.idScanCustomization.buttonBorderWidth = 0
      currentCustomization.idScanCustomization.buttonCornerRadius = 25
      currentCustomization.idScanCustomization.captureScreenTextBackgroundColor = backgroundColor
      currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderColor = primaryColor
      currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderWidth = 2
      currentCustomization.idScanCustomization.captureScreenTextBackgroundCornerRadius = 5
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundColor = backgroundColor
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderColor = primaryColor
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderWidth = 2
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundCornerRadius = 5
      currentCustomization.idScanCustomization.captureScreenBackgroundColor = backgroundColor
      currentCustomization.idScanCustomization.captureFrameStrokeColor = primaryColor
      currentCustomization.idScanCustomization.captureFrameStrokeWith = 2
      currentCustomization.idScanCustomization.captureFrameCornerRadius = 12
      currentCustomization.idScanCustomization.activeTorchButtonImage = UIImage(named: "torch_active_black")
      currentCustomization.idScanCustomization.inactiveTorchButtonImage = UIImage(named: "torch_inactive_black")
      // OCR Confirmation Screen Customization
      currentCustomization.ocrConfirmationCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.ocrConfirmationCustomization.mainHeaderDividerLineColor = secondaryColor
      currentCustomization.ocrConfirmationCustomization.mainHeaderDividerLineWidth = 2
      currentCustomization.ocrConfirmationCustomization.mainHeaderFont = font!
      currentCustomization.ocrConfirmationCustomization.sectionHeaderFont = font!
      currentCustomization.ocrConfirmationCustomization.fieldLabelFont = font!
      currentCustomization.ocrConfirmationCustomization.fieldValueFont = font!
      currentCustomization.ocrConfirmationCustomization.inputFieldFont = font!
      currentCustomization.ocrConfirmationCustomization.inputFieldPlaceholderFont = font!
      currentCustomization.ocrConfirmationCustomization.mainHeaderTextColor = secondaryColor
      currentCustomization.ocrConfirmationCustomization.sectionHeaderTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.fieldLabelTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.fieldValueTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.inputFieldTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.inputFieldPlaceholderTextColor = secondaryColor.withAlphaComponent(0.4)
      currentCustomization.ocrConfirmationCustomization.inputFieldBackgroundColor = UIColor.clear
      currentCustomization.ocrConfirmationCustomization.inputFieldBorderColor = secondaryColor
      currentCustomization.ocrConfirmationCustomization.inputFieldBorderWidth = 2
      currentCustomization.ocrConfirmationCustomization.inputFieldCornerRadius = 0
      currentCustomization.ocrConfirmationCustomization.showInputFieldBottomBorderOnly = true
      currentCustomization.ocrConfirmationCustomization.buttonFont = font!
      currentCustomization.ocrConfirmationCustomization.buttonTextNormalColor = backgroundColor
      currentCustomization.ocrConfirmationCustomization.buttonBackgroundNormalColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.buttonTextHighlightColor = backgroundColor
      currentCustomization.ocrConfirmationCustomization.buttonBackgroundHighlightColor = UIColor(red: 0.337, green: 0.337, blue: 0.337, alpha: 1)
      currentCustomization.ocrConfirmationCustomization.buttonTextDisabledColor = backgroundColor
      currentCustomization.ocrConfirmationCustomization.buttonBackgroundDisabledColor =  buttonBackgroundDisabledColor
      currentCustomization.ocrConfirmationCustomization.buttonBorderColor = UIColor.clear
      currentCustomization.ocrConfirmationCustomization.buttonBorderWidth = 0
      currentCustomization.ocrConfirmationCustomization.buttonCornerRadius = 25
      // Result Screen Customization
      currentCustomization.resultScreenCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.resultScreenCustomization.foregroundColor = primaryColor
      currentCustomization.resultScreenCustomization.messageFont = font!.withSize(20)
      currentCustomization.resultScreenCustomization.activityIndicatorColor = primaryColor
      currentCustomization.resultScreenCustomization.customActivityIndicatorImage = nil
      currentCustomization.resultScreenCustomization.customActivityIndicatorRotationInterval = 800
      currentCustomization.resultScreenCustomization.resultAnimationBackgroundColor = secondaryColor
      currentCustomization.resultScreenCustomization.resultAnimationForegroundColor = backgroundColor
      currentCustomization.resultScreenCustomization.resultAnimationSuccessBackgroundImage = nil
      currentCustomization.resultScreenCustomization.resultAnimationUnsuccessBackgroundImage = nil
      currentCustomization.resultScreenCustomization.showUploadProgressBar = true
      currentCustomization.resultScreenCustomization.uploadProgressTrackColor = primaryColor.withAlphaComponent(0.2)
      currentCustomization.resultScreenCustomization.uploadProgressFillColor = secondaryColor
      currentCustomization.resultScreenCustomization.animationRelativeScale = 1.0
      // Feedback Customization
      currentCustomization.feedbackCustomization.backgroundColor = backgroundLayer
      currentCustomization.feedbackCustomization.textColor = backgroundColor
      currentCustomization.feedbackCustomization.textFont = font!.withSize(20)
      currentCustomization.feedbackCustomization.cornerRadius = 5
      currentCustomization.feedbackCustomization.shadow = feedbackShadow
      // Frame Customization
      currentCustomization.frameCustomization.backgroundColor = backgroundColor
      currentCustomization.frameCustomization.borderColor = primaryColor
      currentCustomization.frameCustomization.borderWidth = 0
      currentCustomization.frameCustomization.cornerRadius = 0
      currentCustomization.frameCustomization.shadow = frameShadow
      // Oval Customization
      currentCustomization.ovalCustomization.strokeColor = primaryColor
      currentCustomization.ovalCustomization.progressColor1 = secondaryColor.withAlphaComponent(0.7)
      currentCustomization.ovalCustomization.progressColor2 = secondaryColor.withAlphaComponent(0.7)
      // Cancel Button Customization
      currentCustomization.cancelButtonCustomization.customImage = UIImage(named: "single_chevron_left_offblack")
      currentCustomization.cancelButtonCustomization.location = FaceTecCancelButtonLocation.custom
      let topNotchOffset = UIDevice.current.userInterfaceIdiom == .phone && UIScreen.main.fixedCoordinateSpace.bounds.size.height >= 812 ? 30 : 0
      currentCustomization.cancelButtonCustomization.customLocation = CGRect(x: 10, y: 10 + topNotchOffset, width: 25, height: 25)
      
      // Guidance Customization -- Text Style Overrides
      // Ready Screen Header
      currentCustomization.guidanceCustomization.readyScreenHeaderFont = font!
      currentCustomization.guidanceCustomization.readyScreenHeaderTextColor = primaryColor
      // Ready Screen Subtext
      currentCustomization.guidanceCustomization.readyScreenSubtextFont = font!
      currentCustomization.guidanceCustomization.readyScreenSubtextTextColor = UIColor(red: 0.337, green: 0.337, blue: 0.337, alpha: 1)
      // Retry Screen Header
      currentCustomization.guidanceCustomization.retryScreenHeaderFont = font!
      currentCustomization.guidanceCustomization.retryScreenHeaderTextColor = primaryColor
      // Retry Screen Subtext
      currentCustomization.guidanceCustomization.retryScreenSubtextFont = font!
      currentCustomization.guidanceCustomization.retryScreenSubtextTextColor = UIColor(red: 0.337, green: 0.337, blue: 0.337, alpha: 1)
    }
    else if theme == "Well-Rounded" {
      let primaryColor = UIColor(red: 0.035, green: 0.710, blue: 0.639, alpha: 1) // green
      let backgroundColor = UIColor.white
      let backgroundLayer = CAGradientLayer.init()
      let buttonTextDisabledColor = UIColor(red: 0.843, green: 0.843, blue: 0.843, alpha: 1)
      let buttonBackgroundDisabledColor = UIColor(red: 0.580, green: 0.722, blue: 0.706, alpha: 1)

      backgroundLayer.colors = [primaryColor.cgColor, primaryColor.cgColor]
      backgroundLayer.locations = [0,1]
      backgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
      backgroundLayer.endPoint = CGPoint.init(x: 1, y: 0)
      
      let headerFont = UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.init(0.3))
      let subtextFont = UIFont.systemFont(ofSize: 16, weight: .light)
      let buttonFont = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.init(0.4))
      
      let feedbackShadow: FaceTecShadow? = FaceTecShadow(color: UIColor.black, opacity: 0.5, radius: 2, offset: CGSize(width: 0, height: 0), insets: UIEdgeInsets(top: 1, left: -1, bottom: -1, right: -1))
      let frameShadow: FaceTecShadow? = FaceTecShadow(color: UIColor.black, opacity: 0.5, radius: 4, offset: CGSize(width: 0, height: 0), insets: UIEdgeInsets(top: 1, left: -1, bottom: -1, right: -1))
      
      //
      // NOTE: For this theme, the Result Screen's activity indicator and result animations are overriden by the use of the FaceTecCustomAnimationDelegate and its methods to specify a custom UIView to display for the individual animations.
      //
      
      // Overlay Customization
      currentCustomization.overlayCustomization.backgroundColor = UIColor.clear
      currentCustomization.overlayCustomization.showBrandingImage = false
      currentCustomization.overlayCustomization.brandingImage = nil
      // Guidance Customization
      currentCustomization.guidanceCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.guidanceCustomization.foregroundColor = primaryColor
      currentCustomization.guidanceCustomization.headerFont = headerFont
      currentCustomization.guidanceCustomization.subtextFont = subtextFont
      currentCustomization.guidanceCustomization.buttonFont = buttonFont
      currentCustomization.guidanceCustomization.buttonTextNormalColor = backgroundColor
      currentCustomization.guidanceCustomization.buttonBackgroundNormalColor = primaryColor
      currentCustomization.guidanceCustomization.buttonTextHighlightColor = backgroundColor
      currentCustomization.guidanceCustomization.buttonBackgroundHighlightColor = UIColor(red: 0.192, green: 0.867, blue: 0.796, alpha: 1)
      currentCustomization.guidanceCustomization.buttonTextDisabledColor = buttonTextDisabledColor
      currentCustomization.guidanceCustomization.buttonBackgroundDisabledColor =  buttonBackgroundDisabledColor
      currentCustomization.guidanceCustomization.buttonBorderColor = UIColor.clear
      currentCustomization.guidanceCustomization.buttonBorderWidth = 0
      currentCustomization.guidanceCustomization.buttonCornerRadius = 25
      currentCustomization.guidanceCustomization.readyScreenOvalFillColor = UIColor.clear
      currentCustomization.guidanceCustomization.readyScreenTextBackgroundColor = backgroundColor
      currentCustomization.guidanceCustomization.readyScreenTextBackgroundCornerRadius = 5
      currentCustomization.guidanceCustomization.retryScreenImageBorderColor = primaryColor
      currentCustomization.guidanceCustomization.retryScreenImageBorderWidth = 2
      currentCustomization.guidanceCustomization.retryScreenImageCornerRadius = 10
      currentCustomization.guidanceCustomization.retryScreenOvalStrokeColor = backgroundColor
      currentCustomization.guidanceCustomization.retryScreenSlideshowImages = []
      currentCustomization.guidanceCustomization.retryScreenSlideshowInterval = 1500
      currentCustomization.guidanceCustomization.enableRetryScreenSlideshowShuffle = true
      currentCustomization.guidanceCustomization.cameraPermissionsScreenImage = UIImage(named: "camera_green")
      // ID Scan Customization
      currentCustomization.idScanCustomization.showSelectionScreenDocumentImage = true
      currentCustomization.idScanCustomization.selectionScreenDocumentImage = UIImage(named: "document_green")
      currentCustomization.idScanCustomization.showSelectionScreenBrandingImage = false
      currentCustomization.idScanCustomization.selectionScreenBrandingImage = nil
      currentCustomization.idScanCustomization.selectionScreenBackgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.idScanCustomization.reviewScreenBackgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.idScanCustomization.captureScreenForegroundColor = primaryColor
      currentCustomization.idScanCustomization.reviewScreenForegroundColor = primaryColor
      currentCustomization.idScanCustomization.selectionScreenForegroundColor = primaryColor
      currentCustomization.idScanCustomization.captureScreenFocusMessageTextColor = primaryColor
      currentCustomization.idScanCustomization.headerFont = headerFont
      currentCustomization.idScanCustomization.subtextFont = subtextFont
      currentCustomization.idScanCustomization.buttonFont = buttonFont
      currentCustomization.idScanCustomization.buttonTextNormalColor = backgroundColor
      currentCustomization.idScanCustomization.buttonBackgroundNormalColor = primaryColor
      currentCustomization.idScanCustomization.buttonTextHighlightColor = backgroundColor
      currentCustomization.idScanCustomization.buttonBackgroundHighlightColor = UIColor(red: 0.192, green: 0.867, blue: 0.796, alpha: 1)
      currentCustomization.idScanCustomization.buttonTextDisabledColor = buttonTextDisabledColor
      currentCustomization.idScanCustomization.buttonBackgroundDisabledColor =  buttonBackgroundDisabledColor
      currentCustomization.idScanCustomization.buttonBorderColor = UIColor.clear
      currentCustomization.idScanCustomization.buttonBorderWidth = 0
      currentCustomization.idScanCustomization.buttonCornerRadius = 25
      currentCustomization.idScanCustomization.captureScreenTextBackgroundColor = backgroundColor
      currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderColor = primaryColor
      currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderWidth = 2
      currentCustomization.idScanCustomization.captureScreenTextBackgroundCornerRadius = 5
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundColor = backgroundColor
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderColor = primaryColor
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderWidth = 2
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundCornerRadius = 5
      currentCustomization.idScanCustomization.captureScreenBackgroundColor = backgroundColor
      currentCustomization.idScanCustomization.captureFrameStrokeColor = primaryColor
      currentCustomization.idScanCustomization.captureFrameStrokeWith = 2
      currentCustomization.idScanCustomization.captureFrameCornerRadius = 12
      currentCustomization.idScanCustomization.activeTorchButtonImage = UIImage(named: "torch_active_black")
      currentCustomization.idScanCustomization.inactiveTorchButtonImage = UIImage(named: "torch_inactive_black")
      // OCR Confirmation Screen Customization
      currentCustomization.ocrConfirmationCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.ocrConfirmationCustomization.mainHeaderDividerLineColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.mainHeaderDividerLineWidth = 2
      currentCustomization.ocrConfirmationCustomization.mainHeaderFont = headerFont
      currentCustomization.ocrConfirmationCustomization.sectionHeaderFont = headerFont
      currentCustomization.ocrConfirmationCustomization.fieldLabelFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.fieldValueFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.inputFieldFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.inputFieldPlaceholderFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.mainHeaderTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.sectionHeaderTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.fieldLabelTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.fieldValueTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.inputFieldTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.inputFieldPlaceholderTextColor = primaryColor.withAlphaComponent(0.4)
      currentCustomization.ocrConfirmationCustomization.inputFieldBackgroundColor = UIColor.clear
      currentCustomization.ocrConfirmationCustomization.inputFieldBorderColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.inputFieldBorderWidth = 1
      currentCustomization.ocrConfirmationCustomization.inputFieldCornerRadius = 15
      currentCustomization.ocrConfirmationCustomization.showInputFieldBottomBorderOnly = false
      currentCustomization.ocrConfirmationCustomization.buttonFont = buttonFont
      currentCustomization.ocrConfirmationCustomization.buttonTextNormalColor = backgroundColor
      currentCustomization.ocrConfirmationCustomization.buttonBackgroundNormalColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.buttonTextHighlightColor = backgroundColor
      currentCustomization.ocrConfirmationCustomization.buttonBackgroundHighlightColor = UIColor(red: 0.192, green: 0.867, blue: 0.796, alpha: 1)
      currentCustomization.ocrConfirmationCustomization.buttonTextDisabledColor = buttonTextDisabledColor
      currentCustomization.ocrConfirmationCustomization.buttonBackgroundDisabledColor =  buttonBackgroundDisabledColor
      currentCustomization.ocrConfirmationCustomization.buttonBorderColor = UIColor.clear
      currentCustomization.ocrConfirmationCustomization.buttonBorderWidth = 0
      currentCustomization.ocrConfirmationCustomization.buttonCornerRadius = 25
      // Result Screen Customization
      currentCustomization.resultScreenCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.resultScreenCustomization.foregroundColor = primaryColor
      currentCustomization.resultScreenCustomization.messageFont = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.init(0.3))
      currentCustomization.resultScreenCustomization.activityIndicatorColor = primaryColor
      currentCustomization.resultScreenCustomization.customActivityIndicatorImage = nil
      currentCustomization.resultScreenCustomization.customActivityIndicatorRotationInterval = 1000
      currentCustomization.resultScreenCustomization.resultAnimationBackgroundColor = UIColor.clear
      currentCustomization.resultScreenCustomization.resultAnimationForegroundColor = backgroundColor
      currentCustomization.resultScreenCustomization.resultAnimationSuccessBackgroundImage = nil
      currentCustomization.resultScreenCustomization.resultAnimationUnsuccessBackgroundImage = nil
      currentCustomization.resultScreenCustomization.showUploadProgressBar = false
      currentCustomization.resultScreenCustomization.uploadProgressTrackColor = UIColor.black.withAlphaComponent(0.2)
      currentCustomization.resultScreenCustomization.uploadProgressFillColor = primaryColor
      currentCustomization.resultScreenCustomization.animationRelativeScale = 2.0
      // Feedback Customization
      currentCustomization.feedbackCustomization.backgroundColor = backgroundLayer
      currentCustomization.feedbackCustomization.textColor = backgroundColor
      currentCustomization.feedbackCustomization.textFont = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.init(0.3))
      currentCustomization.feedbackCustomization.cornerRadius = 5
      currentCustomization.feedbackCustomization.shadow = feedbackShadow
      // Frame Customization
      currentCustomization.frameCustomization.backgroundColor = backgroundColor
      currentCustomization.frameCustomization.borderColor = primaryColor
      currentCustomization.frameCustomization.borderWidth = 2
      currentCustomization.frameCustomization.cornerRadius = 20
      currentCustomization.frameCustomization.shadow = frameShadow
      // Oval Customization
      currentCustomization.ovalCustomization.strokeColor = primaryColor
      currentCustomization.ovalCustomization.progressColor1 = primaryColor
      currentCustomization.ovalCustomization.progressColor2 = primaryColor
      // Cancel Button Customization
      currentCustomization.cancelButtonCustomization.customImage = UIImage(named: "cancel_round_green")
      currentCustomization.cancelButtonCustomization.location = FaceTecCancelButtonLocation.topLeft
    }
    else if theme == "Bitcoin Exchange" {
      let primaryColor = UIColor(red: 0.969, green: 0.588, blue: 0.204, alpha: 1) // orange
      let secondaryColor = UIColor(red: 1, green: 1, blue: 0.188, alpha: 1) // yellow
      let backgroundColor = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1) // dark grey
      let buttonTextDisabledColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
      let buttonBackgroundDisabledColor = UIColor(red: 0.749, green: 0.682, blue: 0.612, alpha: 1)

      let backgroundLayer = CAGradientLayer.init()
      backgroundLayer.colors = [primaryColor.cgColor, primaryColor.cgColor]
      backgroundLayer.locations = [0,1]
      backgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
      backgroundLayer.endPoint = CGPoint.init(x: 1, y: 0)
      
      let headerFont = UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.init(0.3))
      let subtextFont = UIFont.systemFont(ofSize: 16, weight: .light)
      let buttonFont = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.init(0.4))
      
      let feedbackShadow: FaceTecShadow? = FaceTecShadow(color: backgroundColor, opacity: 1, radius: 3, offset: CGSize(width: 0, height: 2), insets: UIEdgeInsets(top: 1, left: -1, bottom: -1, right: -1))
      let frameShadow: FaceTecShadow? = FaceTecShadow(color: backgroundColor, opacity: 1, radius: 3, offset: CGSize(width: 0, height: 2), insets: UIEdgeInsets(top: 1, left: -1, bottom: -1, right: -1))
      
      // Overlay Customization
      currentCustomization.overlayCustomization.backgroundColor = UIColor.clear
      currentCustomization.overlayCustomization.showBrandingImage = true
      currentCustomization.overlayCustomization.brandingImage = UIImage(named: "bitcoin_exchange_logo")
      // Guidance Customization
      currentCustomization.guidanceCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.guidanceCustomization.foregroundColor = primaryColor
      currentCustomization.guidanceCustomization.headerFont = headerFont
      currentCustomization.guidanceCustomization.subtextFont = subtextFont
      currentCustomization.guidanceCustomization.buttonFont = buttonFont
      currentCustomization.guidanceCustomization.buttonTextNormalColor = backgroundColor
      currentCustomization.guidanceCustomization.buttonBackgroundNormalColor = primaryColor
      currentCustomization.guidanceCustomization.buttonTextHighlightColor = backgroundColor
      currentCustomization.guidanceCustomization.buttonBackgroundHighlightColor = primaryColor
      currentCustomization.guidanceCustomization.buttonTextDisabledColor = buttonTextDisabledColor
      currentCustomization.guidanceCustomization.buttonBackgroundDisabledColor = buttonBackgroundDisabledColor
      currentCustomization.guidanceCustomization.buttonBorderColor = UIColor.clear
      currentCustomization.guidanceCustomization.buttonBorderWidth = 0
      currentCustomization.guidanceCustomization.buttonCornerRadius = 5
      currentCustomization.guidanceCustomization.readyScreenOvalFillColor = UIColor.clear
      currentCustomization.guidanceCustomization.readyScreenTextBackgroundColor = backgroundColor
      currentCustomization.guidanceCustomization.readyScreenTextBackgroundCornerRadius = 5
      currentCustomization.guidanceCustomization.retryScreenImageBorderColor = primaryColor
      currentCustomization.guidanceCustomization.retryScreenImageBorderWidth = 2
      currentCustomization.guidanceCustomization.retryScreenImageCornerRadius = 5
      currentCustomization.guidanceCustomization.retryScreenOvalStrokeColor = primaryColor
      currentCustomization.guidanceCustomization.retryScreenSlideshowImages = []
      currentCustomization.guidanceCustomization.retryScreenSlideshowInterval = 1500
      currentCustomization.guidanceCustomization.enableRetryScreenSlideshowShuffle = true
      currentCustomization.guidanceCustomization.cameraPermissionsScreenImage = UIImage(named: "camera_orange")
      // ID Scan Customization
      currentCustomization.idScanCustomization.showSelectionScreenDocumentImage = true
      currentCustomization.idScanCustomization.selectionScreenDocumentImage = UIImage(named: "document_orange")
      currentCustomization.idScanCustomization.showSelectionScreenBrandingImage = false
      currentCustomization.idScanCustomization.selectionScreenBrandingImage = nil
      currentCustomization.idScanCustomization.selectionScreenBackgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.idScanCustomization.reviewScreenBackgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.idScanCustomization.captureScreenForegroundColor = primaryColor
      currentCustomization.idScanCustomization.reviewScreenForegroundColor = primaryColor
      currentCustomization.idScanCustomization.selectionScreenForegroundColor = primaryColor
      currentCustomization.idScanCustomization.captureScreenFocusMessageTextColor = primaryColor
      currentCustomization.idScanCustomization.headerFont = headerFont
      currentCustomization.idScanCustomization.subtextFont = subtextFont
      currentCustomization.idScanCustomization.buttonFont = buttonFont
      currentCustomization.idScanCustomization.buttonTextNormalColor = backgroundColor
      currentCustomization.idScanCustomization.buttonBackgroundNormalColor = primaryColor
      currentCustomization.idScanCustomization.buttonTextHighlightColor = backgroundColor
      currentCustomization.idScanCustomization.buttonBackgroundHighlightColor = primaryColor
      currentCustomization.idScanCustomization.buttonTextDisabledColor = buttonTextDisabledColor
      currentCustomization.idScanCustomization.buttonBackgroundDisabledColor = buttonBackgroundDisabledColor
      currentCustomization.idScanCustomization.buttonBorderColor = UIColor.clear
      currentCustomization.idScanCustomization.buttonBorderWidth = 0
      currentCustomization.idScanCustomization.buttonCornerRadius = 5
      currentCustomization.idScanCustomization.captureScreenTextBackgroundColor = backgroundColor
      currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderColor = primaryColor
      currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderWidth = 0
      currentCustomization.idScanCustomization.captureScreenTextBackgroundCornerRadius = 8
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundColor = backgroundColor
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderColor = primaryColor
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderWidth = 0
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundCornerRadius = 8
      currentCustomization.idScanCustomization.captureScreenBackgroundColor = backgroundColor
      currentCustomization.idScanCustomization.captureFrameStrokeColor = primaryColor
      currentCustomization.idScanCustomization.captureFrameStrokeWith = 2
      currentCustomization.idScanCustomization.captureFrameCornerRadius = 12
      currentCustomization.idScanCustomization.activeTorchButtonImage = UIImage(named: "torch_active_orange")
      currentCustomization.idScanCustomization.inactiveTorchButtonImage = UIImage(named: "torch_inactive_orange")
      // OCR Confirmation Screen Customization
      currentCustomization.ocrConfirmationCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.ocrConfirmationCustomization.mainHeaderDividerLineColor = secondaryColor
      currentCustomization.ocrConfirmationCustomization.mainHeaderDividerLineWidth = 1
      currentCustomization.ocrConfirmationCustomization.mainHeaderFont = headerFont
      currentCustomization.ocrConfirmationCustomization.sectionHeaderFont = headerFont
      currentCustomization.ocrConfirmationCustomization.fieldLabelFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.fieldValueFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.inputFieldFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.inputFieldPlaceholderFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.mainHeaderTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.sectionHeaderTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.fieldLabelTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.fieldValueTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.inputFieldTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.inputFieldPlaceholderTextColor = primaryColor.withAlphaComponent(0.4)
      currentCustomization.ocrConfirmationCustomization.inputFieldBackgroundColor = UIColor.clear
      currentCustomization.ocrConfirmationCustomization.inputFieldBorderColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.inputFieldBorderWidth = 1
      currentCustomization.ocrConfirmationCustomization.inputFieldCornerRadius = 5
      currentCustomization.ocrConfirmationCustomization.showInputFieldBottomBorderOnly = false
      currentCustomization.ocrConfirmationCustomization.buttonFont = buttonFont
      currentCustomization.ocrConfirmationCustomization.buttonTextNormalColor = backgroundColor
      currentCustomization.ocrConfirmationCustomization.buttonBackgroundNormalColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.buttonTextHighlightColor = backgroundColor
      currentCustomization.ocrConfirmationCustomization.buttonBackgroundHighlightColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.buttonTextDisabledColor = buttonTextDisabledColor
      currentCustomization.ocrConfirmationCustomization.buttonBackgroundDisabledColor = buttonBackgroundDisabledColor
      currentCustomization.ocrConfirmationCustomization.buttonBorderColor = UIColor.clear
      currentCustomization.ocrConfirmationCustomization.buttonBorderWidth = 0
      currentCustomization.ocrConfirmationCustomization.buttonCornerRadius = 5
      // Result Screen Customization
      currentCustomization.resultScreenCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.resultScreenCustomization.foregroundColor = primaryColor
      currentCustomization.resultScreenCustomization.messageFont = headerFont
      currentCustomization.resultScreenCustomization.activityIndicatorColor = primaryColor
      currentCustomization.resultScreenCustomization.customActivityIndicatorImage = UIImage(named: "activity_indicator_orange")
      currentCustomization.resultScreenCustomization.customActivityIndicatorRotationInterval = 1500
      currentCustomization.resultScreenCustomization.resultAnimationBackgroundColor = primaryColor
      currentCustomization.resultScreenCustomization.resultAnimationForegroundColor = backgroundColor
      currentCustomization.resultScreenCustomization.resultAnimationSuccessBackgroundImage = nil
      currentCustomization.resultScreenCustomization.resultAnimationUnsuccessBackgroundImage = nil
      currentCustomization.resultScreenCustomization.showUploadProgressBar = true
      currentCustomization.resultScreenCustomization.uploadProgressTrackColor = UIColor.black.withAlphaComponent(0.2)
      currentCustomization.resultScreenCustomization.uploadProgressFillColor = primaryColor
      currentCustomization.resultScreenCustomization.animationRelativeScale = 1.0
      // Feedback Customization
      currentCustomization.feedbackCustomization.backgroundColor = backgroundLayer
      currentCustomization.feedbackCustomization.textColor = backgroundColor
      currentCustomization.feedbackCustomization.textFont = headerFont
      currentCustomization.feedbackCustomization.cornerRadius = 5
      currentCustomization.feedbackCustomization.shadow = feedbackShadow
      // Frame Customization
      currentCustomization.frameCustomization.backgroundColor = backgroundColor
      currentCustomization.frameCustomization.borderColor = backgroundColor
      currentCustomization.frameCustomization.borderWidth = 2
      currentCustomization.frameCustomization.cornerRadius = 5
      currentCustomization.frameCustomization.shadow = frameShadow
      // Oval Customization
      currentCustomization.ovalCustomization.strokeColor = primaryColor
      currentCustomization.ovalCustomization.progressColor1 = secondaryColor
      currentCustomization.ovalCustomization.progressColor2 = secondaryColor
      // Cancel Button Customization
      currentCustomization.cancelButtonCustomization.customImage = UIImage(named: "single_chevron_left_orange")
      currentCustomization.cancelButtonCustomization.location = FaceTecCancelButtonLocation.topLeft
      
      // Guidance Customization -- Text Style Overrides
      // Ready Screen Header
      currentCustomization.guidanceCustomization.readyScreenHeaderFont = headerFont
      currentCustomization.guidanceCustomization.readyScreenHeaderTextColor = primaryColor
      // Ready Screen Subtext
      currentCustomization.guidanceCustomization.readyScreenSubtextFont = subtextFont
      currentCustomization.guidanceCustomization.readyScreenSubtextTextColor = secondaryColor
      // Retry Screen Header
      currentCustomization.guidanceCustomization.retryScreenHeaderFont = headerFont
      currentCustomization.guidanceCustomization.retryScreenHeaderTextColor = primaryColor
      // Retry Screen Subtext
      currentCustomization.guidanceCustomization.retryScreenSubtextFont = subtextFont
      currentCustomization.guidanceCustomization.retryScreenSubtextTextColor = secondaryColor
    }
    else if theme == "eKYC" {
      let primaryColor = UIColor(red: 0.929, green: 0.110, blue: 0.141, alpha: 1) // red
      let secondaryColor = UIColor.black
      let backgroundColor = UIColor.white
      
      let backgroundLayer = CAGradientLayer.init()
      backgroundLayer.colors = [secondaryColor.cgColor, secondaryColor.cgColor]
      backgroundLayer.locations = [0,1]
      backgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
      backgroundLayer.endPoint = CGPoint.init(x: 1, y: 0)
      
      let headerFont = UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.init(0.3))
      let subtextFont = UIFont.systemFont(ofSize: 16, weight: .light)
      let buttonFont = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.init(0.4))
      
      let feedbackShadow: FaceTecShadow? = FaceTecShadow(color: primaryColor, opacity: 1, radius: 5, offset: CGSize(width: 0, height: 2), insets: UIEdgeInsets(top: 1, left: -1, bottom: -1, right: -1))
      let frameShadow: FaceTecShadow? = FaceTecShadow(color: primaryColor, opacity: 1, radius: 3, offset: CGSize(width: 0, height: 2), insets: UIEdgeInsets(top: 1, left: -1, bottom: -1, right: -1))
      
      // Overlay Customization
      currentCustomization.overlayCustomization.backgroundColor = UIColor.clear
      currentCustomization.overlayCustomization.showBrandingImage = true
      currentCustomization.overlayCustomization.brandingImage = UIImage(named: "ekyc_logo")
      // Guidance Customization
      currentCustomization.guidanceCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.guidanceCustomization.foregroundColor = secondaryColor
      currentCustomization.guidanceCustomization.headerFont = headerFont
      currentCustomization.guidanceCustomization.subtextFont = subtextFont
      currentCustomization.guidanceCustomization.buttonFont = buttonFont
      currentCustomization.guidanceCustomization.buttonTextNormalColor = primaryColor
      currentCustomization.guidanceCustomization.buttonBackgroundNormalColor = UIColor.clear
      currentCustomization.guidanceCustomization.buttonTextHighlightColor = backgroundColor
      currentCustomization.guidanceCustomization.buttonBackgroundHighlightColor = primaryColor
      currentCustomization.guidanceCustomization.buttonTextDisabledColor = primaryColor.withAlphaComponent(0.3)
      currentCustomization.guidanceCustomization.buttonBackgroundDisabledColor = backgroundColor
      currentCustomization.guidanceCustomization.buttonBorderColor = primaryColor
      currentCustomization.guidanceCustomization.buttonBorderWidth = 2
      currentCustomization.guidanceCustomization.buttonCornerRadius = 8
      currentCustomization.guidanceCustomization.readyScreenOvalFillColor = UIColor.clear
      currentCustomization.guidanceCustomization.readyScreenTextBackgroundColor = backgroundColor
      currentCustomization.guidanceCustomization.readyScreenTextBackgroundCornerRadius = 3
      currentCustomization.guidanceCustomization.retryScreenImageBorderColor = primaryColor
      currentCustomization.guidanceCustomization.retryScreenImageBorderWidth = 2
      currentCustomization.guidanceCustomization.retryScreenImageCornerRadius = 3
      currentCustomization.guidanceCustomization.retryScreenOvalStrokeColor = primaryColor
      currentCustomization.guidanceCustomization.retryScreenSlideshowImages = retryScreenSlideshowImages
      currentCustomization.guidanceCustomization.retryScreenSlideshowInterval = 1500
      currentCustomization.guidanceCustomization.enableRetryScreenSlideshowShuffle = true
      currentCustomization.guidanceCustomization.cameraPermissionsScreenImage = UIImage(named: "camera_red")
      // ID Scan Customization
      currentCustomization.idScanCustomization.showSelectionScreenDocumentImage = false
      currentCustomization.idScanCustomization.selectionScreenDocumentImage = nil
      currentCustomization.idScanCustomization.showSelectionScreenBrandingImage = false
      currentCustomization.idScanCustomization.selectionScreenBrandingImage = nil
      currentCustomization.idScanCustomization.selectionScreenBackgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.idScanCustomization.reviewScreenBackgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.idScanCustomization.captureScreenForegroundColor = backgroundColor
      currentCustomization.idScanCustomization.reviewScreenForegroundColor = backgroundColor
      currentCustomization.idScanCustomization.selectionScreenForegroundColor = primaryColor
      currentCustomization.idScanCustomization.captureScreenFocusMessageTextColor = secondaryColor
      currentCustomization.idScanCustomization.headerFont = headerFont
      currentCustomization.idScanCustomization.subtextFont = subtextFont
      currentCustomization.idScanCustomization.buttonFont = buttonFont
      currentCustomization.idScanCustomization.buttonTextNormalColor = primaryColor
      currentCustomization.idScanCustomization.buttonBackgroundNormalColor = UIColor.clear
      currentCustomization.idScanCustomization.buttonTextHighlightColor = backgroundColor
      currentCustomization.idScanCustomization.buttonBackgroundHighlightColor = primaryColor
      currentCustomization.idScanCustomization.buttonTextDisabledColor = primaryColor.withAlphaComponent(0.3)
      currentCustomization.idScanCustomization.buttonBackgroundDisabledColor = backgroundColor
      currentCustomization.idScanCustomization.buttonBorderColor = primaryColor
      currentCustomization.idScanCustomization.buttonBorderWidth = 2
      currentCustomization.idScanCustomization.buttonCornerRadius = 8
      currentCustomization.idScanCustomization.captureScreenTextBackgroundColor = primaryColor
      currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderColor = primaryColor
      currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderWidth = 0
      currentCustomization.idScanCustomization.captureScreenTextBackgroundCornerRadius = 2
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundColor = primaryColor
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderColor = primaryColor
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderWidth = 0
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundCornerRadius = 2
      currentCustomization.idScanCustomization.captureScreenBackgroundColor = backgroundColor
      currentCustomization.idScanCustomization.captureFrameStrokeColor = primaryColor
      currentCustomization.idScanCustomization.captureFrameStrokeWith = 2
      currentCustomization.idScanCustomization.captureFrameCornerRadius = 12
      currentCustomization.idScanCustomization.activeTorchButtonImage = UIImage(named: "torch_active_black")
      currentCustomization.idScanCustomization.inactiveTorchButtonImage = UIImage(named: "torch_inactive_black")
      // OCR Confirmation Screen Customization
      currentCustomization.ocrConfirmationCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.ocrConfirmationCustomization.mainHeaderDividerLineColor = secondaryColor
      currentCustomization.ocrConfirmationCustomization.mainHeaderDividerLineWidth = 2
      currentCustomization.ocrConfirmationCustomization.mainHeaderFont = headerFont
      currentCustomization.ocrConfirmationCustomization.sectionHeaderFont = headerFont
      currentCustomization.ocrConfirmationCustomization.fieldLabelFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.fieldValueFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.inputFieldFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.inputFieldPlaceholderFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.mainHeaderTextColor = secondaryColor
      currentCustomization.ocrConfirmationCustomization.sectionHeaderTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.fieldLabelTextColor = secondaryColor
      currentCustomization.ocrConfirmationCustomization.fieldValueTextColor = secondaryColor
      currentCustomization.ocrConfirmationCustomization.inputFieldTextColor = backgroundColor
      currentCustomization.ocrConfirmationCustomization.inputFieldPlaceholderTextColor = backgroundColor.withAlphaComponent(0.4)
      currentCustomization.ocrConfirmationCustomization.inputFieldBackgroundColor = secondaryColor
      currentCustomization.ocrConfirmationCustomization.inputFieldBorderColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.inputFieldBorderWidth = 0
      currentCustomization.ocrConfirmationCustomization.inputFieldCornerRadius = 8
      currentCustomization.ocrConfirmationCustomization.showInputFieldBottomBorderOnly = false
      currentCustomization.ocrConfirmationCustomization.buttonFont = buttonFont
      currentCustomization.ocrConfirmationCustomization.buttonTextNormalColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.buttonBackgroundNormalColor = UIColor.clear
      currentCustomization.ocrConfirmationCustomization.buttonTextHighlightColor = backgroundColor
      currentCustomization.ocrConfirmationCustomization.buttonBackgroundHighlightColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.buttonTextDisabledColor = primaryColor.withAlphaComponent(0.3)
      currentCustomization.ocrConfirmationCustomization.buttonBackgroundDisabledColor = backgroundColor
      currentCustomization.ocrConfirmationCustomization.buttonBorderColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.buttonBorderWidth = 2
      currentCustomization.ocrConfirmationCustomization.buttonCornerRadius = 8
      // Result Screen Customization
      currentCustomization.resultScreenCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.resultScreenCustomization.foregroundColor = secondaryColor
      currentCustomization.resultScreenCustomization.messageFont = headerFont
      currentCustomization.resultScreenCustomization.activityIndicatorColor = primaryColor
      currentCustomization.resultScreenCustomization.customActivityIndicatorImage = UIImage(named: "activity_indicator_red")
      currentCustomization.resultScreenCustomization.customActivityIndicatorRotationInterval = 1500
      currentCustomization.resultScreenCustomization.resultAnimationBackgroundColor = UIColor.clear
      currentCustomization.resultScreenCustomization.resultAnimationForegroundColor = UIColor.clear
      currentCustomization.resultScreenCustomization.resultAnimationSuccessBackgroundImage = nil
      currentCustomization.resultScreenCustomization.resultAnimationUnsuccessBackgroundImage = nil
      currentCustomization.resultScreenCustomization.showUploadProgressBar = false
      currentCustomization.resultScreenCustomization.uploadProgressTrackColor = UIColor.black.withAlphaComponent(0.2)
      currentCustomization.resultScreenCustomization.uploadProgressFillColor = primaryColor
      currentCustomization.resultScreenCustomization.animationRelativeScale = 1.0
      // Feedback Customization
      currentCustomization.feedbackCustomization.backgroundColor = backgroundLayer
      currentCustomization.feedbackCustomization.textColor = backgroundColor
      currentCustomization.feedbackCustomization.textFont = headerFont
      currentCustomization.feedbackCustomization.cornerRadius = 3
      currentCustomization.feedbackCustomization.shadow = feedbackShadow
      // Frame Customization
      currentCustomization.frameCustomization.backgroundColor = backgroundColor
      currentCustomization.frameCustomization.borderColor = primaryColor
      currentCustomization.frameCustomization.borderWidth = 2
      currentCustomization.frameCustomization.cornerRadius = 8
      currentCustomization.frameCustomization.shadow = frameShadow
      // Oval Customization
      currentCustomization.ovalCustomization.strokeColor = primaryColor
      currentCustomization.ovalCustomization.progressColor1 = primaryColor.withAlphaComponent(0.5)
      currentCustomization.ovalCustomization.progressColor2 = primaryColor.withAlphaComponent(0.5)
      // Cancel Button Customization
      currentCustomization.cancelButtonCustomization.customImage = UIImage(named: "cancel_box_red")
      currentCustomization.cancelButtonCustomization.location = FaceTecCancelButtonLocation.topRight
    }
    else if theme == "Sample Bank" {
      let primaryColor = UIColor.white
      let backgroundColor = UIColor(red: 0.114, green: 0.090, blue: 0.310, alpha: 1) // navy

      let backgroundLayer = CAGradientLayer.init()
      backgroundLayer.colors = [primaryColor.cgColor, primaryColor.cgColor]
      backgroundLayer.locations = [0,1]
      backgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
      backgroundLayer.endPoint = CGPoint.init(x: 1, y: 0)
      
      let headerFont = UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.init(0.3))
      let subtextFont = UIFont.systemFont(ofSize: 16, weight: .light)
      let buttonFont = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.init(0.4))
      
      let feedbackShadow: FaceTecShadow? = nil
      let frameShadow: FaceTecShadow? = nil

      // Overlay Customization
      currentCustomization.overlayCustomization.backgroundColor = UIColor.clear
      currentCustomization.overlayCustomization.showBrandingImage = true
      currentCustomization.overlayCustomization.brandingImage = UIImage(named: "sample_bank_logo")
      // Guidance Customization
      currentCustomization.guidanceCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.guidanceCustomization.foregroundColor = primaryColor
      currentCustomization.guidanceCustomization.headerFont = headerFont
      currentCustomization.guidanceCustomization.subtextFont = subtextFont
      currentCustomization.guidanceCustomization.buttonFont = buttonFont
      currentCustomization.guidanceCustomization.buttonTextNormalColor = backgroundColor
      currentCustomization.guidanceCustomization.buttonBackgroundNormalColor = primaryColor
      currentCustomization.guidanceCustomization.buttonTextHighlightColor = backgroundColor
      currentCustomization.guidanceCustomization.buttonBackgroundHighlightColor = primaryColor.withAlphaComponent(0.8)
      currentCustomization.guidanceCustomization.buttonTextDisabledColor = backgroundColor.withAlphaComponent(0.3)
      currentCustomization.guidanceCustomization.buttonBackgroundDisabledColor = UIColor.white
      currentCustomization.guidanceCustomization.buttonBorderColor = primaryColor
      currentCustomization.guidanceCustomization.buttonBorderWidth = 2
      currentCustomization.guidanceCustomization.buttonCornerRadius = 2
      currentCustomization.guidanceCustomization.readyScreenOvalFillColor = UIColor.clear
      currentCustomization.guidanceCustomization.readyScreenTextBackgroundColor = backgroundColor
      currentCustomization.guidanceCustomization.readyScreenTextBackgroundCornerRadius = 2
      currentCustomization.guidanceCustomization.retryScreenImageBorderColor = primaryColor
      currentCustomization.guidanceCustomization.retryScreenImageBorderWidth = 2
      currentCustomization.guidanceCustomization.retryScreenImageCornerRadius = 2
      currentCustomization.guidanceCustomization.retryScreenOvalStrokeColor = primaryColor
      currentCustomization.guidanceCustomization.retryScreenSlideshowImages = retryScreenSlideshowImages
      currentCustomization.guidanceCustomization.retryScreenSlideshowInterval = 1500
      currentCustomization.guidanceCustomization.enableRetryScreenSlideshowShuffle = false
      currentCustomization.guidanceCustomization.cameraPermissionsScreenImage = UIImage(named: "camera_white_navy")
      // ID Scan Customization
      currentCustomization.idScanCustomization.showSelectionScreenDocumentImage = false
      currentCustomization.idScanCustomization.selectionScreenDocumentImage = nil
      currentCustomization.idScanCustomization.showSelectionScreenBrandingImage = false
      currentCustomization.idScanCustomization.selectionScreenBrandingImage = nil
      currentCustomization.idScanCustomization.selectionScreenBackgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.idScanCustomization.reviewScreenBackgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.idScanCustomization.captureScreenForegroundColor = backgroundColor
      currentCustomization.idScanCustomization.reviewScreenForegroundColor = backgroundColor
      currentCustomization.idScanCustomization.selectionScreenForegroundColor = primaryColor
      currentCustomization.idScanCustomization.captureScreenFocusMessageTextColor = primaryColor
      currentCustomization.idScanCustomization.headerFont = headerFont
      currentCustomization.idScanCustomization.subtextFont = subtextFont
      currentCustomization.idScanCustomization.buttonFont = buttonFont
      currentCustomization.idScanCustomization.buttonTextNormalColor = backgroundColor
      currentCustomization.idScanCustomization.buttonBackgroundNormalColor = primaryColor
      currentCustomization.idScanCustomization.buttonTextHighlightColor = backgroundColor
      currentCustomization.idScanCustomization.buttonBackgroundHighlightColor = primaryColor.withAlphaComponent(0.8)
      currentCustomization.idScanCustomization.buttonTextDisabledColor = backgroundColor.withAlphaComponent(0.3)
      currentCustomization.idScanCustomization.buttonBackgroundDisabledColor = UIColor.white
      currentCustomization.idScanCustomization.buttonBorderColor = primaryColor
      currentCustomization.idScanCustomization.buttonBorderWidth = 2
      currentCustomization.idScanCustomization.buttonCornerRadius = 2
      currentCustomization.idScanCustomization.captureScreenTextBackgroundColor = primaryColor
      currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderColor = backgroundColor
      currentCustomization.idScanCustomization.captureScreenTextBackgroundBorderWidth = 2
      currentCustomization.idScanCustomization.captureScreenTextBackgroundCornerRadius = 2
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundColor = primaryColor
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderColor = backgroundColor
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundBorderWidth = 2
      currentCustomization.idScanCustomization.reviewScreenTextBackgroundCornerRadius = 2
      currentCustomization.idScanCustomization.captureScreenBackgroundColor = backgroundColor
      currentCustomization.idScanCustomization.captureFrameStrokeColor = primaryColor
      currentCustomization.idScanCustomization.captureFrameStrokeWith = 2
      currentCustomization.idScanCustomization.captureFrameCornerRadius = 12
      currentCustomization.idScanCustomization.activeTorchButtonImage = UIImage(named: "torch_active_white")
      currentCustomization.idScanCustomization.inactiveTorchButtonImage = UIImage(named: "torch_inactive_white")
      // OCR Confirmation Screen Customization
      currentCustomization.ocrConfirmationCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.ocrConfirmationCustomization.mainHeaderDividerLineColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.mainHeaderDividerLineWidth = 2
      currentCustomization.ocrConfirmationCustomization.mainHeaderFont = headerFont
      currentCustomization.ocrConfirmationCustomization.sectionHeaderFont = headerFont
      currentCustomization.ocrConfirmationCustomization.fieldLabelFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.fieldValueFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.inputFieldFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.inputFieldPlaceholderFont = subtextFont
      currentCustomization.ocrConfirmationCustomization.mainHeaderTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.sectionHeaderTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.fieldLabelTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.fieldValueTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.inputFieldTextColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.inputFieldPlaceholderTextColor = primaryColor.withAlphaComponent(0.4)
      currentCustomization.ocrConfirmationCustomization.inputFieldBackgroundColor = UIColor.clear
      currentCustomization.ocrConfirmationCustomization.inputFieldBorderColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.inputFieldBorderWidth = 2
      currentCustomization.ocrConfirmationCustomization.inputFieldCornerRadius = 0
      currentCustomization.ocrConfirmationCustomization.showInputFieldBottomBorderOnly = true
      currentCustomization.ocrConfirmationCustomization.buttonFont = buttonFont
      currentCustomization.ocrConfirmationCustomization.buttonTextNormalColor = backgroundColor
      currentCustomization.ocrConfirmationCustomization.buttonBackgroundNormalColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.buttonTextHighlightColor = backgroundColor
      currentCustomization.ocrConfirmationCustomization.buttonBackgroundHighlightColor = primaryColor.withAlphaComponent(0.8)
      currentCustomization.ocrConfirmationCustomization.buttonTextDisabledColor = backgroundColor.withAlphaComponent(0.3)
      currentCustomization.ocrConfirmationCustomization.buttonBackgroundDisabledColor = UIColor.white
      currentCustomization.ocrConfirmationCustomization.buttonBorderColor = primaryColor
      currentCustomization.ocrConfirmationCustomization.buttonBorderWidth = 2
      currentCustomization.ocrConfirmationCustomization.buttonCornerRadius = 2
      // Result Screen Customization
      currentCustomization.resultScreenCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentCustomization.resultScreenCustomization.foregroundColor = primaryColor
      currentCustomization.resultScreenCustomization.messageFont = headerFont
      currentCustomization.resultScreenCustomization.activityIndicatorColor = primaryColor
      currentCustomization.resultScreenCustomization.customActivityIndicatorImage = UIImage(named: "activity_indicator_white")
      currentCustomization.resultScreenCustomization.customActivityIndicatorRotationInterval = 1000
      currentCustomization.resultScreenCustomization.resultAnimationBackgroundColor = UIColor.clear
      currentCustomization.resultScreenCustomization.resultAnimationForegroundColor = primaryColor
      currentCustomization.resultScreenCustomization.resultAnimationSuccessBackgroundImage = UIImage(named: "reticle_white")
      currentCustomization.resultScreenCustomization.resultAnimationUnsuccessBackgroundImage = UIImage(named: "reticle_white")
      currentCustomization.resultScreenCustomization.showUploadProgressBar = true
      currentCustomization.resultScreenCustomization.uploadProgressTrackColor = UIColor.white.withAlphaComponent(0.2)
      currentCustomization.resultScreenCustomization.uploadProgressFillColor = primaryColor
      currentCustomization.resultScreenCustomization.animationRelativeScale = 1.0
      // Feedback Customization
      currentCustomization.feedbackCustomization.backgroundColor = backgroundLayer
      currentCustomization.feedbackCustomization.textColor = backgroundColor
      currentCustomization.feedbackCustomization.textFont = headerFont
      currentCustomization.feedbackCustomization.cornerRadius = 2
      currentCustomization.feedbackCustomization.shadow = feedbackShadow
      // Frame Customization
      currentCustomization.frameCustomization.backgroundColor = backgroundColor
      currentCustomization.frameCustomization.borderColor = primaryColor
      currentCustomization.frameCustomization.borderWidth = 2
      currentCustomization.frameCustomization.cornerRadius = 2
      currentCustomization.frameCustomization.shadow = frameShadow
      // Oval Customization
      currentCustomization.ovalCustomization.strokeColor = primaryColor
      currentCustomization.ovalCustomization.progressColor1 = primaryColor.withAlphaComponent(0.5)
      currentCustomization.ovalCustomization.progressColor2 = primaryColor.withAlphaComponent(0.5)
      // Cancel Button Customization
      currentCustomization.cancelButtonCustomization.customImage = UIImage(named: "cancel_white")
      currentCustomization.cancelButtonCustomization.location = FaceTecCancelButtonLocation.topLeft
    }
    
    return currentCustomization
}

// Configure UX Color Scheme For Low Light Mode
class func getLowLightCustomizationForTheme(theme: String) -> FaceTecCustomization {
    var currentLowLightCustomization: FaceTecCustomization = getCustomizationForTheme(theme: theme)
    
    let retryScreenSlideshowImages = [UIImage(named: "FaceTec_ideal_1")!, UIImage(named: "FaceTec_ideal_2")!, UIImage(named: "FaceTec_ideal_3")!, UIImage(named: "FaceTec_ideal_4")!, UIImage(named: "FaceTec_ideal_5")!]

    
    if theme == "Config Wizard Theme" {
      currentLowLightCustomization = Config.retrieveLowLightConfigurationWizardCustomization()
    }
    else if theme == "Bitcoin Exchange" {
      let primaryColor = UIColor(red: 0.969, green: 0.588, blue: 0.204, alpha: 1) // orange
      let secondaryColor = UIColor(red: 1, green: 1, blue: 0.188, alpha: 1) // yellow
      let backgroundColor = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1) // dark grey
      let backgroundLayer = CAGradientLayer.init()
      backgroundLayer.colors = [backgroundColor.cgColor, backgroundColor.cgColor]
      backgroundLayer.locations = [0,1]
      backgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
      backgroundLayer.endPoint = CGPoint.init(x: 1, y: 0)
      
      // Overlay Customization
      currentLowLightCustomization.overlayCustomization.brandingImage = UIImage(named: "bitcoin_exchange_logo")
      // Guidance Customization
      currentLowLightCustomization.guidanceCustomization.foregroundColor = backgroundColor
      currentLowLightCustomization.guidanceCustomization.buttonTextNormalColor = UIColor.white
      currentLowLightCustomization.guidanceCustomization.buttonBackgroundNormalColor = primaryColor
      currentLowLightCustomization.guidanceCustomization.buttonTextHighlightColor = UIColor.white
      currentLowLightCustomization.guidanceCustomization.buttonBackgroundHighlightColor = primaryColor
      currentLowLightCustomization.guidanceCustomization.buttonTextDisabledColor = UIColor.white
      currentLowLightCustomization.guidanceCustomization.buttonBackgroundDisabledColor = primaryColor
      currentLowLightCustomization.guidanceCustomization.buttonBorderColor = UIColor.clear
      currentLowLightCustomization.guidanceCustomization.readyScreenOvalFillColor = UIColor.clear
      currentLowLightCustomization.guidanceCustomization.readyScreenTextBackgroundColor = primaryColor
      currentLowLightCustomization.guidanceCustomization.retryScreenImageBorderColor = primaryColor
      currentLowLightCustomization.guidanceCustomization.retryScreenOvalStrokeColor = primaryColor
      currentLowLightCustomization.guidanceCustomization.retryScreenSlideshowImages = []
      // ID Scan Customization
      currentLowLightCustomization.idScanCustomization.selectionScreenDocumentImage = UIImage(named: "document_grey")
      currentLowLightCustomization.idScanCustomization.selectionScreenBrandingImage = nil
      currentLowLightCustomization.idScanCustomization.captureScreenForegroundColor = UIColor.white
      currentLowLightCustomization.idScanCustomization.reviewScreenForegroundColor = UIColor.white
      currentLowLightCustomization.idScanCustomization.selectionScreenForegroundColor = backgroundColor
      currentLowLightCustomization.idScanCustomization.captureScreenFocusMessageTextColor = backgroundColor
      currentLowLightCustomization.idScanCustomization.buttonTextNormalColor = UIColor.white
      currentLowLightCustomization.idScanCustomization.buttonBackgroundNormalColor = primaryColor
      currentLowLightCustomization.idScanCustomization.buttonTextHighlightColor = UIColor.white
      currentLowLightCustomization.idScanCustomization.buttonBackgroundHighlightColor = primaryColor.withAlphaComponent(0.8)
      currentLowLightCustomization.idScanCustomization.buttonTextDisabledColor = UIColor.white
      currentLowLightCustomization.idScanCustomization.buttonBackgroundDisabledColor = primaryColor
      currentLowLightCustomization.idScanCustomization.buttonBorderColor = UIColor.clear
      currentLowLightCustomization.idScanCustomization.captureScreenTextBackgroundColor = backgroundColor
      currentLowLightCustomization.idScanCustomization.captureScreenTextBackgroundBorderColor = UIColor.clear
      currentLowLightCustomization.idScanCustomization.reviewScreenTextBackgroundColor = backgroundColor
      currentLowLightCustomization.idScanCustomization.reviewScreenTextBackgroundBorderColor = UIColor.clear
      currentLowLightCustomization.idScanCustomization.captureFrameStrokeColor = primaryColor
      currentLowLightCustomization.idScanCustomization.activeTorchButtonImage = UIImage(named: "torch_active_orange")
      currentLowLightCustomization.idScanCustomization.inactiveTorchButtonImage = UIImage(named: "torch_inactive_orange")
      // Result Screen Customization
      currentLowLightCustomization.resultScreenCustomization.foregroundColor = backgroundColor
      currentLowLightCustomization.resultScreenCustomization.activityIndicatorColor = primaryColor
      currentLowLightCustomization.resultScreenCustomization.customActivityIndicatorImage = UIImage(named: "activity_indicator_orange")
      currentLowLightCustomization.resultScreenCustomization.resultAnimationBackgroundColor = primaryColor
      currentLowLightCustomization.resultScreenCustomization.resultAnimationForegroundColor = UIColor.white
      currentLowLightCustomization.resultScreenCustomization.resultAnimationSuccessBackgroundImage = nil
      currentLowLightCustomization.resultScreenCustomization.resultAnimationUnsuccessBackgroundImage = nil
      currentLowLightCustomization.resultScreenCustomization.uploadProgressTrackColor = UIColor.black.withAlphaComponent(0.2)
      currentLowLightCustomization.resultScreenCustomization.uploadProgressFillColor = primaryColor
      // Feedback Customization
      currentLowLightCustomization.feedbackCustomization.backgroundColor = backgroundLayer
      currentLowLightCustomization.feedbackCustomization.textColor = UIColor.white
      // Frame Customization
      currentLowLightCustomization.frameCustomization.borderColor = backgroundColor
      // Oval Customization
      currentLowLightCustomization.ovalCustomization.strokeColor = primaryColor
      currentLowLightCustomization.ovalCustomization.progressColor1 = secondaryColor
      currentLowLightCustomization.ovalCustomization.progressColor2 = secondaryColor
      // Cancel Button Customization
      currentLowLightCustomization.cancelButtonCustomization.customImage = UIImage(named: "single_chevron_left_orange")
      
      // Guidance Customization -- Text Style Overrides
      // Ready Screen Header
      currentLowLightCustomization.guidanceCustomization.readyScreenHeaderTextColor = primaryColor
      // Ready Screen Subtext
      currentLowLightCustomization.guidanceCustomization.readyScreenSubtextTextColor = UIColor(red: 0.337, green: 0.337, blue: 0.337, alpha: 1)
      // Retry Screen Header
      currentLowLightCustomization.guidanceCustomization.retryScreenHeaderTextColor = primaryColor
      // Retry Screen Subtext
      currentLowLightCustomization.guidanceCustomization.retryScreenSubtextTextColor = UIColor(red: 0.337, green: 0.337, blue: 0.337, alpha: 1)
    }
    else if theme == "Sample Bank" {
      let primaryColor = UIColor.white
      let backgroundColor = UIColor(red: 0.114, green: 0.090, blue: 0.310, alpha: 1) // navy
      let backgroundLayer = CAGradientLayer.init()
      backgroundLayer.colors = [backgroundColor.cgColor, backgroundColor.cgColor]
      backgroundLayer.locations = [0,1]
      backgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
      backgroundLayer.endPoint = CGPoint.init(x: 1, y: 0)

      // Overlay Customization
      currentLowLightCustomization.overlayCustomization.brandingImage = UIImage(named: "sample_bank_logo")
      // Guidance Customization
      currentLowLightCustomization.guidanceCustomization.foregroundColor = backgroundColor
      currentLowLightCustomization.guidanceCustomization.buttonTextNormalColor = primaryColor
      currentLowLightCustomization.guidanceCustomization.buttonBackgroundNormalColor = backgroundColor
      currentLowLightCustomization.guidanceCustomization.buttonTextHighlightColor = primaryColor
      currentLowLightCustomization.guidanceCustomization.buttonBackgroundHighlightColor = backgroundColor.withAlphaComponent(0.8)
      currentLowLightCustomization.guidanceCustomization.buttonTextDisabledColor = primaryColor.withAlphaComponent(0.3)
      currentLowLightCustomization.guidanceCustomization.buttonBackgroundDisabledColor = backgroundColor
      currentLowLightCustomization.guidanceCustomization.buttonBorderColor = backgroundColor
      currentLowLightCustomization.guidanceCustomization.readyScreenOvalFillColor = UIColor.clear
      currentLowLightCustomization.guidanceCustomization.readyScreenTextBackgroundColor = primaryColor
      currentLowLightCustomization.guidanceCustomization.retryScreenImageBorderColor = backgroundColor
      currentLowLightCustomization.guidanceCustomization.retryScreenOvalStrokeColor = primaryColor
      currentLowLightCustomization.guidanceCustomization.retryScreenSlideshowImages = retryScreenSlideshowImages
      // ID Scan Customization
      currentLowLightCustomization.idScanCustomization.selectionScreenDocumentImage = nil
      currentLowLightCustomization.idScanCustomization.selectionScreenBrandingImage = nil
      currentLowLightCustomization.idScanCustomization.captureScreenForegroundColor = backgroundColor
      currentLowLightCustomization.idScanCustomization.reviewScreenForegroundColor = backgroundColor
      currentLowLightCustomization.idScanCustomization.selectionScreenForegroundColor = backgroundColor
      currentLowLightCustomization.idScanCustomization.captureScreenFocusMessageTextColor = backgroundColor
      currentLowLightCustomization.idScanCustomization.buttonTextNormalColor = primaryColor
      currentLowLightCustomization.idScanCustomization.buttonBackgroundNormalColor = backgroundColor
      currentLowLightCustomization.idScanCustomization.buttonTextHighlightColor = primaryColor
      currentLowLightCustomization.idScanCustomization.buttonBackgroundHighlightColor = backgroundColor.withAlphaComponent(0.8)
      currentLowLightCustomization.idScanCustomization.buttonTextDisabledColor = primaryColor.withAlphaComponent(0.3)
      currentLowLightCustomization.idScanCustomization.buttonBackgroundDisabledColor = backgroundColor
      currentLowLightCustomization.idScanCustomization.buttonBorderColor = backgroundColor
      currentLowLightCustomization.idScanCustomization.captureScreenTextBackgroundColor = primaryColor
      currentLowLightCustomization.idScanCustomization.captureScreenTextBackgroundBorderColor = backgroundColor
      currentLowLightCustomization.idScanCustomization.reviewScreenTextBackgroundColor = primaryColor
      currentLowLightCustomization.idScanCustomization.reviewScreenTextBackgroundBorderColor = backgroundColor
      currentLowLightCustomization.idScanCustomization.captureFrameStrokeColor = primaryColor
      currentLowLightCustomization.idScanCustomization.activeTorchButtonImage = UIImage(named: "torch_active_navy")
      currentLowLightCustomization.idScanCustomization.inactiveTorchButtonImage = UIImage(named: "torch_inactive_navy")
      // OCR Confirmation Screen Customization
      currentLowLightCustomization.ocrConfirmationCustomization.mainHeaderDividerLineColor = backgroundColor
      currentLowLightCustomization.ocrConfirmationCustomization.mainHeaderTextColor = backgroundColor
      currentLowLightCustomization.ocrConfirmationCustomization.sectionHeaderTextColor = backgroundColor
      currentLowLightCustomization.ocrConfirmationCustomization.fieldLabelTextColor = backgroundColor
      currentLowLightCustomization.ocrConfirmationCustomization.fieldValueTextColor = backgroundColor
      currentLowLightCustomization.ocrConfirmationCustomization.inputFieldTextColor = backgroundColor
      currentLowLightCustomization.ocrConfirmationCustomization.inputFieldPlaceholderTextColor = backgroundColor.withAlphaComponent(0.4)
      currentLowLightCustomization.ocrConfirmationCustomization.inputFieldBackgroundColor = UIColor.clear
      currentLowLightCustomization.ocrConfirmationCustomization.inputFieldBorderColor = backgroundColor
      currentLowLightCustomization.ocrConfirmationCustomization.buttonTextNormalColor = primaryColor
      currentLowLightCustomization.ocrConfirmationCustomization.buttonBackgroundNormalColor = backgroundColor
      currentLowLightCustomization.ocrConfirmationCustomization.buttonTextHighlightColor = primaryColor
      currentLowLightCustomization.ocrConfirmationCustomization.buttonBackgroundHighlightColor = backgroundColor.withAlphaComponent(0.8)
      currentLowLightCustomization.ocrConfirmationCustomization.buttonTextDisabledColor = primaryColor.withAlphaComponent(0.3)
      currentLowLightCustomization.ocrConfirmationCustomization.buttonBackgroundDisabledColor = backgroundColor
      currentLowLightCustomization.ocrConfirmationCustomization.buttonBorderColor = backgroundColor
      // Result Screen Customization
      currentLowLightCustomization.resultScreenCustomization.foregroundColor = backgroundColor
      currentLowLightCustomization.resultScreenCustomization.activityIndicatorColor = backgroundColor
      currentLowLightCustomization.resultScreenCustomization.customActivityIndicatorImage = UIImage(named: "activity_indicator_navy")
      currentLowLightCustomization.resultScreenCustomization.resultAnimationBackgroundColor = UIColor.clear
      currentLowLightCustomization.resultScreenCustomization.resultAnimationForegroundColor = backgroundColor
      currentLowLightCustomization.resultScreenCustomization.resultAnimationSuccessBackgroundImage = UIImage(named: "reticle_navy")
      currentLowLightCustomization.resultScreenCustomization.resultAnimationUnsuccessBackgroundImage = UIImage(named: "reticle_navy")
      currentLowLightCustomization.resultScreenCustomization.uploadProgressTrackColor = UIColor.black.withAlphaComponent(0.2)
      currentLowLightCustomization.resultScreenCustomization.uploadProgressFillColor = backgroundColor
      // Feedback Customization
      currentLowLightCustomization.feedbackCustomization.backgroundColor = backgroundLayer
      currentLowLightCustomization.feedbackCustomization.textColor = primaryColor
      // Frame Customization
      currentLowLightCustomization.frameCustomization.borderColor = backgroundColor
      // Oval Customization
      currentLowLightCustomization.ovalCustomization.strokeColor = backgroundColor
      currentLowLightCustomization.ovalCustomization.progressColor1 = backgroundColor.withAlphaComponent(0.5)
      currentLowLightCustomization.ovalCustomization.progressColor2 = backgroundColor.withAlphaComponent(0.5)
      // Cancel Button Customization
      currentLowLightCustomization.cancelButtonCustomization.customImage = UIImage(named: "cancel_navy")
    }
    
    return currentLowLightCustomization
}

// Configure UX Color Scheme For Low Light Mode
class func getDynamicDimmingCustomizationForTheme(theme: String) -> FaceTecCustomization {
    var currentDynamicDimmingCustomization: FaceTecCustomization = getCustomizationForTheme(theme: theme)
    
    let retryScreenSlideshowImages = [UIImage(named: "FaceTec_ideal_1")!, UIImage(named: "FaceTec_ideal_2")!, UIImage(named: "FaceTec_ideal_3")!, UIImage(named: "FaceTec_ideal_4")!, UIImage(named: "FaceTec_ideal_5")!]

    if theme == "FaceTec Theme" {
      // ID Scan Customization
      currentDynamicDimmingCustomization.idScanCustomization.captureScreenFocusMessageTextColor = UIColor.white
      // OCR Confirmation Screen Customization
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.sectionHeaderTextColor = UIColor.white
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.fieldLabelTextColor = UIColor.white
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.fieldValueTextColor = UIColor.white
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.inputFieldTextColor = UIColor.white
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.inputFieldPlaceholderTextColor = UIColor.white.withAlphaComponent(0.4)
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.inputFieldBorderColor = UIColor.white
    }
    else if theme == "Config Wizard Theme" {
      currentDynamicDimmingCustomization = Config.retrieveDynamicDimmingConfigurationWizardCustomization()
    }
    else if theme == "Pseudo-Fullscreen" {
      let primaryColor = UIColor(red: 0.933, green: 0.965, blue: 0.973, alpha: 1) // white
      let secondaryColor = UIColor(red: 0.235, green: 0.702, blue: 0.443, alpha: 1) // green
      let backgroundColor = UIColor.black
      let backgroundLayer = CAGradientLayer.init()
      backgroundLayer.colors = [secondaryColor.cgColor, secondaryColor.cgColor]
      backgroundLayer.locations = [0,1]
      backgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
      backgroundLayer.endPoint = CGPoint.init(x: 1, y: 0)
      
      let feedbackShadow: FaceTecShadow? = nil
      let frameShadow: FaceTecShadow? = nil
      
      //
      // NOTE: For this theme, the Result Screen's activity indicator and result animations are overriden by the use of the FaceTecCustomAnimationDelegate and its methods to specify a custom UIView to display for the individual animations.
      //
      
      // Overlay Customization
      currentDynamicDimmingCustomization.overlayCustomization.brandingImage = nil
      // Guidance Customization
      currentDynamicDimmingCustomization.guidanceCustomization.foregroundColor = primaryColor
      currentDynamicDimmingCustomization.guidanceCustomization.buttonTextNormalColor = backgroundColor
      currentDynamicDimmingCustomization.guidanceCustomization.buttonBackgroundNormalColor = primaryColor
      currentDynamicDimmingCustomization.guidanceCustomization.buttonTextHighlightColor = backgroundColor
      currentDynamicDimmingCustomization.guidanceCustomization.buttonBackgroundHighlightColor = UIColor.white
      currentDynamicDimmingCustomization.guidanceCustomization.buttonTextDisabledColor = backgroundColor
      currentDynamicDimmingCustomization.guidanceCustomization.buttonBackgroundDisabledColor = primaryColor.withAlphaComponent(0.3)
      currentDynamicDimmingCustomization.guidanceCustomization.buttonBorderColor = UIColor.clear
      currentDynamicDimmingCustomization.guidanceCustomization.readyScreenOvalFillColor = UIColor.clear
      currentDynamicDimmingCustomization.guidanceCustomization.readyScreenTextBackgroundColor = backgroundColor
      currentDynamicDimmingCustomization.guidanceCustomization.retryScreenImageBorderColor = primaryColor
      currentDynamicDimmingCustomization.guidanceCustomization.retryScreenOvalStrokeColor = backgroundColor
      currentDynamicDimmingCustomization.guidanceCustomization.retryScreenSlideshowImages = retryScreenSlideshowImages
      // ID Scan Customization
      currentDynamicDimmingCustomization.idScanCustomization.selectionScreenDocumentImage = UIImage(named: "document_offwhite")
      currentDynamicDimmingCustomization.idScanCustomization.selectionScreenBrandingImage = nil
      currentDynamicDimmingCustomization.idScanCustomization.captureScreenForegroundColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.reviewScreenForegroundColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.selectionScreenForegroundColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.captureScreenFocusMessageTextColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.buttonTextNormalColor = backgroundColor
      currentDynamicDimmingCustomization.idScanCustomization.buttonBackgroundNormalColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.buttonTextHighlightColor = backgroundColor
      currentDynamicDimmingCustomization.idScanCustomization.buttonBackgroundHighlightColor = UIColor.white
      currentDynamicDimmingCustomization.idScanCustomization.buttonTextDisabledColor = backgroundColor
      currentDynamicDimmingCustomization.idScanCustomization.buttonBackgroundDisabledColor =  primaryColor.withAlphaComponent(0.3)
      currentDynamicDimmingCustomization.idScanCustomization.buttonBorderColor = UIColor.clear
      currentDynamicDimmingCustomization.idScanCustomization.captureScreenTextBackgroundColor = backgroundColor
      currentDynamicDimmingCustomization.idScanCustomization.captureScreenTextBackgroundBorderColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.reviewScreenTextBackgroundColor = backgroundColor
      currentDynamicDimmingCustomization.idScanCustomization.reviewScreenTextBackgroundBorderColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.captureFrameStrokeColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.activeTorchButtonImage = UIImage(named: "torch_active_offwhite")
      currentDynamicDimmingCustomization.idScanCustomization.inactiveTorchButtonImage = UIImage(named: "torch_inactive_offwhite")
      // OCR Confirmation Screen Customization
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.mainHeaderDividerLineColor = secondaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.mainHeaderTextColor = secondaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.sectionHeaderTextColor = primaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.fieldLabelTextColor = primaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.fieldValueTextColor = primaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.inputFieldTextColor = primaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.inputFieldPlaceholderTextColor = secondaryColor.withAlphaComponent(0.4)
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.inputFieldBackgroundColor = UIColor.clear
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.inputFieldBorderColor = secondaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.buttonTextNormalColor = backgroundColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.buttonBackgroundNormalColor = primaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.buttonTextHighlightColor = backgroundColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.buttonBackgroundHighlightColor = UIColor.white
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.buttonTextDisabledColor = backgroundColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.buttonBackgroundDisabledColor =  primaryColor.withAlphaComponent(0.3)
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.buttonBorderColor = UIColor.clear
      // Result Screen Customization
      currentDynamicDimmingCustomization.resultScreenCustomization.backgroundColors = [backgroundColor, backgroundColor]
      currentDynamicDimmingCustomization.resultScreenCustomization.foregroundColor = primaryColor
      currentDynamicDimmingCustomization.resultScreenCustomization.activityIndicatorColor = primaryColor
      currentDynamicDimmingCustomization.resultScreenCustomization.customActivityIndicatorImage = nil
      currentDynamicDimmingCustomization.resultScreenCustomization.resultAnimationBackgroundColor = secondaryColor
      currentDynamicDimmingCustomization.resultScreenCustomization.resultAnimationForegroundColor = backgroundColor
      currentDynamicDimmingCustomization.resultScreenCustomization.resultAnimationSuccessBackgroundImage = nil
      currentDynamicDimmingCustomization.resultScreenCustomization.resultAnimationUnsuccessBackgroundImage = nil
      currentDynamicDimmingCustomization.resultScreenCustomization.uploadProgressTrackColor = primaryColor.withAlphaComponent(0.2)
      currentDynamicDimmingCustomization.resultScreenCustomization.uploadProgressFillColor = secondaryColor
      // Feedback Customization
      currentDynamicDimmingCustomization.feedbackCustomization.backgroundColor = backgroundLayer
      currentDynamicDimmingCustomization.feedbackCustomization.textColor = backgroundColor
      currentDynamicDimmingCustomization.feedbackCustomization.shadow = feedbackShadow
      // Frame Customization
      currentDynamicDimmingCustomization.frameCustomization.borderColor = primaryColor
      currentDynamicDimmingCustomization.frameCustomization.shadow = frameShadow
      // Oval Customization
      currentDynamicDimmingCustomization.ovalCustomization.strokeColor = primaryColor
      currentDynamicDimmingCustomization.ovalCustomization.progressColor1 = secondaryColor.withAlphaComponent(0.7)
      currentDynamicDimmingCustomization.ovalCustomization.progressColor2 = secondaryColor.withAlphaComponent(0.7)
      // Cancel Button Customization
      currentDynamicDimmingCustomization.cancelButtonCustomization.customImage = UIImage(named: "single_chevron_left_offwhite")
      
      // Guidance Customization -- Text Style Overrides
      // Ready Screen Header
      currentDynamicDimmingCustomization.guidanceCustomization.readyScreenHeaderTextColor = primaryColor
      // Ready Screen Subtext
      currentDynamicDimmingCustomization.guidanceCustomization.readyScreenSubtextTextColor = primaryColor
      // Retry Screen Header
      currentDynamicDimmingCustomization.guidanceCustomization.retryScreenHeaderTextColor = primaryColor
      // Retry Screen Subtext
      currentDynamicDimmingCustomization.guidanceCustomization.retryScreenSubtextTextColor = primaryColor
    }
    else if theme == "Bitcoin Exchange" {
      // Overlay Customization
      currentDynamicDimmingCustomization.overlayCustomization.brandingImage = UIImage(named: "bitcoin_exchange_logo_white")
    }
    else if theme == "eKYC" {
      let primaryColor = UIColor(red: 0.929, green: 0.110, blue: 0.141, alpha: 1) // red
      let secondaryColor = UIColor.white
      let backgroundColor = UIColor.black
      let backgroundLayer = CAGradientLayer.init()
      backgroundLayer.colors = [secondaryColor.cgColor, secondaryColor.cgColor]
      backgroundLayer.locations = [0,1]
      backgroundLayer.startPoint = CGPoint.init(x: 0, y: 0)
      backgroundLayer.endPoint = CGPoint.init(x: 1, y: 0)
      
      let feedbackShadow: FaceTecShadow? = FaceTecShadow(color: primaryColor, opacity: 1, radius: 5, offset: CGSize(width: 0, height: 2), insets: UIEdgeInsets(top: 1, left: -1, bottom: -1, right: -1))
      let frameShadow: FaceTecShadow? = FaceTecShadow(color: primaryColor, opacity: 1, radius: 3, offset: CGSize(width: 0, height: 2), insets: UIEdgeInsets(top: 1, left: -1, bottom: -1, right: -1))
      
      // Overlay Customization
      currentDynamicDimmingCustomization.overlayCustomization.brandingImage = UIImage(named: "ekyc_logo_white")
      // Guidance Customization
      currentDynamicDimmingCustomization.guidanceCustomization.foregroundColor = secondaryColor
      currentDynamicDimmingCustomization.guidanceCustomization.buttonTextNormalColor = primaryColor
      currentDynamicDimmingCustomization.guidanceCustomization.buttonBackgroundNormalColor = UIColor.clear
      currentDynamicDimmingCustomization.guidanceCustomization.buttonTextHighlightColor = backgroundColor
      currentDynamicDimmingCustomization.guidanceCustomization.buttonBackgroundHighlightColor = primaryColor
      currentDynamicDimmingCustomization.guidanceCustomization.buttonTextDisabledColor = primaryColor.withAlphaComponent(0.3)
      currentDynamicDimmingCustomization.guidanceCustomization.buttonBackgroundDisabledColor = UIColor.clear
      currentDynamicDimmingCustomization.guidanceCustomization.buttonBorderColor = primaryColor
      currentDynamicDimmingCustomization.guidanceCustomization.readyScreenOvalFillColor = UIColor.clear
      currentDynamicDimmingCustomization.guidanceCustomization.readyScreenTextBackgroundColor = backgroundColor
      currentDynamicDimmingCustomization.guidanceCustomization.retryScreenImageBorderColor = primaryColor
      currentDynamicDimmingCustomization.guidanceCustomization.retryScreenOvalStrokeColor = primaryColor
      currentDynamicDimmingCustomization.guidanceCustomization.retryScreenSlideshowImages = retryScreenSlideshowImages
      // ID Scan Customization
      currentDynamicDimmingCustomization.idScanCustomization.selectionScreenDocumentImage = nil
      currentDynamicDimmingCustomization.idScanCustomization.selectionScreenBrandingImage = nil
      currentDynamicDimmingCustomization.idScanCustomization.captureScreenForegroundColor = backgroundColor
      currentDynamicDimmingCustomization.idScanCustomization.reviewScreenForegroundColor = backgroundColor
      currentDynamicDimmingCustomization.idScanCustomization.selectionScreenForegroundColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.captureScreenFocusMessageTextColor = secondaryColor
      currentDynamicDimmingCustomization.idScanCustomization.buttonTextNormalColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.buttonBackgroundNormalColor = UIColor.clear
      currentDynamicDimmingCustomization.idScanCustomization.buttonTextHighlightColor = backgroundColor
      currentDynamicDimmingCustomization.idScanCustomization.buttonBackgroundHighlightColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.buttonTextDisabledColor = primaryColor.withAlphaComponent(0.3)
      currentDynamicDimmingCustomization.idScanCustomization.buttonBackgroundDisabledColor = UIColor.clear
      currentDynamicDimmingCustomization.idScanCustomization.buttonBorderColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.captureScreenTextBackgroundColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.captureScreenTextBackgroundBorderColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.reviewScreenTextBackgroundColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.reviewScreenTextBackgroundBorderColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.captureFrameStrokeColor = primaryColor
      currentDynamicDimmingCustomization.idScanCustomization.activeTorchButtonImage = UIImage(named: "torch_active_offwhite")
      currentDynamicDimmingCustomization.idScanCustomization.inactiveTorchButtonImage = UIImage(named: "torch_inactive_offwhite")
      // OCR Confirmation Screen Customization
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.mainHeaderDividerLineColor = secondaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.mainHeaderTextColor = secondaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.sectionHeaderTextColor = primaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.fieldLabelTextColor = secondaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.fieldValueTextColor = secondaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.inputFieldTextColor = backgroundColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.inputFieldPlaceholderTextColor = backgroundColor.withAlphaComponent(0.4)
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.inputFieldBackgroundColor = secondaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.inputFieldBorderColor = primaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.buttonTextNormalColor = primaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.buttonBackgroundNormalColor = UIColor.clear
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.buttonTextHighlightColor = backgroundColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.buttonBackgroundHighlightColor = primaryColor
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.buttonTextDisabledColor = primaryColor.withAlphaComponent(0.3)
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.buttonBackgroundDisabledColor = UIColor.clear
      currentDynamicDimmingCustomization.ocrConfirmationCustomization.buttonBorderColor = primaryColor
      // Result Screen Customization
      currentDynamicDimmingCustomization.resultScreenCustomization.foregroundColor = secondaryColor
      currentDynamicDimmingCustomization.resultScreenCustomization.activityIndicatorColor = primaryColor
      currentDynamicDimmingCustomization.resultScreenCustomization.customActivityIndicatorImage = UIImage(named: "activity_indicator_red")
      currentDynamicDimmingCustomization.resultScreenCustomization.resultAnimationBackgroundColor = UIColor.clear
      currentDynamicDimmingCustomization.resultScreenCustomization.resultAnimationForegroundColor = UIColor.clear
      currentDynamicDimmingCustomization.resultScreenCustomization.resultAnimationSuccessBackgroundImage = nil
      currentDynamicDimmingCustomization.resultScreenCustomization.resultAnimationUnsuccessBackgroundImage = nil
      currentDynamicDimmingCustomization.resultScreenCustomization.uploadProgressTrackColor = UIColor.white.withAlphaComponent(0.2)
      currentDynamicDimmingCustomization.resultScreenCustomization.uploadProgressFillColor = primaryColor
      // Feedback Customization
      currentDynamicDimmingCustomization.feedbackCustomization.backgroundColor = backgroundLayer
      currentDynamicDimmingCustomization.feedbackCustomization.textColor = backgroundColor
      currentDynamicDimmingCustomization.feedbackCustomization.shadow = feedbackShadow
      // Frame Customization
      currentDynamicDimmingCustomization.frameCustomization.borderColor = primaryColor
      currentDynamicDimmingCustomization.frameCustomization.shadow = frameShadow
      // Oval Customization
      currentDynamicDimmingCustomization.ovalCustomization.strokeColor = primaryColor
      currentDynamicDimmingCustomization.ovalCustomization.progressColor1 = primaryColor.withAlphaComponent(0.5)
      currentDynamicDimmingCustomization.ovalCustomization.progressColor2 = primaryColor.withAlphaComponent(0.5)
      // Cancel Button Customization
      currentDynamicDimmingCustomization.cancelButtonCustomization.customImage = UIImage(named: "cancel_box_red")
    }
      
    return currentDynamicDimmingCustomization;
  }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
