String fakeData = """import 'dart:io';

import 'package:flutter/material.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => AboutAppState();
}

class AboutAppState extends State<AboutApp> {
  @override
  build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(slivers: [
          //slide pictures
          SliverToBoxAdapter(
            child: SizedBox(
              height: 350,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  addAutomaticKeepAlives: true,
                  itemBuilder: ((context, index) {
                    return Container(
                      height: 230,
                      width: 150,
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(
                                  '/home/blueish/Desktop/Screenshot at 2024-01-22 08-40-13.png')))),
                    );
                  })),
            ),
          ),
          //descriptions
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  'descriptions',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),

                Text('')
              ],
            ),

          )
        ]),
      ),
    );
  }
}
""";
