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
  final String appLogoPictureUrl = '';
  final appNameController = TextEditingController();
  String logoFilePath = '';
  List<String> slidePictures = [];

  TextEditingController appShortDescriptionController = TextEditingController();

  final appVersionController = TextEditingController();

  TextEditingController uploadDateController = TextEditingController();
  TextEditingController fileSizeController = TextEditingController();
  TextEditingController intstallLinkController = TextEditingController();
  TextEditingController longDescriptionController = TextEditingController();
  TextEditingController userDataAndManagementController =
      TextEditingController();
  TextEditingController termsAndConditionController = TextEditingController();
  uploadPicture() async {
    XFile? file = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);
    setState(() {
      logoFilePath = file!.path;
    });
  }

  @override
  build(BuildContext context) {
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
                    color: Colors.black54, fontStyle: FontStyle.normal)),
          ),
        ),
      );
    }

    uploadToFirebase() async {
      File file = File(logoFilePath);

      String url = await ImageKit.io(
        file.readAsBytesSync(),
        fileName: 'afilename',
        //  folder: "folder_name/nested_folder", (Optional)
        privateKey: privateKey, // (Keep Confidential)
        onUploadProgress: (progressValue) {
          if (true) {
            debugPrint(progressValue.toString());
          }
        },
      ).then((ImagekitResponse data) {
        /// Get your uploaded Image file link from [ImageKit.io]
        /// then save it anywhere you want. For Example- [Firebase, MongoDB] etc.

        debugPrint(data.url!); // (you will get all Response data from ImageKit)
        return data.url!;
      });
      debugPrint(url);
      setState(() {
        data['appLogoPictureUrl'] = url;
      });

      var res = await FirebaseFirestore.instance.collection('app').get();
      if (res.docs.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('app')
            .doc(res.docs.first.id)
            .update(data);
      } else {
        await FirebaseFirestore.instance.collection('app').add(data);
      }
    }

    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            uploadToFirebase();
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
                        image:
                            DecorationImage(fit: BoxFit.cover, image: FileImage(

                                //  logoFilePath.isNotEmpt
                                File(logoFilePath))),
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(children: [
                      Positioned(
                          // top: 1,
                          // right: 1,
                          child: IconButton(
                              onPressed: () {
                                uploadPicture();
                              },
                              icon: Icon(Icons.camera_alt_outlined)))
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
                child: SizedBox(
                  height: 100,
                  width: 60,
                  child: ListView.builder(
                      itemCount: slidePictures.length + 1,
                      itemBuilder: (context, index) {
                        if (slidePictures.length + 1 == index) {
                          return Container(
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
                                  },
                                  icon: Icon(Icons.camera_alt_outlined)),
                            ),
                          );
                        }
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
                ),
              ),
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
