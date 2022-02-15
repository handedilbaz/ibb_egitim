import 'package:flutter/material.dart';
import 'package:fsc_ibb/core/constants.dart';
import 'package:fsc_ibb/views/home/home_modal.dart';

class HomeStatusList extends StatelessWidget {
  const HomeStatusList({Key key, this.calls}) : super(key: key);

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
                calls[i].status,
                style: TextStyle(
                  color: (calls[i].status == "Available")
                      ? Colors.green
                      : (calls[i].status == "Busy")
                          ? Colors.red
                          : Colors.amber,
                  fontSize: fontSizeSubTitle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
