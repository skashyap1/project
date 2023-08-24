import 'package:flutter/material.dart';

class SongStack extends StatefulWidget {
  const SongStack({super.key});

  @override
  State<SongStack> createState() => _SongStackState();
}

class _SongStackState extends State<SongStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.2,
           width: MediaQuery.of(context).size.width*0.2,
           color: Colors.amber,
           child: Image.asset(""),
        ),
        Positioned(bottom:0,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("50 Most Played",style: TextStyle(color: Colors.white, fontSize: 20),)],
          ),
        ),)
      ],
    );
  }
}