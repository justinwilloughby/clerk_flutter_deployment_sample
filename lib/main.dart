import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  const clerkPublishableKey = String.fromEnvironment('clerkPublishableKey');

  if (clerkPublishableKey.isEmpty) {
    throw Exception('clerkPublishableKey is not set');
  }

  runApp(const MainApp(clerkPublishableKey: clerkPublishableKey));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.clerkPublishableKey});

  final String clerkPublishableKey;

  @override
  Widget build(BuildContext context) {
    return ClerkAuth(
      config: ClerkAuthConfig(publishableKey: clerkPublishableKey),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: ClerkErrorListener(
              child: ClerkAuthBuilder(
                signedInBuilder: (context, authState) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: const ClerkUserButton(),
                  );
                },
                signedOutBuilder: (context, authState) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: const ClerkAuthentication(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
