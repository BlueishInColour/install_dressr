import 'dart:core';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InstallBar extends StatefulWidget {
  InstallBar({
    super.key,
    required this.appName,
    required this.appShortDescription,
    required this.appSize,
    required this.appVersion,
    required this.installLink,
    required this.uploadDate,
    required this.appLogoPictureUrl,
  });
  String appName = ' ';
  String appVersion = ' ';
  String appShortDescription = ' ';
  String uploadDate = ' ';
  String appSize = ' ';
  String installLink = ' ';
  String appLogoPictureUrl = ' ';
  @override
  State<InstallBar> createState() => InstallBarState();
}

class InstallBarState extends State<InstallBar> {
  @override
  build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //app logo
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(widget.appLogoPictureUrl))),
        ),
        SizedBox(width: 10),
//-------------------
        SizedBox(
          width: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //name

              Text(
                widget.appName,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
              ),

              //short description

              Text(
                widget.appShortDescription,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),

//------------------

        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //upload date and time
            Text(
              widget.uploadDate,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
            ),
            //app size
            Text(
              widget.appSize,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
            //installbuttons

            ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(50, 30)),
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () async {
                  debugPrint('installit');
                  // http.get(Uri.parse(widget.installLink));
                  await launchUrl(Uri.parse(widget.installLink),
                      mode: LaunchMode.inAppWebView,
                      webOnlyWindowName: 'download dressr');
                },
                child: Text(
                  'install',
                  style: TextStyle(fontSize: 10),
                )),
            Text(
              widget.appVersion,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 9,
                  fontWeight: FontWeight.w900),
            )
          ],
        )
      ],
    );
  }
}
