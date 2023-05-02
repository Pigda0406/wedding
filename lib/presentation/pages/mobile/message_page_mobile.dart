import 'dart:async';
import 'dart:math';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:video_player/video_player.dart';

import '../../bloc/communication/communication_cubit.dart';


class MessagePageMobile extends StatefulWidget {
  final String uid;
  const MessagePageMobile({Key key, this.uid}) : super(key: key);

  @override
  _MessagePageMobileState createState() => _MessagePageMobileState();
}

class _MessagePageMobileState extends State<MessagePageMobile> {
  TextEditingController _messageController = TextEditingController();
  final _recipientController = TextEditingController(
    text: '',
  );

  final _subjectController = TextEditingController(text: '');

  final _bodyController = TextEditingController(
    text: '',
  );
  @override
  void initState() {
    BlocProvider.of<CommunicationCubit>(context).getTextMessages();
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _bodyWidget();
  }

  Widget _bodyWidget() {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _recipientController,
                style: TextStyle(
                    fontSize: 48.0,
                    color: Colors.black
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '請問你的尊姓大名',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _subjectController,
                style: TextStyle(
                    fontSize: 48.0,
                    color: Colors.black
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '最希望新郎新娘等等做什麼事',
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  controller: _bodyController,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                    style: TextStyle(
                        fontSize: 48.0,
                        color: Colors.black
                    ),
                  decoration: InputDecoration(
                      labelText: '留言給我們', border: OutlineInputBorder()),
                ),
              ),
            ),
            _sendMessageButton(),
          ],
        ),
      ),
    );
  }

  Widget _sendTextMessageWidget() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
            border: Border.all(color: Colors.black.withOpacity(.4), width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _sendMessageButton(),
              ],
            )
          ],
        ),
      ),
    );
  }


  Widget _sendMessageButton() {
    return InkWell(
      onTap: () {
          _sendTextMessage();
      },
      child: Container(
        height: 60,
        alignment:Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.lightBlue.withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Text(
          "送出",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white,
              fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _sendTextMessage() {
    _subjectController.clear();
    _recipientController.clear();
    _bodyController.clear();
    final snackBar = SnackBar(
      content: const Text('感謝你的祝福，等等會有機會看到你的留言唷!!!'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
