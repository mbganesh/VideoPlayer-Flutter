import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({ Key? key }) : super(key: key);

  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {


  VideoPlayerController? controller;

  String dataSource = "https://shivanesboutique.com/pub/media/S_MAM_VIDEO_10042021.mp4";
  String asset = "assets/my_video.mp4";

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(asset)..initialize().then((_) {
      setState(() {
      });
    });


    // controller!.play();
  }


  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player App"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          controller!.value.isInitialized ?
          AspectRatio(aspectRatio: controller!.value.aspectRatio , 
          child: VideoPlayer(controller!),
          )
          :
          Container(height: 200,  width: double.infinity, child: Center(child: CircularProgressIndicator(),),)
        ],
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        setState(() {
          if(controller!.value.isPlaying){
            controller!.pause();
          }else{
            controller!.play();
          }
        });
      },
      child: Icon( 
        controller!.value.isPlaying ?
        Icons.pause:
        Icons.play_arrow

       ),
    ),
    
    )
    ;
  }
}