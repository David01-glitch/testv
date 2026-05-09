import 'package:flutter/services.dart';

class PhoneService {
  static const MethodChannel _channel = MethodChannel('com.yourapp/phone');

  static Future<void> makePhoneCall(String phoneNumber) async {
    try {
      await _channel.invokeMethod('makePhoneCall', {
        'phoneNumber': phoneNumber,
      });
    } catch (e) {
      // Fallback to tel: if native method fails
      await _channel.invokeMethod('makePhoneCallFallback', {
        'phoneNumber': phoneNumber,
      });
    }
  }
}