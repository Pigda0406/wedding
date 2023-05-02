import 'dart:math';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';


class MobileMessageLayout extends StatelessWidget {
  final String uid;
  final String type;
  final text;
  final time;
  final color;
  final align;
  final boxAlignment;
  final nip;
  final senderName;
  final senderId;
  final boxMainAxisAlignment;

  const MobileMessageLayout({
    Key key,
    this.uid,
    this.type,
    this.text,
    this.time,
    this.color,
    this.align,
    this.boxAlignment,
    this.nip,
    this.senderName,
    this.senderId,
    this.boxMainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Column(
      crossAxisAlignment: boxAlignment,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: new BoxDecoration(
                color: color,
                //設置四周圓角 角度 這裏的角度應該爲 父Container height 的一半
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                //設置四周邊框
                border: new Border.all(width: 1, color: Colors.black12),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 8, top: 4,right: 8,bottom: 4),


                //nip: nip,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      senderName+"@" + time,
                      textAlign: align,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth:  300
                      ),
                      child: Text(
                        text==""?"":text,
                        textAlign: align,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

