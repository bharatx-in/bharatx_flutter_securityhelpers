import 'dart:async';

import 'package:bharatx_flutter_securityhelpers/bharatx_flutter_securityhelpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _message = "Waiting for methods to execute";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String message = "Methods executed successfully";
    try {
      await BharatXSecurityHelpers.storePartnerId("testPartnerId");
      await BharatXSecurityHelpers.storePartnerApiKey("testApiKey");
      await BharatXSecurityHelpers.storeThemeColorPreference("#000000");
    } on PlatformException {
      message = 'Failed to store BharatX preferences';
    }

    if (!mounted) return;

    setState(() {
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('$_message\n'),
        ),
      ),
    );
  }
}
