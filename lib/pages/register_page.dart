import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_classification_app/components/common_button.dart';
import 'package:image_classification_app/components/common_textfield.dart';




class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const  RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscureText = true;

  // sign user up method
  void signUserUp() async{
    //show loading circle
    showDialog(
      context: context,
      builder:(context) {
        return const Center(
          child: CircularProgressIndicator(color: Color.fromARGB(255, 52, 4, 59),),
        );
      },
    );
    //inside try{} creating user
    try{
       
    //check for password confirmation
    if(passwordController.text != confirmPasswordController.text){
         Navigator.pop(context);
     showErrorMessage("Password Mismatch");
    }else{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text
    );
    Navigator.pop(context);
    }
    
    
   
    
    } on FirebaseAuthException catch(e){
      Navigator.pop(context);
        //show error message
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
        padding: const EdgeInsets.only(bottom: 25),
       
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
                  'Register Now ',
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
        
                // confirm password textfield
                MyTextField(
                  obscureText: obscureText,
                  suffixIcon: IconButton(onPressed: (){setState(() {
                    obscureText = !obscureText;
                  });}, icon:  Icon(obscureText == true ?Icons.visibility_off : Icons.visibility,color: Colors.black,)),
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  
                ),
        
               
        
                const SizedBox(height: 25),
        
                // sign in button
                MyButton(
                  text:"sign Up",
                  onTap: signUserUp,
                ),
        
                
                const SizedBox(height: 30),
        
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Aldready have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap:widget.onTap ,
                      child: const Text(
                        'Login now',
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
