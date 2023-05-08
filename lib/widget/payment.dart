import 'dart:convert';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Payment extends GetConnect implements GetxService {
 static Map<String, dynamic>? paymentIntent;
 static bool paymentSuccess = false;

  static Future<void> makePayment(String amount, String currency) async {
    try {
      Get.snackbar('Payment Info', 'Payment running');
      paymentIntent = await createPaymentIntent(amount, currency);
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Payment Test',
        paymentIntentClientSecret: paymentIntent!['client_secret'],
        customerId: paymentIntent!['customer'],
        customerEphemeralKeySecret: paymentIntent!['ephemeral_key'],
        googlePay: const PaymentSheetGooglePay(merchantCountryCode: 'IN'),
        // applePay: PaymentSheetApplePay(merchantCountryCode: '+92',),
      ));
      disPlayPaymentSheet();
    } catch (e, s) {
      print('Error  ====>>  $e   &&&&&    $s');
    }
  }

 static createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'bearer sk_test_51N3ULMAji0asKPfheDPh8tdyG79vC6YH3Wham5knnW72VHxCXbpHAsflUgivwarcZcdObsnqgUgH5Ewbh3E94K4j00ddsHsmd8',
            'Content-Type':'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      print('error charging user ==>>>>  $err');
    }
  }

  static disPlayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      paymentSuccess = true;
      Get.snackbar('Payment Info', 'Payment Successful');
    } on Exception catch (e) {
      if (e is StripeException) {
        print('error from Stripe ==>>>>  $e');
      } else {
        print('error unforeseen  ==>>>>  $e');
      }
    } catch (e) {
      print('Exception ==>>>>  $e');
    }
  }

  static calculateAmount(String amount) {
    final fAmount = (int.parse(amount))*100;
    return fAmount.toString();
  }
}
