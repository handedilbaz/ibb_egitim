import 'package:flutter/material.dart';
import 'package:fsc_ibb/core/colors_file.dart';
import 'package:fsc_ibb/core/constants.dart';
import 'package:fsc_ibb/core/widgets/generalwidgets/custom_clipper.dart';
import 'package:fsc_ibb/core/widgets/generalwidgets/custom_text_widget.dart';
import 'package:stacked/stacked.dart';

import 'chat_view_model.dart';

class ChatView extends StatelessWidget {
  final String sendName, sendMessage;

  ChatView({Key key, @required this.sendName, this.sendMessage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
      builder: (BuildContext context, ChatViewModel viewModel, Widget _) {
        return Material(
          child: Column(children: [
            AppBar(
              backgroundColor: ColorsFile().darkTextColor,
              foregroundColor: ColorsFile().splashButton,
              title: CustomText(
                  label: sendName,
                  textColor: ColorsFile().whiteText,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: screenHeigth * 0.10,
              color: ColorsFile().mainThemeLigth,
              child: ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  height: screenHeigth * 0.10,
                  width: screenWidth,
                  color: ColorsFile().mainThemeDark,
                ),
              ),
            ),
            SizedBox(
              height: screenHeigth * 0.04,
            ),
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsFile().mainThemeLigthDark,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: CustomText(
                  label: sendMessage,
                  textColor: ColorsFile().darkTextColor,
                  fontSize: fontSizeNormal,
                  fontWeight: FontWeight.normal),
            ),
          ]),
        );
      },
      viewModelBuilder: () => ChatViewModel(),
    );
  }
}
