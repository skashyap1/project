import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sangeet_music/screens/player.dart';
import 'package:sangeet_music/services/songClient.dart';
import 'package:sangeet_music/services/songModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SongClient songClient = SongClient();
  AudioPlayer audioPlayers = AudioPlayer();
  bool isSongPlaying = false;
  TextEditingController searchController = TextEditingController();

  late Future<List<SongModel>> _futureSongs;

  @override
  void initState() {
    super.initState();
    _futureSongs = _getSongsFromAPI(searchQuery: searchController.text);
  }

  Future<List<SongModel>> _getSongsFromAPI(
      {String searchQuery = 'arijit singh'}) async {
    Map<String, dynamic> cMap =
        await songClient.getSongs(searchQuery);
    List<dynamic> sList = cMap['results'];
    List<SongModel> finalSongList = toSongModel(sList);
    return finalSongList;
  }

  toSongModel(List<dynamic> list) {
    List<SongModel> convertedSongs = list.map((singleObject) {
      SongModel sModel = SongModel.extractData(singleObject);
      return sModel;
    }).toList();
    return convertedSongs;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              // title: const Text("MUSIC APP"),
              // centerTitle: true,
              leading: TextField(
                controller: searchController,
                onSubmitted: (value) {
                  setState(() {
                    print('Submitted $value ');

                    _getSongsFromAPI(searchQuery: value);
                  });
                },
              ),
            ),
            body: Container(
                child: FutureBuilder(
                    future: _futureSongs,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text("Error : ${snapshot.error.toString()}"),
                        );
                      } else if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => SongPlayer(
                                                  currentSongIndex: index,
                                                  fullList: snapshot.data!,
                                                )));
                                    // SongPlayer(
                                    //       artWorkUrl: snapshot
                                    //           .data![index]
                                    //           .artworkUrl100,
                                    //       artistName: snapshot
                                    //           .data![index].artistName,
                                    //       previewUrl: snapshot
                                    //           .data![index].previewUrl,
                                    //       trackName: snapshot
                                    //           .data![index].trackName,
                                    //       currentStat: snapshot
                                    //           .data![index].isPlaying,
                                    //     )));
                                  },
                                  leading: Image.network(
                                      snapshot.data![index].artworkUrl100),
                                  title: Text(snapshot.data![index].trackName),
                                  subtitle:
                                      Text(snapshot.data![index].artistName),
                                  trailing: IconButton(
                                      onPressed: () async {
                                        isSongPlaying
                                            ? await audioPlayers.pause()
                                            : await audioPlayers.play(UrlSource(
                                                snapshot
                                                    .data![index].previewUrl));
                                        isSongPlaying = !isSongPlaying;
                                        snapshot.data![index].isplaying =
                                            !snapshot.data![index].isplaying;
                                        setState(() {}); //widget tree rebuild
                                      },
                                      icon: Icon(
                                          (snapshot.data![index].isplaying
                                              ? Icons.pause
                                              : Icons.play_arrow))));
                            });
                        // return const Center(
                        //   child: Text("SUCCESS"),
                        // );
                      }
                      return const Placeholder();
                    }))));
  }
}
