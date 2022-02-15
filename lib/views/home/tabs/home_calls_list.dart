import 'package:flutter/material.dart';
import 'package:fsc_ibb/core/constants.dart';
import 'package:fsc_ibb/views/calls/call_view.dart';

import '../home_modal.dart';

class HomeCallsList extends StatelessWidget {
  const HomeCallsList({Key key, this.calls}) : super(key: key);

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
                calls[i].phonenumber,
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
                      builder: (context) => CallView(
                            sendName: calls[i].name,
                            sendPicture: calls[i].picture,
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
