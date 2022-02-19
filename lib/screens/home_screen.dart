import 'package:flutter/material.dart';
import 'package:image_editor/screens/edit_image_screen.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Editor',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 20, 
              fontWeight: FontWeight.bold,
            ),),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 100,
              icon: const Icon(
                Icons.image,
              ),
              onPressed: () async {
                XFile? file = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (file != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditImageScreen(
                        selectedImage: file.path,
                      ),
                    ),
                  );
                }
              },
            ),
            const Text("Please Select Image"),
          ],
        ),
      ),
    );
  }
}
