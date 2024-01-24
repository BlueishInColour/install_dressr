import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imagekit_io/imagekit_io.dart';
import 'package:install_dressup/utils/utils_functions.dart';

class EditAppDetails extends StatefulWidget {
  const EditAppDetails({super.key});

  @override
  State<EditAppDetails> createState() => EditAppDetailsState();
}

class EditAppDetailsState extends State<EditAppDetails> {
  String appLogoPictureUrl = '';
  TextEditingController appNameController = TextEditingController();
  String logoFileUrl = '';
  List<String> slidePictures = [
    // 'https://ik.imagekit.io/bluerubic/flutter_imagekit/afilename_GWterYMk2'
  ];

  TextEditingController appShortDescriptionController = TextEditingController();

  TextEditingController appVersionController = TextEditingController();

  TextEditingController uploadDateController = TextEditingController();
  TextEditingController fileSizeController = TextEditingController();
  TextEditingController intstallLinkController = TextEditingController();
  TextEditingController longDescriptionController = TextEditingController();
  TextEditingController userDataAndManagementController =
      TextEditingController();
  TextEditingController termsAndConditionController = TextEditingController();
  uploadPicture() async {
    String url = await addSingleImage();
    setState(() {
      appLogoPictureUrl = url;
    });
  }

  loadFormerDetails() async {
    var res = await FirebaseFirestore.instance.collection('apppp').get();
    QueryDocumentSnapshot snap = res.docs.first;
    setState(() {
      appNameController.text = snap['appName'];
      appVersionController.text = snap['appVersion'];
      appLogoPictureUrl = snap['appLogoPictureUrl'];
      appShortDescriptionController.text = snap['appShortDescription'];

      slidePictures = snap['slidePictures'];
      uploadDateController.text = snap['uploadDate'];
      fileSizeController.text = snap['fileSize'];
      intstallLinkController.text = snap['installLink'];
      longDescriptionController.text = snap['longDescription'];
      userDataAndManagementController.text = snap['userDataAndManagement'];
      termsAndConditionController.text = snap['termsAndConditions'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadFormerDetails();
  }

  @override
  build(BuildContext context) {
    Widget textField(context,
        {required TextEditingController controller,
        String hintText = '',
        int maxLines = 2}) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextField(
            controller: controller,
            minLines: 1,
            maxLines: maxLines,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 0.541),
                    fontStyle: FontStyle.normal)),
          ),
        ),
      );
    }

    uploadToFirebase() async {
      var data = {
        'appName': appNameController.text,
        'appVersion': appVersionController.text,
        'appLogoPictureUrl': appLogoPictureUrl,
        'appShortDescription': appShortDescriptionController.text,
        'slidePictures': slidePictures,
        'uploadDate': uploadDateController.text,
        'fileSize': fileSizeController.text,
        'installLink': intstallLinkController.text,
        'longDescription': longDescriptionController.text,
        'userDateAndManagement': userDataAndManagementController.text,
        'termsAndConditions': termsAndConditionController.text
      };

      var res = await FirebaseFirestore.instance.collection('apppp').get();
      if (res.docs.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('apppp')
            .doc(res.docs.first.id)
            .update(data);
      } else {
        await FirebaseFirestore.instance.collection('apppp').add(data);
      }
      Navigator.pop(context);
    }

    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await uploadToFirebase();
          },
          child: Icon(Icons.upload_sharp),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomScrollView(
            slivers: [
              //applogo
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                CachedNetworkImageProvider(appLogoPictureUrl)),
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(children: [
                      Positioned(
                          // top: 1,
                          // right: 1,
                          child: Center(
                        child: IconButton(
                            onPressed: () {
                              uploadPicture();
                            },
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.amber,
                            )),
                      ))
                    ]),
                  ),
                ),
              ),
              //app name
              textField(context,
                  controller: appNameController, hintText: 'app name'),
              //app version
              textField(context,
                  controller: appVersionController, hintText: 'version'),
              //short descruiption
              textField(context,
                  controller: appShortDescriptionController,
                  hintText: 'short description'),

              //slide pictures
              SliverToBoxAdapter(
                  child: slidePictures.isNotEmpty
                      ? SizedBox(
                          height: 100,
                          width: 60,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: slidePictures.length,
                              itemBuilder: (context, index) {
                                // if (slidePictures.length + 1 == index) {
                                //   return Container(
                                //     height: 100,
                                //     width: 60,
                                //     child: Center(
                                //       child: IconButton(
                                //           onPressed: () async {
                                //             List<String> pictures =
                                //                 await pickPicture(false);
                                //             setState(() {
                                //               slidePictures.addAll(pictures);
                                //             });
                                //           },
                                //           icon:
                                //               Icon(Icons.camera_alt_outlined)),
                                //     ),
                                //   );
                                // }
                                return Stack(
                                  children: [
                                    CachedNetworkImage(
                                      height: 100,
                                      width: 60,
                                      imageUrl: slidePictures[index],
                                    ),
                                    Positioned(
                                        right: 5,
                                        top: 5,
                                        child: IconButton(
                                          onPressed: () {
                                            slidePictures.removeAt(index);
                                          },
                                          icon: Icon(Icons.cancel),
                                        ))
                                  ],
                                );
                              }),
                        )
                      : Container(
                          height: 100,
                          width: 60,
                          child: Center(
                            child: IconButton(
                                onPressed: () async {
                                  List<String> pictures =
                                      await pickPicture(false);
                                  setState(() {
                                    slidePictures.addAll(pictures);
                                  });
                                  debugPrint('pictures added');
                                },
                                icon: Icon(Icons.camera_alt_outlined)),
                          ),
                        )),
              //date
              textField(context,
                  controller: uploadDateController, hintText: 'upload date'),
              //fileSize
              textField(context,
                  controller: fileSizeController, hintText: 'file size'),
              //install or download link
              textField(context,
                  controller: intstallLinkController, hintText: 'install link'),
              //slide pictures app details
// _____________________________

              //long description for app
              textField(context,
                  controller: longDescriptionController,
                  hintText: 'long description',
                  maxLines: 100),
              //user data -- how user data is store and managed
              textField(context,
                  controller: userDataAndManagementController,
                  hintText: 'user data and mangement',
                  maxLines: 100),
              //terms and conditions
              textField(context,
                  controller: termsAndConditionController,
                  hintText: 'terms and conditions',
                  maxLines: 100),
            ],
          ),
        ));
  }
}

// import 'package:flutter/material.dart';

class UploadApp extends StatefulWidget {
  const UploadApp({super.key});

  @override
  State<UploadApp> createState() => UploadAppState();
}

class UploadAppState extends State<UploadApp> {
  @override
  build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, PageRouteBuilder(pageBuilder: (context, _, __) {
          return EditAppDetails();
        }));
      },
      child: Icon(Icons.upload_sharp),
    );
  }
}
