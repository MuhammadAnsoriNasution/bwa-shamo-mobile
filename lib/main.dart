// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shamo_mobile/provider/auth_provider.dart';
import 'package:shamo_mobile/provider/cart_provider.dart';
import 'package:shamo_mobile/provider/page_provider.dart';
import 'package:shamo_mobile/provider/product_provider.dart';
import 'package:shamo_mobile/provider/transaction_provider.dart';
import 'package:shamo_mobile/provider/wishlist_provider.dart';
import 'package:shamo_mobile/screens/cart_screen.dart';
import 'package:shamo_mobile/screens/checkout_screen.dart';
import 'package:shamo_mobile/screens/checkout_success_screen.dart';
import 'package:shamo_mobile/screens/edit_profile_screen.dart';
import 'package:shamo_mobile/screens/home/main_screen.dart';
import 'package:shamo_mobile/screens/signin_screen.dart';
import 'package:shamo_mobile/screens/signup_screen.dart';
import 'package:shamo_mobile/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
        ChangeNotifierProvider(create: (_) => PageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/sign-in': (context) => SigninScreen(),
        '/sign-up': (context) => SignupScreen(),
        '/home': (context) => MainScreen(),
        // '/detail-chat': (context) => DetailChatScreen(),
        '/edit-profile': (context) => EditProfileScreen(),
        // '/product': (context) => ProductScreen(),
        '/cart': (context) => CartScreen(),
        '/checkout': (context) => CheckoutScreen(),
        '/checkout-success': (context) => CheckoutSuccessScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Halo semuanya',
          style: GoogleFonts.acme(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
