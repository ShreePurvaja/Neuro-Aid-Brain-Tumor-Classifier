import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_classification_app/pages/intro_page.dart';
import 'package:image_classification_app/pages/login_or_register_page.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context,snapshot){
          if(snapshot.hasData){
            return const IntroPage();
          }
          else{
            return const LoginOrRegisterPage();
          }
        }
      ),
    );
  }
}