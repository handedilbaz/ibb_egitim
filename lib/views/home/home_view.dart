import 'package:flutter/material.dart';
import 'package:fsc_ibb/core/constants.dart';
import 'package:fsc_ibb/core/colors_file.dart';
import 'package:fsc_ibb/core/widgets/generalwidgets/custom_circle_indicator.dart';
import 'package:fsc_ibb/core/widgets/generalwidgets/custom_clipper.dart';
import 'package:fsc_ibb/core/widgets/generalwidgets/custom_text_widget.dart';
import 'package:fsc_ibb/views/home/home_modal.dart';
import 'package:stacked/stacked.dart';

import 'tabs/home_calls_list.dart';
import 'tabs/home_status_list.dart';
import 'tabs/home_chats_list.dart';
import 'home_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Calls> calls;
  bool loading = false;
  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);

    getCalls().then((value) => {
          setState(() {
            calls = value;
            loading = true;
          }),
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (BuildContext context, HomeViewModel viewModel, Widget _) {
        return Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  height: screenHeigth * 0.25,
                  width: MediaQuery.of(context).size.width,
                  color: ColorsFile().mainThemeDark,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenHeigth * 0.03,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.2,
                            child: IconButton(
                                alignment: Alignment.centerLeft,
                                onPressed: () {},
                                icon: const Icon(Icons.photo_camera),
                                color: Colors.white),
                          ),
                          SizedBox(
                              width: screenWidth * 0.6,
                              child: Center(
                                child: CustomText(
                                    label: AppLocalizations.of(context)
                                        .home_header,
                                    textColor: ColorsFile().whiteText,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              )),
                          SizedBox(
                            width: screenWidth * 0.2,
                            child: IconButton(
                                alignment: Alignment.centerLeft,
                                onPressed: () {},
                                icon: const Icon(Icons.search),
                                color: ColorsFile().whiteText),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeigth * 0.01,
                      ),
                      Container(
                        height: screenHeigth * 0.06,
                        width: screenWidth * 0.75,
                        decoration: BoxDecoration(
                          color: ColorsFile().mainThemeLigthDark,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TabBar(
                          unselectedLabelColor: Colors.black,
                          labelColor: ColorsFile().splashButton,
                          tabs: [
                            Tab(
                              text: AppLocalizations.of(context).tab_one,
                            ),
                            Tab(
                              text: AppLocalizations.of(context).tab_two,
                            ),
                            Tab(
                              text: AppLocalizations.of(context).tab_three,
                            )
                          ],
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    loading == true
                        ? HomeCallsList(
                            calls: calls,
                          )
                        : CustomCircularProgressIndicator(
                            size: screenHeigth * 0.10),
                    loading == true
                        ? HomeStatusList(
                            calls: calls,
                          )
                        : CustomCircularProgressIndicator(
                            size: screenHeigth * 0.10),
                    loading == true
                        ? HomeChatList(
                            calls: calls,
                          )
                        : CustomCircularProgressIndicator(
                            size: screenHeigth * 0.10),
                  ],
                  controller: _tabController,
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
