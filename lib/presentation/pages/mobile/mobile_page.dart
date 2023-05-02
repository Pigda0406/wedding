import 'package:flutter/material.dart';
import 'package:martin_michelle/presentation/pages/mobile/widget/body_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MobilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context,sizingInformation){
        return Scaffold(
          body: Container(
            child: BodyWidgetMobile(sizingInformation: sizingInformation,),
          ),
        );
      },
    );
  }
}
