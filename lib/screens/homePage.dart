import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              leading: const Icon(Icons.notifications),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Chip(label: Text("Music")),
                  SizedBox(width: MediaQuery.of(context).size.width*0.1),
                  const Chip(label: Text("Podcast"))
                ],
              ),
              centerTitle: true,
              actions: const [Icon(Icons.settings)],
            ),
            body: Column(
              children: [
                Text(
                  "Trending Playlist",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05),),
                    const  Spacer(),
                     const Chip(label: Text("SEE MORE"))]
                )
              ,
            ));
  }
}
