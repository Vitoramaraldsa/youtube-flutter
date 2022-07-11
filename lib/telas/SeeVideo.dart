import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class SeeVideo extends StatefulWidget {
  String videoid;
  SeeVideo(this.videoid);
  @override
  State<SeeVideo> createState() => _SeeVideoState();
}

class _SeeVideoState extends State<SeeVideo> {
  late YoutubePlayerController ytController;

  @override
  Widget build(BuildContext context) {

    if(widget.videoid != null){
      ytController = YoutubePlayerController(
          initialVideoId: widget.videoid,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
            startAt: 20
          )
      );
    }
  return
   Sizer(builder: (context,orientation,deviceType){
    return  Scaffold(
      body: Column(
        children: [
          Container(
            height: 90.w,
            padding: EdgeInsets.only(top: 70,left: 10, right: 10),
            child: YoutubePlayer(
              controller: ytController,
              showVideoProgressIndicator: true,
            ) ,
          )
        ],
      ),
    );
  });

  }
}
