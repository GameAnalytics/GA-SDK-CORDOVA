package com.gameanalytics.sdk.cordova;

import com.gameanalytics.sdk.GameAnalytics;

import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class GameAnalyticsCordova extends CordovaPlugin
{
    private CordovaInterface mCordova;
    private static final String VERSION = "1.0.2";

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
                    array.add(jsonArray.getString(i));
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
                    array.add(jsonArray.getString(i));
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
                    array.add(jsonArray.getString(i));
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
                    array.add(jsonArray.getString(i));
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
                    array.add(jsonArray.getString(i));
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

            if(args != null)
            {
                gameKey = args.optString("gameKey", "");
                gameSecret = args.optString("secretKey", "");
            }

            GameAnalytics.configureSdkGameEngineVersion("cordova " + VERSION);
            //GameAnalytics.configureGameEngineVersion("cordova " + VERSION);
            GameAnalytics.initializeWithGameKey(mCordova.getActivity(), gameKey, gameSecret);
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

            if(args != null)
            {
                currency = args.optString("currency", "");
                amount = args.optInt("amount", 0);
                itemType = args.optString("itemType", "");
                itemId = args.optString("itemId", "");
                cartType = args.optString("cartType", "");
                receipt = args.optString("receipt", "");
                signature = args.optString("signature", "");
            }

            if(receipt.length() > 0 && signature.length() > 0)
            {
                GameAnalytics.addBusinessEventWithCurrency(currency, amount, itemType, itemId, cartType, receipt, "google_play", signature);
            }
            else
            {
                GameAnalytics.addBusinessEventWithCurrency(currency, amount, itemType, itemId, cartType);
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

            if(args != null)
            {
                flowType = args.optInt("flowType", 0);
                currency = args.optString("currency", "");
                amount = (float)args.optDouble("amount", 0);
                itemType = args.optString("itemType", "");
                itemId = args.optString("itemId", "");
            }

            GameAnalytics.addResourceEventWithFlowType(flowType, currency, amount, itemType, itemId);
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

            if(args != null)
            {
                progressionStatus = args.optInt("progressionStatus", 0);
                progression01 = args.optString("progression01", "");
                progression02 = args.optString("progression02", "");
                progression03 = args.optString("progression03", "");
                score = args.optInt("score", 0);
                sendScore = args.has("score");
            }

            if(sendScore)
            {
                GameAnalytics.addProgressionEventWithProgressionStatus(progressionStatus, progression01, progression02, progression03, score);
            }
            else
            {
                GameAnalytics.addProgressionEventWithProgressionStatus(progressionStatus, progression01, progression02, progression03);
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

            if(args != null)
            {
                eventId = args.optString("eventId", "");
                value = args.optDouble("value", 0);
                sendValue = args.has("value");
            }

            if(sendValue)
            {
                GameAnalytics.addDesignEventWithEventId(eventId, value);
            }
            else
            {
                GameAnalytics.addDesignEventWithEventId(eventId);
            }

            callbackContext.success();
            return true;
        }
        else if(action.equals("addErrorEvent"))
        {
            JSONObject args = data.optJSONObject(0);
            int severity = 0;
            String message = "";

            if(args != null)
            {
                severity = args.optInt("severity", 0);
                message = args.optString("message", "");
            }

            GameAnalytics.addErrorEventWithSeverity(severity, message);
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
        else if(action.equals("setFacebookId"))
        {
            String facebookId = data.optString(0, "");
            GameAnalytics.setFacebookId(facebookId);
            callbackContext.success();
            return true;
        }
        else if(action.equals("setGender"))
        {
            int gender = data.optInt(0, 0);
            GameAnalytics.setGender(gender);
            callbackContext.success();
            return true;
        }
        else if(action.equals("setBirthYear"))
        {
            int birthYear = data.optInt(0, 0);
            GameAnalytics.setBirthYear(birthYear);
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

        return false;
    }
}
