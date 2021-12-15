# my_video_player

A simple Flutter Video Player App

## Getting Started

[MyVideoPlayer.dart](https://github.com/mbganesh/VideoPlayer-Flutter/blob/main/lib/MyVideoPlayer.dart)

  - Import video_player package from [pub.dev](https://pub.dev/packages/video_player)


```
dependencies:
  flutter:
    sdk: flutter
  video_player: ^2.2.7
  ```
  
  - Create VideoPlayerController 
  
  ```
   VideoPlayerController? controller;
   
//  <!--    Init controller  -->
   
     @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(asset)..initialize().then((_) {        // or -> VideoPlayerController.network(dataSource)
      setState(() {
      });
    });
    
//  <!--   dispose player when app close   -->
  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

```

  - Then create VideoPlayer with aspectRatio

 ```
  controller!.value.isInitialized ?
          AspectRatio(aspectRatio: controller!.value.aspectRatio , 
          child: VideoPlayer(controller!),
          )
          :
          Container(height: 200,  width: double.infinity, child: Center(child: CircularProgressIndicator(),
          ),
          )
          
 ```
 
  -  Finally create play and pause button 
 
 ```
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
    
 ```


