import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Storage {
  static FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  static Future<String?> uploadPostImages({
    required XFile pickedFile,
    required String uid,
  }) async {
    try {
      Reference _reference = _firebaseStorage
          .ref()
          .child('posts')
          .child(uid)
          .child(DateTime.now().microsecondsSinceEpoch.toString());

      TaskSnapshot uploadTask = await _reference.putData(
          await pickedFile.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'));
      return uploadTask.ref.getDownloadURL();
    } catch (e) {}
  }

  static Future<String?> uploadUserProfile(
      {required XFile pickedFile, required String uid}) async {
    try {
      Reference _reference = _firebaseStorage.ref().child('porfile').child(uid);

      TaskSnapshot uploadTask = await _reference.putData(
          await pickedFile.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'));
      return uploadTask.ref.getDownloadURL();
    } catch (e) {}
  }
}
