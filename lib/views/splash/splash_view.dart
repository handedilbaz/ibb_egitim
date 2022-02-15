import 'package:flutter/material.dart';
import 'package:fsc_ibb/core/constants.dart';
import 'package:fsc_ibb/core/colors_file.dart';
import 'package:fsc_ibb/core/font_file.dart';
import 'package:fsc_ibb/core/widgets/generalwidgets/custom_asset_image_widget.dart';
import 'package:fsc_ibb/core/widgets/generalwidgets/custom_clipper.dart';
import 'package:fsc_ibb/core/widgets/generalwidgets/custom_text_widget.dart';
import 'package:fsc_ibb/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'splash_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      builder: (BuildContext context, SplashViewModel viewModel, Widget _) {
        fontSizeTitle = getFontSizeTitle(context);
        fontSizeNormal = getFontSizeNormal(context);
        fontSizeSubTitle = getFontSizeSubTitle(context);
        screenHeigth = MediaQuery.of(context).size.height;
        screenWidth = MediaQuery.of(context).size.width;
        return Column(
          children: [
            Container(
              height: screenHeigth * 0.65,
              color: ColorsFile().mainThemeDark,
              child: ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  height: screenHeigth * 0.65,
                  width: MediaQuery.of(context).size.width,
                  color: ColorsFile().mainThemeLigth,
                  child: const CustomAssetImage(
                    asset: 'assets/images/mainmenu.png',
                    size: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
                height: screenHeigth * 0.35,
                width: MediaQuery.of(context).size.width,
                color: ColorsFile().mainThemeDark,
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    Center(
                      child: CustomText(
                          label: AppLocalizations.of(context).splashlabelone,
                          textAlign: TextAlign.center,
                          textColor: ColorsFile().whiteText,
                          fontSize: fontSizeTitle,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomText(
                        label: AppLocalizations.of(context).welcome_msg,
                        textAlign: TextAlign.center,
                        textColor: ColorsFile().ligthTextColor,
                        fontSize: 10,
                        fontWeight: FontWeight.normal),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextButton.icon(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new HomeView()))
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        label: CustomText(
                            label: AppLocalizations.of(context).splash_button,
                            textAlign: TextAlign.center,
                            textColor: ColorsFile().whiteText,
                            fontSize: fontSizeTitle,
                            fontWeight: FontWeight.normal),
                      ),
                      alignment: Alignment.center,
                      height: screenHeigth * 0.09,
                      width: screenWidth * 0.55,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: ColorsFile().splashButton,
                      ),
                    ),
                  ],
                )),
          ],
        );
      },
      viewModelBuilder: () => SplashViewModel(),
    );
  }
}
