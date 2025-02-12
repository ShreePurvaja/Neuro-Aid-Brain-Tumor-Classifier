import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_classification_app/Mri_widgets/mri_recogniser.dart';
import 'package:image_classification_app/pages/auth_page.dart';
import 'package:image_classification_app/pages/cancer_survivors.dart';
import 'package:image_classification_app/pages/chat_screen.dart';
import 'package:image_classification_app/pages/faqs_page.dart';
import 'package:image_classification_app/pages/intro_page.dart';
import 'package:image_classification_app/styles/styles.dart';

class CommonAppBarWithDrawer extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final Color titleColor;

  const CommonAppBarWithDrawer({Key? key, required this.appBarTitle, required this.titleColor})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarTitle,
        style: kTitleTextStyle
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            // Navigate to the ChatScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const ChatScreen();
              }),
            );
          },
          icon: const Icon(Icons.chat_bubble_outlined, color: Color.fromARGB(255, 52, 4, 59)),
        ),
      ],
    );
  }
}

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({Key? key}) : super(key: key);


  @override
Widget build(BuildContext context) {
  return Drawer(
    backgroundColor: Colors.white,
    width: 260,
    child: ListView(
      padding: EdgeInsets.zero, 
      children: [
        DrawerHeader(
          margin: EdgeInsets.zero, 
          padding: EdgeInsets.zero, 
          decoration: const BoxDecoration(
            color: Colors.white, 
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent), 
              ),
              child: Image.asset(
                'assets/brain_heal.avif',
                width: double.infinity, 
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.black, 
          thickness: 2, 
          height: 1, 
        ),
        const SizedBox(height: 20), 
        GestureDetector(
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const IntroPage();
            }));
          } ,
          child: const ListTile(
            leading: Icon(Icons.info,color: Colors.black,),
            title:  Text(
              'NEURO-AID CARE',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 10), 
        GestureDetector(
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return BrainTumorFAQPage();
            }));
          } ,
          child: const ListTile(
            leading:Icon(Icons.question_answer, color: Colors.black),
            
            title:Text(
              'FAQ\'s',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const MRIRecogniser();
            }));
          } ,
          child: const ListTile(
            leading: Icon(Icons.medical_services,color: Colors.black,),
            title:  Text(
              'TUMOR DETECTOR',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 10),
       
        GestureDetector(
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const SurvivorStoriesPage();
            }));
          } ,
          child: const ListTile(
            leading:Icon(Icons.handshake, color: Colors.black),
            
            title:Text(
              'SEEDS OF HOPE',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ), 
        const SizedBox(height:10),
        
       GestureDetector(
        onTap: () async {
  try {
    await FirebaseAuth.instance.signOut();
    // Navigate to the AuthPage to handle redirection
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const AuthPage()),
      (route) => false,
    );
  } catch (e) {
    // Handle errors if needed
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error signing out: $e")),
    );
  }
},
         child: const  ListTile(
            leading: Icon(Icons.logout, color: Colors.black),
            title: Text(
              'SIGN OUT',
              style: TextStyle(color: Colors.black),
            ),
          ),
       ),
        const SizedBox(height: 20), 
      ],
    ),
  );
}
}


