import 'package:flutter/material.dart';
import 'package:martin_michelle/presentation/pages/mobile/mobile_page.dart';
import 'package:martin_michelle/presentation/pages/tablet/tablet_page.dart';
import 'package:martin_michelle/presentation/pages/web/web_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context,sizingInformation){
        if (sizingInformation.isDesktop){
          return MobilePage();
        }
        if (sizingInformation.isTablet){
          return MobilePage();
        }
        return MobilePage();
      },
    );
  }
}
