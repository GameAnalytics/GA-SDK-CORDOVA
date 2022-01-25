package com.gameanalytics.sdk.cordova;

import com.gameanalytics.sdk.GameAnalytics;

import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class GameAnalyticsCordova extends CordovaPlugin
{
    private CordovaInterface mCordova;
    private static final String VERSION = "4.2.5";

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView)
    {
        super.initialize(cordova, webView);
        mCordova = cordova;
    }

    @Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException
    {
        if(action.equals("configureAvailableCustomDimensions01"))
        {
            JSONArray jsonArray = data.optJSONArray(0);

            ArrayList<String> array = new ArrayList<String>();

            if(jsonArray != null)
            {
                for(int i = 0; i < jsonArray.length(); ++i)
                {
                    array.add(jsonArray.optString(i, ""));
                }
            }

            GameAnalytics.configureAvailableCustomDimensions01(array.toArray(new String[0]));
            callbackContext.success();
            return true;
        }
        else if(action.equals("configureAvailableCustomDimensions02"))
        {
            JSONArray jsonArray = data.optJSONArray(0);

            ArrayList<String> array = new ArrayList<String>();

            if(jsonArray != null)
            {
                for(int i = 0; i < jsonArray.length(); ++i)
                {
                    array.add(jsonArray.optString(i, ""));
                }
            }

            GameAnalytics.configureAvailableCustomDimensions02(array.toArray(new String[0]));
            callbackContext.success();
            return true;
        }
        else if(action.equals("configureAvailableCustomDimensions03"))
        {
            JSONArray jsonArray = data.optJSONArray(0);

            ArrayList<String> array = new ArrayList<String>();

            if(jsonArray != null)
            {
                for(int i = 0; i < jsonArray.length(); ++i)
                {
                    array.add(jsonArray.optString(i, ""));
                }
            }

            GameAnalytics.configureAvailableCustomDimensions03(array.toArray(new String[0]));
            callbackContext.success();
            return true;
        }
        else if(action.equals("configureAvailableResourceCurrencies"))
        {
            JSONArray jsonArray = data.optJSONArray(0);

            ArrayList<String> array = new ArrayList<String>();

            if(jsonArray != null)
            {
                for(int i = 0; i < jsonArray.length(); ++i)
                {
                    array.add(jsonArray.optString(i, ""));
                }
            }

            GameAnalytics.configureAvailableResourceCurrencies(array.toArray(new String[0]));
            callbackContext.success();
            return true;
        }
        else if(action.equals("configureAvailableResourceItemTypes"))
        {
            JSONArray jsonArray = data.optJSONArray(0);

            ArrayList<String> array = new ArrayList<String>();

            if(jsonArray != null)
            {
                for(int i = 0; i < jsonArray.length(); ++i)
                {
                    array.add(jsonArray.optString(i, ""));
                }
            }

            GameAnalytics.configureAvailableResourceItemTypes(array.toArray(new String[0]));
            callbackContext.success();
            return true;
        }
        else if(action.equals("configureBuild"))
        {
            String build = data.optString(0, "");
            GameAnalytics.configureBuild(build);
            callbackContext.success();
            return true;
        }
        else if(action.equals("configureAutoDetectAppVersion"))
        {
            boolean flag = data.optBoolean(0, false);
            GameAnalytics.configureAutoDetectAppVersion(flag);
            callbackContext.success();
            return true;
        }
        else if(action.equals("configureUserId"))
        {
            String uId = data.optString(0, "");
            GameAnalytics.configureUserId(uId);
            callbackContext.success();
            return true;
        }
        else if(action.equals("initialize"))
        {
            JSONObject args = data.optJSONObject(0);
            String gameKey = "";
            String gameSecret = "";
            String sdkVersion = "cordova " + VERSION;
            //String sdkVersion = "";

            if(args != null)
            {
                gameKey = args.optString("gameKey", "");
                gameSecret = args.optString("secretKey", "");
                sdkVersion = args.optString("sdkVersion", "cordova " + VERSION);
                //sdkVersion = args.optString("sdkVersion", "");
            }

            GameAnalytics.configureSdkGameEngineVersion(sdkVersion);
            //GameAnalytics.configureGameEngineVersion("cordova " + VERSION);
            GameAnalytics.initialize(mCordova.getActivity(), gameKey, gameSecret);
            callbackContext.success();
            return true;
        }
        else if(action.equals("addBusinessEvent"))
        {
            JSONObject args = data.optJSONObject(0);
            String currency = "";
            int amount = 0;
            String itemType = "";
            String itemId = "";
            String cartType = "";
            String receipt = "";
            String signature = "";
            String fields = "";
            boolean mergeFields = false;

            if(args != null)
            {
                currency = args.optString("currency", "");
                amount = args.optInt("amount", 0);
                itemType = args.optString("itemType", "");
                itemId = args.optString("itemId", "");
                cartType = args.optString("cartType", "");
                receipt = args.optString("receipt", "");
                signature = args.optString("signature", "");
                fields = args.optString("customFields", "");
                mergeFields = args.optBoolean("mergeFields", false);
            }

            if(receipt.length() > 0 && signature.length() > 0)
            {
                GameAnalytics.addBusinessEvent(currency, amount, itemType, itemId, cartType, receipt, "google_play", signature,
                        fields, mergeFields);
            }
            else
            {
                GameAnalytics.addBusinessEvent(currency, amount, itemType, itemId, cartType, fields, mergeFields);
            }

            callbackContext.success();
            return true;
        }
        else if(action.equals("addResourceEvent"))
        {
            JSONObject args = data.optJSONObject(0);
            int flowType = 0;
            String currency = "";
            float amount = 0;
            String itemType = "";
            String itemId = "";
            String fields = "";
            boolean mergeFields = false;

            if(args != null)
            {
                flowType = args.optInt("flowType", 0);
                currency = args.optString("currency", "");
                amount = (float)args.optDouble("amount", 0);
                itemType = args.optString("itemType", "");
                itemId = args.optString("itemId", "");
                fields = args.optString("customFields", "");
                mergeFields = args.optBoolean("mergeFields", false);
            }

            GameAnalytics.addResourceEvent(flowType, currency, amount, itemType, itemId, fields, mergeFields);
            callbackContext.success();
            return true;
        }
        else if(action.equals("addProgressionEvent"))
        {
            JSONObject args = data.optJSONObject(0);
            int progressionStatus = 0;
            String progression01 = "";
            String progression02 = "";
            String progression03 = "";
            double score = 0;
            boolean sendScore = false;
            String fields = "";
            boolean mergeFields = false;

            if(args != null)
            {
                progressionStatus = args.optInt("progressionStatus", 0);
                progression01 = args.optString("progression01", "");
                progression02 = args.optString("progression02", "");
                progression03 = args.optString("progression03", "");
                score = args.optInt("score", 0);
                sendScore = args.has("score");
                fields = args.optString("customFields", "");
                mergeFields = args.optBoolean("mergeFields", false);
            }

            if(sendScore)
            {
                GameAnalytics.addProgressionEvent(progressionStatus, progression01, progression02, progression03, score,
                        fields, mergeFields);
            }
            else
            {
                GameAnalytics.addProgressionEvent(progressionStatus, progression01, progression02, progression03,
                        fields, mergeFields);
            }

            callbackContext.success();
            return true;
        }
        else if(action.equals("addDesignEvent"))
        {
            JSONObject args = data.optJSONObject(0);
            String eventId = "";
            double value = 0;
            boolean sendValue = false;
            String fields = "";
            boolean mergeFields = false;

            if(args != null)
            {
                eventId = args.optString("eventId", "");
                value = args.optDouble("value", 0);
                sendValue = args.has("value");
                fields = args.optString("customFields", "");
                mergeFields = args.optBoolean("mergeFields", false);
            }

            if(sendValue)
            {
                GameAnalytics.addDesignEvent(eventId, value, fields, mergeFields);
            }
            else
            {
                GameAnalytics.addDesignEvent(eventId, fields, mergeFields);
            }

            callbackContext.success();
            return true;
        }
        else if(action.equals("addErrorEvent"))
        {
            JSONObject args = data.optJSONObject(0);
            int severity = 0;
            String message = "";
            String fields = "";
            boolean mergeFields = false;

            if(args != null)
            {
                severity = args.optInt("severity", 0);
                message = args.optString("message", "");
                fields = args.optString("customFields", "");
                mergeFields = args.optBoolean("mergeFields", false);
            }

            GameAnalytics.addErrorEvent(severity, message, fields, mergeFields);
            callbackContext.success();
            return true;
        }
        else if(action.equals("addAdEvent"))
        {
            JSONObject args = data.optJSONObject(0);
            int adAction = 0;
            int adType = 0;
            String adSdkName = "";
            String adPlacement = "";
            long duration = 0;
            boolean sendDuration = false;
            int noAdReason = 0;
            String fields = "";
            boolean mergeFields = false;

            if(args != null)
            {
                adAction = args.optInt("adAction", 0);
                adType = args.optInt("adType", 0);
                adSdkName = args.optString("adSdkName", "");
                adPlacement = args.optString("adPlacement", "");
                duration = args.optLong("duration", 0);
                sendDuration = args.has("duration");
                noAdReason = args.optInt("noAdReason", 0);
                fields = args.optString("customFields", "");
                mergeFields = args.optBoolean("mergeFields", false);
            }

            if(sendDuration)
            {
                GameAnalytics.addAdEvent(adAction, adType, adSdkName, adPlacement, duration, fields, mergeFields);
            }
            else
            {
                GameAnalytics.addAdEvent(adAction, adType, adSdkName, adPlacement, noAdReason, fields, mergeFields);
            }

            callbackContext.success();
            return true;
        }
        else if(action.equals("setEnabledInfoLog"))
        {
            boolean flag = data.optBoolean(0, false);
            GameAnalytics.setEnabledInfoLog(flag);
            callbackContext.success();
            return true;
        }
        else if(action.equals("setEnabledVerboseLog"))
        {
            boolean flag = data.optBoolean(0, false);
            GameAnalytics.setEnabledVerboseLog(flag);
            callbackContext.success();
            return true;
        }
        else if(action.equals("setEnabledManualSessionHandling"))
        {
            boolean flag = data.optBoolean(0, false);
            GameAnalytics.setEnabledManualSessionHandling(flag);
            callbackContext.success();
            return true;
        }
        else if(action.equals("setEnabledEventSubmission"))
        {
            boolean flag = data.optBoolean(0, true);
            GameAnalytics.setEnabledEventSubmission(flag);
            callbackContext.success();
            return true;
        }
        else if(action.equals("setCustomDimension01"))
        {
            String dimension = data.optString(0, "");
            GameAnalytics.setCustomDimension01(dimension);
            callbackContext.success();
            return true;
        }
        else if(action.equals("setCustomDimension02"))
        {
            String dimension = data.optString(0, "");
            GameAnalytics.setCustomDimension02(dimension);
            callbackContext.success();
            return true;
        }
        else if(action.equals("setCustomDimension03"))
        {
            String dimension = data.optString(0, "");
            GameAnalytics.setCustomDimension03(dimension);
            callbackContext.success();
            return true;
        }
        else if (action.equals("setGlobalCustomEventFields"))
        {
            String customFields = data.optString(0, "");
            GameAnalytics.setGlobalCustomEventFields(customFields);
            callbackContext.success();
            return true;
        }
        else if(action.equals("startSession"))
        {
            GameAnalytics.startSession();
            callbackContext.success();
            return true;
        }
        else if(action.equals("endSession"))
        {
            GameAnalytics.endSession();
            callbackContext.success();
            return true;
        }
        else if(action.equals("getRemoteConfigsValueAsString"))
        {
            JSONObject args = data.optJSONObject(0);
            String key = "";
            String defaultValue = null;

            if(args != null)
            {
                key = args.optString("key", "");
                defaultValue = args.optString("defaultValue", null);
            }

            String result = null;
            if(defaultValue != null)
            {
                result = GameAnalytics.getRemoteConfigsValueAsString(key, defaultValue);
            }
            else
            {
                result = GameAnalytics.getRemoteConfigsValueAsString(key);
            }
            callbackContext.sendPluginResult(new PluginResult(Status.OK, result));
            return true;
        }
        else if(action.equals("isRemoteConfigsReady"))
        {
            boolean result = GameAnalytics.isRemoteConfigsReady();
            callbackContext.sendPluginResult(new PluginResult(Status.OK, result));
            return true;
        }
        else if(action.equals("getRemoteConfigsContentAsString"))
        {
            String result = GameAnalytics.getRemoteConfigsContentAsString();
            callbackContext.sendPluginResult(new PluginResult(Status.OK, result));
            return true;
        }
        else if(action.equals("getABTestingId"))
        {
            String result = GameAnalytics.getABTestingId();
            callbackContext.sendPluginResult(new PluginResult(Status.OK, result));
            return true;
        }
        else if(action.equals("getABTestingVariantId"))
        {
            String result = GameAnalytics.getABTestingVariantId();
            callbackContext.sendPluginResult(new PluginResult(Status.OK, result));
            return true;
        }

        return false;
    }
}
