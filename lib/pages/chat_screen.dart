import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_classification_app/chat_modules/message.dart';
import 'package:image_classification_app/chat_modules/messages.dart';
import 'package:image_classification_app/styles/chatbot_style.dart';
import 'package:image_classification_app/styles/chat_font_size.dart';
import 'package:intl/intl.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
// For clipboard functionality



class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _userMessage = TextEditingController();
  bool isLoading = false;
  static const apiKey = "AIzaSyAVxEAtuoQ32vaXXJIipDPRCk8qwEUrgWU";
  final List<Message> _messages = [];
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  void sendMessage() async {
    final userMessage = _userMessage.text;
    _userMessage.clear();

    setState(() {
      _messages.add(Message(
        isUser: true,
        message: userMessage,
        date: DateTime.now(),
      ));
      isLoading = true;
    });

    String prompt;

    
    if (userMessage.toLowerCase().contains('tumor')) {
     
      final tumorName = _extractTumorName(userMessage);

     
      prompt = '''
      Give me details of $tumorName in 300 lines
      ''';
    } else {
      
      prompt = userMessage;
    }

    final content = [Content.text(prompt)];

    // Send the prompt to Gemini AI
    final response = await model.generateContent(content);

    setState(() {
      _messages.add(Message(
        isUser: false,
        message: response.text ?? "Error generating details for the tumor",
        date: DateTime.now(),
      ));
      isLoading = false;
    });
  }

  String _extractTumorName(String userMessage) {
   
    final diseaseNamePattern = RegExp(r'\b([a-zA-Z\s]+tumor|cancer|disease|illness)\b');
    final match = diseaseNamePattern.firstMatch(userMessage);
    return match != null
        ? match.group(1)!
        : 'Tumor'; 
  }

  
  

  void onAnimatedTextFinished() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: background,
        title: Text('Chat with NeuroBot',
            style:
                GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Messages(
                  isUser: message.isUser,
                  message: message.message,
                  date: DateFormat('HH:mm').format(message.date),
                  onAnimatedTextFinished: onAnimatedTextFinished,
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: medium, vertical: small),
            child: Expanded(
              flex: 20,
              child: TextFormField(
                maxLines: 6,
                minLines: 1,
                controller: _userMessage,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(200, 52, 4, 59),
                  contentPadding:
                      const EdgeInsets.fromLTRB(medium, 0, small, 0),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color:  Colors.black),
                    borderRadius: BorderRadius.circular(xlarge),
                  ),
                  hintText: 'Enter topic or message...',
                  hintStyle: hintText,
                  
                  suffixIcon: GestureDetector(
                    onTap: () {
                      if (!isLoading && _userMessage.text.isNotEmpty) {
                        sendMessage();
                      }
                    },
                    child: isLoading
                        ? Container(
                            width: medium,
                            height: medium,
                            margin: const EdgeInsets.all(xsmall),
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(white),
                              strokeWidth: 3,
                            ),
                          )
                        : Icon(
                            Icons.arrow_upward,
                            color: _userMessage.text.isNotEmpty
                                ? Colors.white
                                : const Color(0x5A6C6C65),
                          ),
                  ),
                ),
                style: promptText,
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
