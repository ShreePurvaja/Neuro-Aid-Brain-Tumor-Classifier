import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_classification_app/components/common_button.dart';
import 'package:image_classification_app/components/common_textfield.dart';
import 'package:image_classification_app/pages/forgot_pw_page.dart';



class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const  LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  
  bool  obscureText = true;

  // sign user in method
  void signUserIn() async{
    //show loading circle
    showDialog(
      context: context,
      builder:(context) {
        return const Center(
          child: CircularProgressIndicator(color: Color.fromARGB(255, 52, 4, 59),),
        );
      },
    );
    //inside try{} sign in
    try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text
    );
       Navigator.pop(context);
    } on FirebaseAuthException catch(e){
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
     
  }

  void showErrorMessage(String message){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 52, 4, 59),
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white)
            ),
          ),
        );
      });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
       
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
        
                // logo
                Image.asset('assets/neuro_aid.png',height:300),
        
                 const SizedBox(height: 30),
        
                // welcome back, you've been missed!
                const Text(
                  'Welcome Back ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 30, 63),
                    fontSize: 20,
                    fontWeight: FontWeight.w900
                  ),
                ),
        
                const SizedBox(height: 25),
        
                // username textfield
                MyTextField(
                  suffixIcon: null,
                  controller: emailController ,
                  hintText: 'Username',
                  obscureText: false,
                ),
        
                const SizedBox(height: 10),
        
                // password textfield
                MyTextField(
                  obscureText: obscureText,
                  suffixIcon: IconButton(onPressed: (){setState(() {
                    obscureText = !obscureText;
                  });}, icon:  Icon(obscureText == true ?Icons.visibility_off : Icons.visibility,color: Colors.black,)),
                  controller: passwordController,
                  hintText: 'Password',
                  
                ),

                const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap:() {
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context){
                              return const ForgotPasswordPage();
                            }
                          )
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
              ),
        
                const SizedBox(height: 25),
        
                // sign in button
                MyButton(
                  text: "Sign In",
                  onTap: signUserIn,
                ),
        
                
                const SizedBox(height: 50),
        
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap:widget.onTap ,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Color.fromARGB(255, 46, 2, 62),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
