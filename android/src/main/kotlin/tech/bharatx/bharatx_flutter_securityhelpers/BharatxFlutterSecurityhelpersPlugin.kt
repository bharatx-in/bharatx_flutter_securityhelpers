package tech.bharatx.bharatx_flutter_securityhelpers

import android.content.Context
import android.graphics.Color
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import tech.bharatx.securityhelpers.SecurityStorageManager

/** BharatxFlutterSecurityhelpersPlugin */
class BharatxFlutterSecurityhelpersPlugin : FlutterPlugin, MethodCallHandler {
  private val signature = "flutter.bharatx.tech/securityhelpers"
  private lateinit var channel: MethodChannel
  private lateinit var applicationContext: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, signature)
    channel.setMethodCallHandler(this)
    applicationContext = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "storePartnerId" -> {
        SecurityStorageManager.storePartnerId(applicationContext,
            call.argument<String>("partnerId")!!)
      }
      "storePartnerApiKey" -> {
        SecurityStorageManager.storePartnerApiKey(applicationContext,
            call.argument<String>("partnerApiKey")!!)
      }
      "storeThemeColorPreference" -> {
        SecurityStorageManager.storeThemeColorPreference(applicationContext,
            Color.parseColor(call.argument<String>("color")))
      }
      else -> {
        result.notImplemented()
      }
    }
    result.success(null)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
