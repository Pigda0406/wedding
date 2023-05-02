import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:martin_michelle/data/model/user_model.dart';
import 'package:martin_michelle/presentation/bloc/auth/auth_cubit.dart';
import 'package:martin_michelle/presentation/bloc/login/login_cubit.dart';
import 'package:martin_michelle/presentation/bloc/user/user_cubit.dart';
import 'package:martin_michelle/presentation/screens/gallery_screen.dart';
import 'package:martin_michelle/presentation/screens/single_chat_screen.dart';
import 'package:lottie/lottie.dart';

class WelcomePageMobile extends StatefulWidget {
  final String uid;

  const WelcomePageMobile({Key key, this.uid}) : super(key: key);

  @override
  _WelcomePageMobileState createState() => _WelcomePageMobileState();
}

class _WelcomePageMobileState extends State<WelcomePageMobile> {
  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (_, state) {
      if (state is UserLoaded) {
        return _bodyWidget(state);
      }
      return _loadingWidget();
    });
  }

  Widget _bodyWidget(UserLoaded users) {
    final user = users.users.firstWhere((user) => user.uid == widget.uid,
        orElse: () => UserModel());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.indigo[400],
                Colors.blue[300],
              ],
            )),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Lottie.asset("assets/congratulation.json"),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Lottie.asset("assets/bubble.json"),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(top: 80),
                child: Text(
                  "Welcome mobile2 ${user.name}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          _joinGlobalChatButton(user.name),
          //_joinGlobalChatButton2(user.name),
          //_logOutWidget(),
        ],
      ),
    );
  }

  Widget _loadingWidget() {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.indigo[400],
                Colors.blue[300],
              ],
            )),
          ),
          Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _joinGlobalChatButton(String name) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.only(top: 300,bottom: 20.0,left: 20.0,right: 20.0),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SingleChatScreen(),
                ),
              );
            },
            child: Container(
              width: 250,
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.white60, width: 2)),
              child: Text(
                "Join",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SingleChatScreen(),
                ),
              );
            },
            child: Container(
              width: 250,
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.white60, width: 2)),
              child: Text(
                "Join",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => GalleryScreen(),
                ),
              );
            },
            child: Container(
              width: 250,
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.white60, width: 2)),
              child: Text(
                "Join",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SingleChatScreen(),
                ),
              );
            },
            child: Container(
              width: 250,
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.white60, width: 2)),
              child: Text(
                "Join",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget _joinGlobalChatButton2(String name) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(20.0),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Material(
              color: Colors.teal[100],
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SingleChatScreen(),
                    ),
                  );
                },
                child:  Container(
                  width: 180,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.3),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.white60, width: 2)),
                  child: Text(
                    "Join",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.teal[100],
              child: InkWell(
                onTap: () {
                  print('1 was clicked');
                },
                child:  Container(
                  width: 180,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.3),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.white60, width: 2)),
                  child: Text(
                    "Join",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.teal[100],
              child: InkWell(
                onTap: () {
                  print('1 was clicked');
                },
                child:  Container(
                  width: 180,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.3),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.white60, width: 2)),
                  child: Text(
                    "Join",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.teal[100],
              child: InkWell(
                onTap: () {
                  print('1 was clicked');
                },
                child:  Container(
                  width: 180,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.3),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.white60, width: 2)),
                  child: Text(
                    "Join",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }


  Widget _logOutWidget() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: InkWell(
        onTap: (){
            //TODO:Logout
          BlocProvider.of<AuthCubit>(context).loggedOut();
          BlocProvider.of<LoginCubit>(context).submitSignOut();
        },
        child: Container(
          margin: EdgeInsets.only(left: 15,bottom: 15),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            Icons.exit_to_app,
            size: 30,
          ),
        ),
      ),
    );
  }
}
