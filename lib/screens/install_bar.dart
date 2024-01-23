import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InstallBar extends StatefulWidget {
  const InstallBar({super.key});

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
              image: DecorationImage(image: CachedNetworkImageProvider(''))),
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
                'dress`r',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
              ),

              //short description

              Text(
                'meet fashion, cosplay',
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
              '17/05/23',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
            ),
            //app size
            Text(
              '12mb',
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
                onPressed: () {
                  debugPrint('installit');
                },
                child: Text(
                  'install',
                  style: TextStyle(fontSize: 10),
                ))
          ],
        )
      ],
    );
  }
}
