import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  static Future<CroppedFile?> pickedImageFromGallery({
    required BuildContext context,
    required CropStyle cropStyle,
  }) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            cropStyle: cropStyle,
            toolbarColor: Theme.of(context).primaryColor,
            toolbarWidgetColor: Theme.of(context).focusColor,
            backgroundColor: Theme.of(context).primaryColor,
            hideBottomControls: false,
            activeControlsWidgetColor: Theme.of(context).hintColor,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            cropStyle: cropStyle,
            title: 'Crop Image',
          ),
        ],
        compressQuality: 70,
      );
      return croppedFile;
    }
    return null;
  }
}
