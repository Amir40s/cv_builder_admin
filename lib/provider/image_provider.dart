import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MyImageProvider with ChangeNotifier {
  Uint8List? _imageBytes;
  File? _imageFile;
  String? _imagePath;

  Uint8List? get imageBytes => _imageBytes;
  File? get imageFile => _imageFile;
  String? get imagePath => _imagePath;

  Future<void> pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      if (kIsWeb) {
        _imageBytes = await pickedImage.readAsBytes();
      } else {
        _imageFile = File(pickedImage.path);
        _imagePath = pickedImage.path;
      }
      notifyListeners();
    } else {
      print("No image selected");
    }
  }
}
//   void clearImage() {
//     _logopath = blankImage;
//     notifyListeners();
//   }
// }
// void onDenied(BuildContext context){
//   showDialog(
//     context: context,
//     builder: (ctx) => AlertDialog(
//       backgroundColor: Colors.white,
//       surfaceTintColor: Colors.white,
//       title: const Text('Permissions Request'),
//       content: Text('This app needs storage permissions to Store Files. Please enable it in the app settings.'),
//       actions: <Widget>[
//         InkWell(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             child: SizedBox(width: 120,child: Center(child: Text('OPEN SETTINGS',style: TextStyle(color: appColor),))),
//             onTap: () {
//               openAppSettings();
//               Navigator.of(ctx).pop();
//             }
//         ),
//         InkWell(
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//           child: SizedBox(width: 60,child: Center(child: Text('CANCEL',style: TextStyle(color: appColor),))),
//           onTap: () => Navigator.of(ctx).pop(),
//         )
//       ],
//     ),
//   );
// }
