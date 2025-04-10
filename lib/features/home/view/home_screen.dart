import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushNamedAndRemoveUntil(
              'login',
              (route) => false,
            );
          },
          icon: Icon(
            Icons.output,
          ),
        ),
      ),
      body: Center(
        child: Text("🎉 مرحبًا بك في الصفحة الرئيسية!"),
      ),
    );
  }
}
