import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:install_dressup/screens/about_app.dart';
import 'package:install_dressup/screens/chat_us.dart';
import 'package:install_dressup/screens/fake_data.dart';
import 'package:install_dressup/screens/install_bar.dart';
import 'package:install_dressup/screens/terms_and_conditions.dart';
import 'package:install_dressup/screens/user_data.dart';

import 'edit_app_details.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => IndexState();
}

class IndexState extends State<Index> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      //appbar about installs basic app details
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        // backgroundColor: Colors.white,
        title: InstallBar(),

        bottom: AppBar(
          title: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              controller: tabController,
              tabs: [
                Text('about'),
                Text('user data & management'),
                Text('terms & conditions'),
                Text('chat us')
              ]),
        ),
      ),
      //body in tabviewwith each segment
      floatingActionButton: kIsWeb ? null : UploadApp(),
      body: TabBarView(controller: tabController, children: [
        AboutApp(appDescriptionText: fakeData, appDescriptionPictures: []),
        UserData(userData: fakeData),
        TermsAndConditions(termsAndCondition: fakeData),
        ChatUs()
      ]),
    );
  }
}
