import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:martin_michelle/presentation/bloc/auth/auth_cubit.dart';
import 'package:martin_michelle/presentation/bloc/login/login_cubit.dart';
import 'package:martin_michelle/presentation/screens/gallery_screen.dart';
import 'package:martin_michelle/presentation/screens/single_chat_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:martin_michelle/value.dart' as globals;
import 'dart:html' as html;

import '../../../screens/game_screen.dart';
import '../../../screens/message_screen.dart';

class BodyWidgetMobile extends StatefulWidget {
  final SizingInformation sizingInformation;

  const BodyWidgetMobile({Key key, this.sizingInformation}) : super(key: key);

  @override
  _BodyWidgetMobileState createState() => _BodyWidgetMobileState();
}

class _BodyWidgetMobileState extends State<BodyWidgetMobile> {
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _textFieldController = TextEditingController();
  bool isLoginPage = true;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xFF595959), Color(0xFF000000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ),
        Center(
          child: Image.asset('assets/newg3.png'),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //fit: BoxFit.contain,),
                const SizedBox(height: 40.0),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (globals.userName == "神秘客"||globals.userName.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('你好像還沒設定暱稱唷!!'),
                                    content: TextField(
                                      maxLength: 12,
                                      onChanged: (value) {
                                        setState(() {
                                          //valueText = value;
                                        });
                                      },
                                      controller: _textFieldController,
                                      decoration:
                                          InputDecoration(hintText: "請輸入一個暱稱"),
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        color: Colors.black54,
                                        textColor: Colors.white,
                                        child: Text('OK'),
                                        onPressed: () {
                                          setState(() {
                                            globals.userName =
                                                _textFieldController.text;
                                            Navigator.pop(context);
                                            if(_textFieldController.text.isNotEmpty){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => SingleChatScreen(),
                                                ),
                                              );
                                            }

                                          });
                                        },
                                      ),
                                    ],
                                  );
                                });
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SingleChatScreen(),
                              ),
                            );
                          }
                        },
                        child:
                          _buildWikiCategory2("assets/ic_chat.png", "聊天室", Color(0xAAcdbbbb)),

                      //_buildWikiCategory(Icons.chat, "聊天室", Color(0xAAcdbbbb)),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          html.window.open('https://www.kahoot.it',"_self");
                        },
                        child: _buildWikiCategory2(
                            "assets/ic_game.png", "遊戲", Color(0xAAcdbbbb)),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => GalleryScreen(),
                            ),
                          );
                        },
                        child: _buildWikiCategory2(
                            "assets/ic_gallery.png", "婚紗照", Color(0xAAcdbbbb)),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MessageScreen(),
                            ),
                          );
                        },
                        child: _buildWikiCategory2(
                            "assets/ic_message.png", "留言板", Color(0xAAcdbbbb)),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                  ],
                ),
                const SizedBox(height: 16.0),
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg2.png"),
                fit: BoxFit.cover,
              ),
              //  gradient: LinearGradient(
              //  colors: [Color(0xFF535353), Color(0xFF101010)],
              //  begin: Alignment.topCenter,
              //  end: Alignment.bottomCenter,
              //  ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 7,
                  blurRadius: 10,
                  offset: Offset(0, -3), // changes position of shadow
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Image.asset('assets/center8.png'),
        ),
      ]),
    );
  }

  Container _buildWikiCategory(IconData icon, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 20,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(26.0),
            alignment: Alignment.centerRight,
            child: Opacity(
                opacity: 0.3,
                child: Icon(
                  icon,
                  size: 70,
                  color: Colors.white,
                )),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const SizedBox(height: 16.0),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );

  }

  Container _buildWikiCategory2(String icon, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 12,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(26.0),
            alignment: Alignment.centerRight,
            child: Opacity(
                opacity: 0.3,
                child: ImageIcon(
                  AssetImage(icon),
                  color: Colors.white,
                  size: 70,
                )),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageIcon(
                  AssetImage(icon),
                  color: Colors.white,
                  size: 24,
                ),
                const SizedBox(height: 16.0),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );

    //   Stack(
    //   children: <Widget>[
    //     Container(
    //       padding: const EdgeInsets.all(26.0),
    //       alignment: Alignment.centerRight,
    //       child: Opacity(
    //           opacity: 0.3,
    //           child: Icon(
    //             icon,
    //             size: 100,
    //             color: Colors.white,
    //           )),
    //       decoration: BoxDecoration(
    //         color: color,
    //         borderRadius: BorderRadius.circular(20.0),
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           Icon(
    //             icon,
    //             color: Colors.white,
    //           ),
    //           const SizedBox(height: 16.0),
    //           Text(
    //             label,
    //             style: TextStyle(
    //               color: Colors.white,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           )
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }


// @override
// Widget build(BuildContext context) {
//   return BlocConsumer<LoginCubit, LoginState>(
//     builder: (context, state) {
//       if (state is LoginLoading) {
//         return _loadingWidget();
//       }
//       return _bodyWidget();
//     },
//     listener: (context, state) {
//       if (state is LoginSuccess){
//         BlocProvider.of<AuthCubit>(context).loggedIn();
//       }
//     },
//   );
// }
// Widget _loadingWidget(){
//   return SingleChildScrollView(
//     child: Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "WELCOME TO eTechViral",
//             style: TextStyle(
//                 fontSize: 30, color: Colors.black,fontWeight: FontWeight.bold),
//           ),
//           Text(
//             "Flutter is changing the app development world. if you want to improve your flutter skill then join our channel because we try to upload one videos per week. eTechViral :- flutter and dart app development tutorials crafted to make you win jobs.",
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.black54, fontSize: 16),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           _imageWidget(),
//           SizedBox(
//             height: 15,
//           ),
//           _fromWidget(),
//           SizedBox(
//             height: 15,
//           ),
//           _buttonWidget(),
//           SizedBox(
//             height: 40,
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Lottie.asset('assets/loading.json'),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// Widget _bodyWidget(){
//   return SingleChildScrollView(
//     child: Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "WELCOME TO eTechViral",
//             style: TextStyle(
//                 fontSize: 30, color: Colors.black,fontWeight: FontWeight.bold),
//           ),
//           Text(
//             "Flutter is changing the app development world. if you want to improve your flutter skill then join our channel because we try to upload one videos per week. eTechViral :- flutter and dart app development tutorials crafted to make you win jobs.",
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.black54, fontSize: 16),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           _imageWidget(),
//           SizedBox(
//             height: 15,
//           ),
//           _fromWidget(),
//           SizedBox(
//             height: 15,
//           ),
//           _buttonWidget(),
//           SizedBox(
//             height: 40,
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: _rowTextWidget(),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// Widget _imageWidget() {
//   return Container(
//     height: 60,
//     width: 60,
//     child: Image.asset("assets/profile.png"),
//   );
// }
//
// Widget _fromWidget() {
//   return Column(
//     children: [
//       isLoginPage==true?Text("",style: TextStyle(fontSize: 0),):Container(
//         height: 60,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(40)),
//           border: Border.all(color: Colors.grey, width: 1.0),
//         ),
//         child: TextField(
//           controller: _nameController,
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: "User Name",
//             prefixIcon: Icon(Icons.person_outline),
//           ),
//         ),
//       ),
//       isLoginPage==true?Text("",style: TextStyle(fontSize: 0),):SizedBox(
//         height: 20,
//       ),
//       Container(
//         height: 60,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(40)),
//           border: Border.all(color: Colors.grey, width: 1.0),
//         ),
//         child: TextField(
//           controller: _emailController,
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: "Email Address",
//             prefixIcon: Icon(Icons.alternate_email),
//           ),
//         ),
//       ),
//       SizedBox(
//         height: 20,
//       ),
//       Container(
//         height: 60,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(40)),
//           border: Border.all(color: Colors.grey, width: 1.0),
//         ),
//         child: TextField(
//           controller: _passwordController,
//           obscureText: true,
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: "Password",
//             prefixIcon: Icon(Icons.lock_outline),
//           ),
//         ),
//       ),
//     ],
//   );
// }
//
// Widget _buttonWidget() {
//   return InkWell(
//     onTap: (){
//       if (isLoginPage == true) {
//         _submitLogin();
//       } else {
//         _submitRegistration();
//       }
//     },
//     child: Container(
//       margin: EdgeInsets.symmetric(horizontal: 10),
//       width: widget.sizingInformation.screenSize.width,
//       alignment: Alignment.center,
//       padding: EdgeInsets.symmetric(vertical: 14),
//       decoration: BoxDecoration(
//         color: Colors.indigo,
//         borderRadius: BorderRadius.all(Radius.circular(50)),
//       ),
//       child: Text(
//         isLoginPage==true?"LOGIN":"REGISTER",
//         style: TextStyle(fontSize: 18, color: Colors.white),
//       ),
//     ),
//   );
// }
//
// Widget _rowTextWidget() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text(
//         isLoginPage==true? "Don't have account?" : "Have an account?",
//         style: TextStyle(fontSize: 16, color: Colors.indigo[400]),
//       ),
//       InkWell(
//         onTap: (){
//           setState(() {
//             if (isLoginPage==true)
//               isLoginPage=false;
//             else
//               isLoginPage=true;
//           });
//         },
//         child: Text(
//           isLoginPage==true ?" Sign Up":" Sign In",
//           style: TextStyle(fontSize: 16, color: Colors.indigo,fontWeight: FontWeight.bold),
//         ),
//       ),
//     ],
//   );
// }
// void _submitLogin() {
//   if (_emailController.text.isNotEmpty &&
//       _passwordController.text.isNotEmpty) {
//     BlocProvider.of<LoginCubit>(context).submitLogin(
//       email: _emailController.text,
//       password: _passwordController.text,
//     );
//   }
// }
//
// void _submitRegistration() {
//   if (_emailController.text.isNotEmpty &&
//       _passwordController.text.isNotEmpty &&
//       _nameController.text.isNotEmpty) {
//     BlocProvider.of<LoginCubit>(context).submitRegistration(
//       email: _emailController.text,
//       password: _passwordController.text,
//       name: _nameController.text,
//     );
//   }
// }
}
