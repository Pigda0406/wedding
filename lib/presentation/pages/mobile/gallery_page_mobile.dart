import 'dart:async';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:responsive_builder/responsive_builder.dart';

import '../../bloc/communication/communication_cubit.dart';
import 'FullScreenImagePage.dart';

class GalleryPageMobile extends StatefulWidget {
  const GalleryPageMobile() : super();

  @override
  _GalleryPageMobileState createState() => _GalleryPageMobileState();
}

class _GalleryPageMobileState extends State<GalleryPageMobile> {
  List wallpapersList = new List();

  @override
  void initState() {
    BlocProvider.of<CommunicationCubit>(context).getTextMessages();
    super.initState();
    wallpapersList.add('assets/0076.jpg');
    wallpapersList.add('assets/AZ9I0320.jpg');
    wallpapersList.add('assets/AZ9I0399.jpg');
    wallpapersList.add('assets/AZ9I0426.jpg');
    wallpapersList.add('assets/AZ9I0435.jpg');
    wallpapersList.add('assets/AZ9I0483.jpg');
    wallpapersList.add('assets/AZ9I0522.jpg');
    wallpapersList.add('assets/AZ9I0552.jpg');
    wallpapersList.add('assets/AZ9I0785.jpg');
    wallpapersList.add('assets/AZ9I0853.jpg');
    wallpapersList.add('assets/AZ9I1005.jpg');
    wallpapersList.add('assets/AZ9I1030.jpg');
    wallpapersList.add('assets/AZ9I1134.jpg');
    wallpapersList.add('assets/AZ9I1269.jpg');
    wallpapersList.add('assets/AZ9I1627.jpg');
    wallpapersList.add('assets/AZ9I1880.jpg');
    wallpapersList.add('assets/AZ9I2289.jpg');
    wallpapersList.add('assets/AZ9I2415.jpg');
    wallpapersList.add('assets/AZ9I2462.jpg');
    wallpapersList.add('assets/AZ9I2792.jpg');
    wallpapersList.add('assets/AZ9I2811.jpg');
    wallpapersList.add('assets/AZ9I2834.jpg');
    wallpapersList.add('assets/AZ9I2872.jpg');
    wallpapersList.add('assets/AZ9I2882.jpg');
    wallpapersList.add('assets/AZ9I3036.jpg');
    wallpapersList.add('assets/AZ9I3191.jpg');
    wallpapersList.add('assets/AZ9I3197.jpg');
    wallpapersList.add('assets/AZ9I3353.jpg');
    wallpapersList.add('assets/AZ9I3431.jpg');
    wallpapersList.add('assets/AZ9I3731.jpg');
    wallpapersList.add('assets/AZ9I3774.jpg');
    wallpapersList.add('assets/AZ9I3777.jpg');
    wallpapersList.add('assets/AZ9I3895.jpg');
    wallpapersList.add('assets/AZ9I8767.jpg');
    wallpapersList.add('assets/AZ9I8878.jpg');
    wallpapersList.add('assets/AZ9I8999.jpg');
    wallpapersList.add('assets/AZ9I9136.jpg');
    wallpapersList.add('assets/AZ9I9276.jpg');
    wallpapersList.add('assets/AZ9I9315.jpg');
    wallpapersList.add('assets/AZ9I9442.jpg');
    wallpapersList.add('assets/AZ9I9629.jpg');
    wallpapersList.add('assets/AZ9I9797.jpg');
    wallpapersList.add('assets/AZ9I9942.jpg');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF595959), Color(0xFF000000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child:new MasonryGridView.count(
                  padding: const EdgeInsets.all(8.0),
                  crossAxisCount: 3,
                  itemCount: wallpapersList.length,
                  itemBuilder: (context, i) {
                    String imgPath = wallpapersList[i];
                    return new Material(
                      elevation: 8.0,
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(8.0)),
                      child: new InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FullScreenImagePage(imgPath),
                          ),
                        ),
                        child: new Hero(
                          tag: imgPath,
                          child: new FadeInImage(
                            image: new AssetImage(imgPath),
                            fit: BoxFit.cover,
                            placeholder: new AssetImage("assets/newg3.png"),
                          ),
                        ),
                      ),
                    );
                  },
                  // staggeredTileBuilder: (i) =>
                  //     new StaggeredTile.count(2, i.isEven ? 2 : 3),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                )
              ,
    );


  }
  //   return new Scaffold(
  //       body: wallpapersList != null
  //           ? new MasonryGridView.count(
  //               padding: const EdgeInsets.all(8.0),
  //               crossAxisCount: 3,
  //               itemCount: wallpapersList.length,
  //               itemBuilder: (context, i) {
  //                 String imgPath = wallpapersList[i];
  //                 return new Material(
  //                   elevation: 8.0,
  //                   borderRadius:
  //                       new BorderRadius.all(new Radius.circular(8.0)),
  //                   child: new InkWell(
  //                     onTap: () => Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (_) => FullScreenImagePage(imgPath),
  //                       ),
  //                     ),
  //                     child: new Hero(
  //                       tag: imgPath,
  //                       child: new FadeInImage(
  //                         image: new AssetImage(imgPath),
  //                         fit: BoxFit.cover,
  //                         placeholder: new AssetImage("assets/newg3.png"),
  //                       ),
  //                     ),
  //                   ),
  //                 );
  //               },
  //               // staggeredTileBuilder: (i) =>
  //               //     new StaggeredTile.count(2, i.isEven ? 2 : 3),
  //               mainAxisSpacing: 8.0,
  //               crossAxisSpacing: 8.0,
  //             )
  //           : new Center(
  //               child: new CircularProgressIndicator(),
  //             ));
  // }
}
