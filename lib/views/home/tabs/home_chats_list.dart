import 'package:flutter/material.dart';
import 'package:fsc_ibb/core/constants.dart';
import 'package:fsc_ibb/views/chats/chat_view.dart';

import '../home_modal.dart';

class HomeChatList extends StatelessWidget {
  const HomeChatList({Key key, this.calls}) : super(key: key);

  final List<Calls> calls;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        itemCount: calls.length,
        itemBuilder: (BuildContext context, int i) {
          return Card(
            color: Colors.white,
            child: ListTile(
              leading: Image.network(calls[i].picture),
              title: Text(
                calls[i].name,
                style: TextStyle(
                  fontSize: fontSizeNormal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                calls[i].message,
                style: TextStyle(
                  fontSize: fontSizeSubTitle,
                ),
              ),
              trailing: Text(
                calls[i].lastmesagetime,
                style: TextStyle(
                  fontSize: fontSizeSubTitle,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatView(
                            sendName: calls[i].name,
                            sendMessage: calls[i].message,
                          )),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
