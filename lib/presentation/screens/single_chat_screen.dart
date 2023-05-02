

import 'package:flutter/material.dart';
import 'package:martin_michelle/presentation/pages/mobile/single_chat_page_mobile.dart';
import 'package:martin_michelle/presentation/pages/tablet/single_chat_page_tablet.dart';
import 'package:martin_michelle/presentation/pages/web/single_chat_page_web.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SingleChatScreen extends StatelessWidget {

  const SingleChatScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context,sizingInformation){
        // if (sizingInformation.isDesktop){
        //   return SingleChatPageWeb(uid: uid,userName: username,);
        // }
        // if (sizingInformation.isTablet){
        //   return SingleChatPageTablet(uid: uid,userName: username,);
        // }
        return SingleChatPageMobile();
      },
    );
  }
}
