import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';

class BharatXSecurityHelpers {
  static const String _signature = "flutter.bharatx.tech/securityhelpers";
  static const MethodChannel _channel = const MethodChannel(_signature);

  static Future<void> storePartnerId(String partnerId) async {
    await _channel.invokeMethod('storePartnerId', {"partnerId": partnerId});
  }

  static Future<void> storePartnerApiKey(String partnerApiKey) async {
    await _channel
        .invokeMethod('storePartnerApiKey', {"partnerApiKey": partnerApiKey});
  }

  static Future<void> storeThemeColorPreference(dynamic color) async {
    String colorString = "#00000000";
    if (color is int) {
      colorString = "#" + color.toRadixString(16);
    } else if (color is Color) {
      colorString = "#" + color.value.toRadixString(16);
    } else if (color is String) {
      colorString = color;
      if (!colorString.startsWith("#")) {
        colorString = "#$colorString";
      }
    }
    if (colorString != "#00000000") {
      await _channel
          .invokeMethod('storeThemeColorPreference', {"color": colorString});
    }
  }
}
