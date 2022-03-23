import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stack_submission/View/ListPointsWidget.dart';
import 'package:stack_submission/View/NeuContainer.dart';
import 'View/SwitchWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  bool _play = false;

Future loadAudio() async{
 await assetsAudioPlayer.open(
      Playlist(audios: [
        Audio(
          "assets/audio/numb.mp3",
          metas: Metas(
            title: "Comfortably Numb",
            artist: "Pink Floyd",
            album: "The Dark Side Of The Moon",
            image: MetasImage.asset(
                "assets/numb_pic.jpeg"), //can be MetasImage.network
          ),
        ),
        Audio(
          "assets/audio/wish.mp3",
          metas: Metas(
            title: "Wish You Were Here",
            artist: "Pink Floyd",
            album: "Wish You Were Here",
            image: MetasImage.asset(
                "assets/wish_pic.jpeg"), //can be MetasImage.network
          ),
        )
      ]),
      autoStart: false,
      loopMode: LoopMode.playlist //loop the full playlist
  );

}
  @override
  void initState() {
   loadAudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var displayHeight = MediaQuery.of(context).size.height;
    var displayWidth = MediaQuery.of(context).size.width;

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/pic3.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: displayHeight * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 35,
                              color: const Color(0xfff8f8fc),
                              height: 1.1176470588235294,
                            ),
                            children: [
                              TextSpan(
                                  text: "Good Morning\n",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: "Chris Cooper",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ]),
                      ),
                      NeuContainer(
                        height: displayHeight * 0.06,
                        width: displayWidth * 0.125,
                        color: Colors.grey.withOpacity(0.5),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: displayHeight * 0.05
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Living Room",
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 20,
                        color: const Color(0xfff8f8fc),
                        fontWeight: FontWeight.bold,
                        height: 1.1176470588235294,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: displayHeight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NeuContainer(
                        height: displayHeight * 0.25,
                        width: displayWidth * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Home\nTemperature",
                                  style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: displayHeight * 0.02,
                                ),
                                Text.rich(
                                  TextSpan(
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 70,
                                        color: Colors.black,
                                        height: 1.1176470588235294,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: "23 ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: "C",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30)),
                                      ]),
                                ),
                                SizedBox(
                                  height: displayHeight * 0.01,
                                ),
                                SwitchWidget(
                                  switchValue: true,
                                ),
                                // Container(
                                //   width: 10,
                                //     child: Switch(value: null, onChanged: (v){}))
                              ],
                            ),
                          ),
                        ),
                        color: Colors.white,
                      ),
                      NeuContainer(
                        height: displayHeight * 0.25,
                        width: displayWidth * 0.4,
                        color: Colors.grey.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Plug Wall",
                                      style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                      size: 18,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: displayHeight * 0.02,
                                ),
                                ListPointsWidget(
                                  title: "Macbook Pro",
                                ),
                                SizedBox(
                                  height: displayHeight * 0.02,
                                ),
                                ListPointsWidget(
                                  title: "HomePod",
                                ),
                                SizedBox(
                                  height: displayHeight * 0.02,
                                ),
                                ListPointsWidget(
                                  title: "Playstation 5",
                                ),
                                SizedBox(
                                  height: displayHeight * 0.02,
                                ),
                                SwitchWidget(),

                                // Container(
                                //   width: 10,
                                //     child: Switch(value: null, onChanged: (v){}))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: displayHeight * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NeuContainer(
                        height: displayHeight * 0.20,
                        width: displayWidth * 0.4,
                        color: Colors.grey.withOpacity(0.5),
                        child: Center(
                            child: AudioWidget.assets(
                                play: _play,
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon:  Icon(Icons.skip_previous_rounded, color: Colors.white60,),
                                      onPressed: () {
                                        if(_play){
                                          assetsAudioPlayer.previous();
                                        } else {
                                          assetsAudioPlayer.pause();
                                        }
                                      },
                                    ),
                                    NeuContainer(
                                      height: MediaQuery.of(context).size.height * 0.06,
                                      width: MediaQuery.of(context).size.width * 0.125,
                                      color: Colors.grey.withOpacity(0.5),
                                      child: Center(
                                        child: IconButton(
                                          icon:  !_play ? Icon(Icons.play_arrow, color: Colors.white60,) : Icon(Icons.pause, color: Colors.white60,),
                                          onPressed: () async {
                                              setState(()  {

                                              });
                                              _play = !_play;
                                              if(!_play) {
                                                 await assetsAudioPlayer.pause();
                                              } else if(_play) {
                                                 await assetsAudioPlayer.play();
                                              }

                                          },
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon:  Icon(Icons.skip_next_rounded, color: Colors.white60,),
                                      onPressed: () {
                                        if(_play){
                                          assetsAudioPlayer.next();
                                        } else {
                                          assetsAudioPlayer.pause();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                loopMode: LoopMode.none,
                                path: "")),
                      ),
                      NeuContainer(
                        height: displayHeight * 0.20,
                        width: displayWidth * 0.4,
                        color: Colors.grey.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Smart TV",
                                      style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                      size: 18,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: displayHeight * 0.02,
                                ),
                                ListPointsWidget(
                                  title: "Samsung UA",
                                ),
                                SizedBox(
                                  height: displayHeight * 0.03,
                                ),
                                SwitchWidget()
                                // Container(
                                //   width: 10,
                                //     child: Switch(value: null, onChanged: (v){}))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: displayHeight * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Statistics",
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 20,
                          color: const Color(0xfff8f8fc),
                          fontWeight: FontWeight.bold,
                          height: 1.1176470588235294,
                        ),
                      ),
                      Text(
                        "Month",
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 15,
                          color: const Color(0xfff8f8fc),
                          fontWeight: FontWeight.w500,
                          height: 1.1176470588235294,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: displayHeight * 0.02,
                  ),
                  NeuContainer(
                    height: displayHeight * 0.25,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Electricity Usage",
                                style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 18,
                              )
                            ],
                          ),
                          SizedBox(
                            height: displayHeight * 0.07,
                          ),
                          Center(
                            child: Icon(Icons.add, color: Colors.white,),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
