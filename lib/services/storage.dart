import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
    } on FirebaseException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deleteimage(String url) {
    return _firebaseStorage.refFromURL(url).delete();
  }

  static Future<String> changeProfilePicture({
    required XFile pickedFile,
    required String uid,
  }) async {
    Reference _reference =
        _firebaseStorage.ref().child('profilepictures').child(uid);

    TaskSnapshot uploadTask = await _reference.putData(
        await pickedFile.readAsBytes(),
        SettableMetadata(contentType: 'image/jpeg'));
    return uploadTask.ref.getDownloadURL();
  }
}
