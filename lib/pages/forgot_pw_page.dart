import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_classification_app/components/common_textfield.dart';
import 'package:image_classification_app/styles/styles.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  //text editing controller
final emailController = TextEditingController();

@override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }


  
  void passwordReset() async{
    try{
      await FirebaseAuth.instance.
      sendPasswordResetEmail(
        email:emailController.text
      );
    }on FirebaseAuthException catch(e){
      print(e);
       showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            content: Text(e.message.toString()),
            backgroundColor: const Color.fromARGB(255, 52, 4, 59),
          );
        });
    }
  }

 
  
  



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
      title: const Text('Help with Password',style: kTitleTextStyle,),
      ),
      body: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Column(
            
            children: [
              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
                child:  Text(
                  "Enter your email we will send you a password reset link",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: kDisplayFont,
                    fontWeight: FontWeight.w600
                  ),
                  ),
              ),
        
              const SizedBox(height:20),
        
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MyTextField(
                            suffixIcon: null,
                            controller: emailController ,
                            hintText: 'Enter the email',
                            obscureText: false,
                          ),
              ),
              const SizedBox(height: 15,),
              MaterialButton(
                onPressed:passwordReset,
                color: const Color.fromARGB(255, 52, 4, 59),
                child: const Text('Reset Password',style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
}