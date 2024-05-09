import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';

import 'cubit/auth_cubit.dart';
import 'cubit/pages_cubit.dart';
import 'ui/pages/sign_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Stripe.publishableKey =
  //     "pk_test_51OkT77DxT1qrOkWf1taFfUKLDm4C2azchhe2FK2xponqNFmZy624SGe7Rx49k3pwOvjAoKc31UYkiVbt2etY9zB300mnMy3KKm";

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Future<Map<String, dynamic>> createPaymentIntent() async {
  //   try {
  //     Map<String, dynamic> body = {
  //       "amount": "1000",
  //       "currency": "USD",
  //     };

  //     http.Response response = await http.post(
  //       Uri.parse("https://api.stripe.com/v1/payment_intents"),
  //       body: body,
  //       headers: {
  //         "Authorization":
  //             "Bearer sk_test_51OkT77DxT1qrOkWfHqSWfM64Gj6A5p2XPkaPD7PGlb41c0kgNSSduobRA1uTpwKOGfMgPjukHtVxTW62HbwowISt00Pvv7y4Y3",
  //         "Content-Type": "application/x-www-form-urlencoded",
  //       },
  //     );
  //     return json.decode(response.body);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  // Future<void> makePayment() async {
  //   try {
  //     Map<String, dynamic>? paymentIntent = await createPaymentIntent();
  //     var gpay = const PaymentSheetGooglePay(
  //       merchantCountryCode: "US",
  //       currencyCode: "US",
  //       testEnv: true,
  //     );
  //     await Stripe.instance.initPaymentSheet(
  //       paymentSheetParameters: SetupPaymentSheetParameters(
  //         paymentIntentClientSecret: paymentIntent!["client_secret"],
  //         style: ThemeMode.dark,
  //         merchantDisplayName: "Sabir",
  //         googlePay: gpay,
  //       ),
  //     );
  //     await displayPaymentSheet();
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  // Future<void> displayPaymentSheet() async {
  //   try {
  //     await Stripe.instance.presentPaymentSheet();
  //     if (kDebugMode) {
  //       print('Done');
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error: $e');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PagesCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInPage(
          controller: TextEditingController(),
        ),
      ),
    );
  }
}
