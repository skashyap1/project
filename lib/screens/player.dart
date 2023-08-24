import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sangeet_music/services/songModel.dart';

class SongPlayer extends StatefulWidget {
  List<SongModel> fullList;
  int currentSongIndex;
  // late String artWorkUrl;
  // late String trackName;
  // late String artistName;
  // late String previewUrl;
  // late bool currentStat;

  SongPlayer({
    super.key,
    required this.fullList,
    required this.currentSongIndex,
  });

  // SongPlayer(
  //     {required this.artWorkUrl,
  //     required this.artistName,
  //     required this.previewUrl,
  //     required this.trackName,
  //     required this.currentStat,
  //     super.key});

  @override
  State<SongPlayer> createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  AudioPlayer songPlayer = AudioPlayer();
  Duration fullDuration = const Duration(seconds: 0);
  Duration currentDuration = const Duration(seconds: 0);
  late PlayerState playerState;
  int elapsed = 0;

  getSongDetails() {
    songPlayer.onDurationChanged.listen((Duration fDuration) {
      setState(() {
        fullDuration = fDuration;
      });
    });
    songPlayer.onPositionChanged.listen((Duration cDuration) {
      setState(() {
        print("this is the current duration $cDuration");
        currentDuration = cDuration;
      });
    });
    songPlayer.onPlayerStateChanged.listen((PlayerState state) {
      print("thiss is the cuttent state $state");
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getSongDetails();
  }

  @override
  Widget build(BuildContext context) {
    print("this is the initial song index ${widget.currentSongIndex}");
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.network(
              // widget.artWorkUrl,
              widget.fullList[widget.currentSongIndex].artworkUrl100,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            // widget.trackName,
            widget.fullList[widget.currentSongIndex].trackName,

            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            // widget.artistName,
            widget.fullList[widget.currentSongIndex].artistName,

            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                Text(
                  currentDuration.inSeconds.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
                Expanded(
                  child: Slider(
                      value: (currentDuration.inSeconds <
                              fullDuration.inSeconds)
                          ? (currentDuration.inSeconds / fullDuration.inSeconds)
                          : 0,
                      onChanged: (value) {
                        int reqDuration =
                            (value * fullDuration.inSeconds).toInt();
                        songPlayer.seek(Duration(seconds: reqDuration));
                        setState(() {});
                      }),
                ),
                Text(fullDuration.inSeconds.toString()),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.no_accounts)),
              IconButton(
                  onPressed: () {
                    widget.currentSongIndex--;
                    print(
                        "This is the decrement button ${widget.currentSongIndex}");
                    songPlayer.play(UrlSource(
                        widget.fullList[widget.currentSongIndex].previewUrl));
                    setState(() {});
                  },
                  icon: const Icon(Icons.skip_previous)),
              IconButton(
                  iconSize: 60,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    // widget.currentStat
                    widget.fullList[widget.currentSongIndex].isplaying
                        ? songPlayer.stop()
                        : songPlayer.play(UrlSource(
                            widget.fullList[widget.currentSongIndex].previewUrl,
                          ));

                    // widget.currentStat = !widget.currentStat;
                    widget.fullList[widget.currentSongIndex].isplaying =
                        !widget.fullList[widget.currentSongIndex].isplaying;

                    setState(() {});
                  },
                  icon: Icon(widget.fullList[widget.currentSongIndex].isplaying
                          ? Icons.pause
                          : Icons.play_arrow
                      // size: 80,
                      )),
              IconButton(
                  onPressed: () {
                    widget.currentSongIndex++;

                    print(
                        "This is the increment button ${widget.currentSongIndex}");

                    songPlayer.play(UrlSource(
                        widget.fullList[widget.currentSongIndex].previewUrl));
                    setState(() {});
                  },
                  icon: const Icon(Icons.skip_next)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.repeat)),
            ],
          ),
        ],
      ),
    ));
  }
}
