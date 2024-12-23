import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) ;

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: 'AIzaSyBQpwP1V1EJ6kWIvfjz0zy-lBx3ACVvkac',
  );

  final ChatUser _currentUser = ChatUser(
    id: '1',
    firstName: 'Me',
  );

  final ChatUser _ai = ChatUser(
    id: '2',
    firstName: '',
    lastName: '',
  );

  final List<ChatUser> _typingUser = [];

  final List<ChatMessage> _messages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor:  const Color(0xFF070d27),
        title: Row(children: [IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back, color: Colors.white,))],),
      ),
      backgroundColor: const Color(0xFF070d27),
      body: DashChat(
          currentUser: _currentUser,
          typingUsers: _typingUser,
          inputOptions: InputOptions(
              inputMaxLines: 1,
              alwaysShowSend: true,
              sendButtonBuilder: (void Function()? onSend) {
                return Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(left: 8),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward,
                        color: Colors.blue), // Thay đổi icon ở đây
                    onPressed: onSend, // Gửi tin nhắn
                  ),
                );
              },
              inputDecoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Nhập nội dung tin nhắn',
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
          messageOptions: const MessageOptions(

              // currentUserContainerColor: Color(0xFF2c3147)
              ),
          onSend: (message) {
            getChatResponse(message);
          },
          messages: _messages),
    );
  }

  Future<void> getChatResponse(ChatMessage message) async {
    setState(() {
      _messages.insert(
          0,
          ChatMessage(
              user: _currentUser,
              createdAt: DateTime.now(),
              text: message.text.trim()));
      _typingUser.add(_ai);
    });

    final response =
        await model.generateContent([Content.text(message.text.trim())]);
    setState(() {
      _typingUser.remove(_ai);
    });
    if (response.text != null) {
      setState(() {
        _messages.insert(
          0,
          ChatMessage(
              user: _ai, createdAt: DateTime.now(), text: response.text ?? ''),
        );
      });
    }
  }
}
