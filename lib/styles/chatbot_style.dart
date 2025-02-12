import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_classification_app/styles/chat_font_size.dart';



Color background = Colors.white;
Color userChat = const Color.fromARGB(255, 52, 4, 59);
Color resChat = const Color(0xFF243647);
Color chatColor = const Color(0xFF47698A);
var white = const Color(0xFFFFFFFF);
Color hintColor =  Colors.white;

TextStyle messageText = GoogleFonts.poppins(color: white, fontSize: small);
TextStyle appBarTitle = GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold);
TextStyle hintText = GoogleFonts.poppins(color: hintColor, fontSize: small);
TextStyle dateText = GoogleFonts.poppins(color: white, fontSize: 13);
TextStyle promptText = GoogleFonts.poppins(color: white, fontSize: small);