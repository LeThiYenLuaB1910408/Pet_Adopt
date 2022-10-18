import 'package:flutter/material.dart';
import 'package:pet_adopt/models/chats_model.dart';
import 'package:pet_adopt/pages/chat/chat_list_tile.dart';
import 'package:pet_adopt/const.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: white,
        title: Text('Chats',
            style: poppins.copyWith(
              // color: black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: RefreshIndicator(
        onRefresh: () async => print('refresh products'),
        child: buildChatsListView(chats),
      ),
    );
  }

  Widget buildChatsListView(chats) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (ctx, i) => Column(
        children: [
          ChatListTile(
            chats: chats[i],
          ),
        ],
      ),
    );
  }
}
