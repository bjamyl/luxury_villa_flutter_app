import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'screens/home.dart';
import 'screens/signin_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/listing_detail_screen.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';
import './providers/listings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Auth()),
        ChangeNotifierProvider(create: (ctx) => Listings())
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Inter',
            primarySwatch: Colors.blue,
          ),
          home: auth.isAuth ? TabsScreen() : OnboardingScreen(),
          routes: {
            TabsScreen.routeName: (context) => const TabsScreen(),
            Home.routeName: (context) => const Home(),
            SignInScreen.routeName: (context) => const SignInScreen(),
            // ignore: equal_keys_in_map
            SignUpScreen.routeName: (context) => const SignUpScreen(),
            ListingDetailScreen.routeName: (context) =>
                const ListingDetailScreen(),
          },
        ),
      ),
    );
  }
}
