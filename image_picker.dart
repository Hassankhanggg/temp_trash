import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ishare/screens/add_item_details.dart';

class ChooseImage {
  static final ChooseImage _instance = new ChooseImage.internal();
  factory ChooseImage() => _instance;
  ChooseImage.internal();
  File _cameraImage;
  ImagePicker _imagePicker = ImagePicker();

  List<File> _imageFiles;
  FilePickerResult _filePickerResult;

  openCamera() async {
    PickedFile file = await _imagePicker.getImage(
      source: ImageSource.camera,
    );
    if (null != file) {
      _cameraImage = File(file.path);
      _imageFiles.add(_cameraImage);
      Get.off(() => () => AddItemDetailScreen(files: _imageFiles));
    } else {
      Text("Error while opening Camera");
    }
  }

  openFileExplore() async {
    try {
      _filePickerResult = await FilePicker.platform
          .pickFiles(allowMultiple: true, type: FileType.image);
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (_filePickerResult != null) {
      _imageFiles = _filePickerResult.paths.map((path) => File(path)).toList();
    } else {
      Text("Error while picking Images...");
    }
    Get.off(() => AddItemDetailScreen(files: _imageFiles));
  }
}
