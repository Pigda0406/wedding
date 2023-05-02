import 'dart:async';
import 'dart:math';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:martin_michelle/presentation/pages/mobile/widget/mobile_message_layout.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:video_player/video_player.dart';
import 'package:martin_michelle/value.dart' as globals;

import '../../bloc/communication/communication_cubit.dart';

class SingleChatPageMobile extends StatefulWidget {
  final String uid;

  const SingleChatPageMobile({Key key, this.uid}) : super(key: key);

  @override
  _SingleChatPageMobileState createState() => _SingleChatPageMobileState();
}

class _SingleChatPageMobileState extends State<SingleChatPageMobile> {
  TextEditingController _messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  bool _visible = false;
  String currentImage;

  @override
  void initState() {
    BlocProvider.of<CommunicationCubit>(context).getTextMessages();
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    FocusManager.instance.primaryFocus?.unfocus();
    currentImage = _getRandomImage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getBackgroundColor() {
    return Container(
      color: Colors.blue.withAlpha(120),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunicationCubit, CommunicationState>(
      builder: (context, state) {
        print("state= $state");
        if (state is CommunicationInitial) {
          return _loadingWidget();
        } else {
          return _bodyWidget(state);
        }
        //return _loadingWidget();
      },
    );
  }

  dynamic listImagesnotFound = [
    "assets/0076.jpg",
    "assets/AZ9I0399.jpg",
    "assets/AZ9I2462.jpg",
    "assets/AZ9I8767.jpg",
    "assets/AZ9I8878.jpg",
    "assets/AZ9I9942.jpg",
    "assets/AZ9I9797.jpg",
    "assets/AZ9I1269.jpg",
    "assets/AZ9I2792.jpg",
    "assets/AZ9I2289.jpg",
    "assets/AZ9I0483.jpg",
    "assets/AZ9I1005.jpg"
  ];

  String _getRandomImage() {
    final randomIndex = Random().nextInt(listImagesnotFound.length - 1);
    return listImagesnotFound[randomIndex];
  }

  Widget _bodyWidget(CommunicationLoaded messages) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                currentImage,
                fit: BoxFit.cover,
              ),
            ),
            //_getVideoBackground(),
            // _getBackgroundColor(),
            Column(
              children: [
                //_headerWidget(),
                _listMessagesWidget(messages),
                _sendTextMessageWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _loadingWidget() {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/bg2.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              //_headerWidget(),
              Expanded(
                  child: Center(
                child: CircularProgressIndicator(),
              )),
              _sendTextMessageWidget(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 20),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.indigo[400],
          Colors.blue[300],
        ],
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  width: 40, height: 40, child: Image.asset("assets/logo.png")),
              Text(
                "Global Chat Room",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Text(
            //"${widget.userName}",

            "${globals.userName}",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _listMessagesWidget(CommunicationLoaded messages) {
    Timer(
        Duration(milliseconds: 300),
        () => _scrollController
            .jumpTo(_scrollController.position.maxScrollExtent));
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.0),
        child: ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          controller: _scrollController,
          shrinkWrap: true,
          itemCount: messages.messages.length,
          itemBuilder: (_, index) {
            return MobileMessageLayout(
                type: messages.messages[index].type,
                senderId: messages.messages[index].senderId,
                senderName: messages.messages[index].senderName,
                text: messages.messages[index].message,
                time: DateFormat('hh:mm a')
                    .format(messages.messages[index].time.toDate()),
                color: Colors.white30,
                align: TextAlign.left,
                nip: BubbleNip.leftTop,
                boxAlignment: CrossAxisAlignment.start,
                boxMainAxisAlignment: MainAxisAlignment.start,
                uid: widget.uid);
          },
        ),
      ),
    );
  }

  Widget _sendTextMessageWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
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
                //_emojiWidget(),
                SizedBox(
                  width: 8,
                ),
                _textFieldWidget(),
              ],
            ),
            Row(
              children: [
                //_micWidget(),
                SizedBox(
                  width: 8,
                ),
                _sendMessageButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  _textFieldWidget() {
    return ResponsiveBuilder(
      builder: (_, sizingInformation) {
        return Container(
          width: sizingInformation.screenSize.width * 0.60,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 100,
            ),
            child: Scrollbar(
              child: TextFormField(
                controller: _messageController,
                textInputAction: TextInputAction.done,
                maxLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "請留下祝福的話 <3 ..."),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _sendMessageButton() {
    return InkWell(
      onTap: () {
        if (_messageController.text.isNotEmpty) {
          _sendTextMessage();
          _messageController.clear();
        }
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Icon(
          Icons.send,
          color: Colors.white,
        ),
      ),
    );
  }

  void _sendTextMessage() {
    BlocProvider.of<CommunicationCubit>(context).sendTextMsg(
        name: globals.userName,
        uid: globals.userName,
        //name: widget.userName,
        message: _messageController.text);
  }
}
