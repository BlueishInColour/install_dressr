import 'dart:io';

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
      children: [
        //app logo
        SizedBox(
          height: 70,
          width: 70,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: FileImage(
                          File(
                              '/home/blueish/Desktop/Screenshot at 2024-01-22 08-40-13.png'),
                        ))),
              )),
        ),
        SizedBox(width: 10),
//-------------------
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //name

              Row(
                children: [
                  Text(
                    'dress`r',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'v0.1',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              //short description

              Text(
                'meet fashion, cosplay',
                style: TextStyle(
                    fontSize: 16,
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
              '17/05/2023',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
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
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () {
                  debugPrint('installit');
                },
                child: Text('install'))
          ],
        )
      ],
    );
  }
}
