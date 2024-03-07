import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:twitter_clone_2/env.dart';

class UpgradeAccountRepository {
  Future<bool> makePayment() async {
    try {
      final paymentIntentData = await createPaymentIntent('200', 'USD');
      const gpay = PaymentSheetGooglePay(
        merchantCountryCode: "US",
        currencyCode: "USD",
        testEnv: true,
      );
      if (paymentIntentData == null) return false;

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          googlePay: gpay,
          merchantDisplayName: 'Adiwele',
          paymentIntentClientSecret: paymentIntentData['client_secret'],
          customerEphemeralKeySecret: paymentIntentData['ephemeralKey'],
        ),
      );

      return true;
    } catch (e) {
      debugPrint('upgrade_account_error:$e');
      return false;
    }
  }

  Future<Map<String, dynamic>?> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      final dio = Dio();
      final response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        data: body, // Pass the request body directly
        options: Options(
          // Set headers and other options
          headers: {
            'Authorization': 'Bearer $stripeSecretKey',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );

      return response.data;
    } catch (e) {
      debugPrint('zo catch error  createpayment');
      debugPrint(e.toString());
      return null;
    }
  }
}
