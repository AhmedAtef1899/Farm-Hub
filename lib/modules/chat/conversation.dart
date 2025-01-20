import 'package:farm_hub/modules/chat/conversation_info/coversation_info.dart';
import 'package:farm_hub/modules/chat/voice_note.dart';
import 'package:farm_hub/modules/user_profile/reviews.dart';
import 'package:farm_hub/shared/components/components.dart';
import 'package:farm_hub/shared/styles/color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:solar_icons/solar_icons.dart';

import '../user_profile/user_profile.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  var messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Map<String, dynamic>> messages = [
    {'text': 'Hello, How are you', 'isSentByUser': true, 'time': '1:25 PM'},
    {'text': 'am fine.', 'isSentByUser': false, 'time': '1:32 PM'},
    {'text': 'How many liters of milk do you have?', 'isSentByUser': true, 'time': '1:35 PM'},
    {'text': 'I have 200 liter\'s milk.', 'isSentByUser': false, 'time': 'Now'},
  ];

  void sendMessage(String text) {
    setState(() {
      messages.add({'text': text, 'isSentByUser': true, 'time': 'Now'});
    });
    messageController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        title: Text(
          '@nilenavigator',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: HexColor('#1DB954')),
        ),
        centerTitle: true,
        actions: [
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: (){
                navigateTo(context, const ConversationInfoScreen());
              },
              child: const Icon(
                CupertinoIcons.info_circle_fill,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  navigateTo(context, const UserProfileScreen());
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage('asset/images/Group 20.png'), // Replace with your image path
                  radius: 50,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Nile Navigator',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              const SizedBox(height: 8),
              const Text(
                'Location - Buike, Kasubi',
              ),
              const Text(
                'Interest - Fruits, Vegetable’s\n Livestock and grain',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                width: 77,
                height: 32,
                decoration: BoxDecoration(
                  color: HexColor('#1976D2'),
                  borderRadius: BorderRadius.circular(4),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'BUY001',
                  style: TextStyle(color: CupertinoColors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment: message['isSentByUser'] ? Alignment.centerLeft : Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: message['isSentByUser'] ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: message['isSentByUser'] ? Colors.blueAccent : Colors.grey[200],
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: Text(
                          message['text'],
                          style: TextStyle(
                            color: message['isSentByUser'] ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          message['time'],
                          style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 15,
                  spreadRadius: 5,
                )
              ]
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  child: IconButton(
                    icon: const Icon(SolarIconsBold.galleryRound),
                    onPressed: () {
                      // Add your camera function
                    },
                  ),
                ),
                const SizedBox(width: 8,),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(CupertinoIcons.mic),
                    onPressed: () {
                      showDialog(context: context, builder: (context)=>const VoiceNoteScreen());
                    },
                  ),
                ),
                const SizedBox(width: 8,),
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Write a message...',
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 8,),
                CircleAvatar(
                  backgroundColor: CupertinoColors.white,
                  radius: 25,
                  child: IconButton(
                    icon: Icon(FluentIcons.send_24_filled, color: defaultColor),
                    onPressed: () {
                      if (messageController.text.trim().isNotEmpty) {
                        sendMessage(messageController.text.trim());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
