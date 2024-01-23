import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class EditAppDetails extends StatefulWidget {
  const EditAppDetails({super.key});

  @override
  State<EditAppDetails> createState() => EditAppDetailsState();
}

class EditAppDetailsState extends State<EditAppDetails> {
  final String appLogoPictureUrl = '';

  List<String> slidePictures = [];
  @override
  build(BuildContext context) {
    final appNameController = TextEditingController();

    final appVersionController = TextEditingController();

    TextEditingController appShortDescriptionController =
        TextEditingController();
    TextEditingController uploadDateController = TextEditingController();
    TextEditingController fileSizeController = TextEditingController();
    TextEditingController intstallLinkController = TextEditingController();
    TextEditingController longDescriptionController = TextEditingController();
    TextEditingController userDataAndManagementController =
        TextEditingController();
    TextEditingController termsAndConditionController = TextEditingController();

    Widget textField(context,
        {required TextEditingController controller,
        String hintText = '',
        int maxLines = 2}) {
      return Padding(
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
      );
    }

    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.upload_sharp),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              //applogo
              CircleAvatar(
                radius: 60,
                child: Stack(children: [
                  Positioned(
                      // top: 1,
                      // right: 1,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt_outlined)))
                ]),
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
