import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_disease/image_provider/image_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String imageSrc = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dr. Plant'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.only(left: 10),
        child: Column(
          children: <Widget>[
            Expanded(
              child: imageSrc.isEmpty ? Center(child: Image.asset('assets/images/plant_placeholder.png'),)
              : FutureBuilder(
                  future: Capture.getImage(imageSrc),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      final String imagePath = snapshot.data;
                      return Center(child: Image.file(File(imagePath)),);
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      setState(() {
                        imageSrc = 'camera';
                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.camera_alt_outlined),
                        Text('Camera'),
                      ],
                    )
                ),
                TextButton(
                    onPressed: (){
                      setState(() {
                        imageSrc = 'gallery';
                      });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.image),
                        Text('Gallery'),
                      ],
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
