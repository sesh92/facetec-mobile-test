package com.mobile;

import static java.util.UUID.randomUUID;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Promise;

import Processors.AuthenticateProcessor;
import Processors.EnrollmentProcessor;
import Processors.ProcessPromise;
import Processors.Processor;



public class FacetecModule extends ReactContextBaseJavaModule {
    public static final String REACT_CLASS = "Facetec";
    public Processor latestProcessor;
    public FacetecUtilities utils;
    private ReactContext context;
    private boolean isSessionPreparingToLaunch = false;


    FacetecModule(ReactApplicationContext context) {
        super(context);
        this.context = context;
        utils = new FacetecUtilities(context);
    }

    @NonNull
    @Override
    public String getName() {
        return REACT_CLASS;
    }

    @ReactMethod
    public void initialize(Promise promise) {
        utils.initialize(promise);
    }

    @ReactMethod
    public void enroll(Promise promise) {
        isSessionPreparingToLaunch = true;
        try {
            utils.getSessionToken(new FacetecUtilities.SessionTokenCallback() {
                @Override
                public void onSessionTokenReceived(String sessionToken) {
                    isSessionPreparingToLaunch = false;
                    utils.setLatestExternalDatabaseRefID("android_sample_app_" + randomUUID());
                    latestProcessor = new EnrollmentProcessor(sessionToken, utils, context.getCurrentActivity());
                    latestProcessor.finishedCallback(new ProcessPromise() {
                      @Override
                      public void resolve(@NonNull String message) {
                        promise.resolve(message);
                      }
                      @Override
                      public void reject(Error error) {
                        promise.reject(error);
                      }
                    });

                }
            });
        } catch (Error e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void authenticate(Promise promise) {
        isSessionPreparingToLaunch = true;

        if(utils.getLatestExternalDatabaseRefID().length() == 0){
            promise.reject(new Error("Please enroll first before trying authentication."));
            return;
        }

        try {
            utils.getSessionToken(new FacetecUtilities.SessionTokenCallback() {
                @Override
                public void onSessionTokenReceived(String sessionToken) {
                    isSessionPreparingToLaunch = false;
                    latestProcessor = new AuthenticateProcessor( sessionToken, utils, context.getCurrentActivity());
                    latestProcessor.finishedCallback(new ProcessPromise() {
                      @Override
                      public void resolve(@NonNull String message) {
                        promise.resolve(message);
                      }
                      @Override
                      public void reject(Error error) {
                        promise.reject(error);
                      }
                    });
                }
            });
        } catch (Error e) {
            promise.reject(e);
        }
    }
}
