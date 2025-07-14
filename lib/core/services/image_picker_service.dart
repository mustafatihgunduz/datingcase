import 'dart:io';

import 'package:datingcase/core/services/logger_service.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    CaseLogger.info('ImagePickerService: pickImageFromGallery called.');

    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        CaseLogger.info(
          'pickImageFromGallery: User selected an imagepath=${pickedFile.path}',
        );
        return File(pickedFile.path);
      } else {
        CaseLogger.info('pickImageFromGallery: User canceled image selection.');
        return null;
      }
    } catch (e, stackTrace) {
      CaseLogger.error(
        'pickImageFromGallery: An error occurred - $e',
        stackTrace,
      );
      return null;
    }
  }
}
