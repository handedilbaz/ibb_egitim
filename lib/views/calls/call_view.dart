import 'package:flutter/material.dart';
import 'package:fsc_ibb/core/colors_file.dart';
import 'package:fsc_ibb/core/constants.dart';
import 'package:fsc_ibb/core/widgets/generalwidgets/custom_clipper.dart';
import 'package:fsc_ibb/core/widgets/generalwidgets/custom_network_image_widget.dart';
import 'package:fsc_ibb/core/widgets/generalwidgets/custom_text_widget.dart';
import 'package:stacked/stacked.dart';
import 'call_view_model.dart';

class CallView extends StatelessWidget {
  final String sendName, sendPicture;

  CallView({Key key, @required this.sendName, this.sendPicture})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CallViewModel>.reactive(
      builder: (BuildContext context, CallViewModel viewModel, Widget _) {
        return Column(children: [
          AppBar(
            backgroundColor: Colors.white,
            foregroundColor: ColorsFile().splashButton,
          ),
          Container(
            height: screenHeigth * 0.50,
            color: ColorsFile().mainThemeDark,
            child: ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                height: screenHeigth * 0.50,
                width: screenWidth,
                color: ColorsFile().mainThemeLigth,
                child: Center(
                  child: CustomNetworkImage(
                    link: sendPicture,
                    size: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: screenHeigth * 0.35,
              width: MediaQuery.of(context).size.width,
              color: ColorsFile().mainThemeDark,
              child: Column(
                children: [
                  CustomText(
                      label: sendName,
                      textColor: ColorsFile().whiteText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    height: screenHeigth * 0.08,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(Icons.call),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(20)),
                      backgroundColor: MaterialStateProperty.all(
                          ColorsFile().splashButton), // <-- Button color
                    ),
                  ),
                ],
              )),
        ]);
      },
      viewModelBuilder: () => CallViewModel(),
    );
  }
}
