import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Storage {
 static FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

 static Future<String?> uploadImageToStorage({required XFile pickedFile}) async {
    try {
      Reference _reference = _firebaseStorage
          .ref()
          .child('posts')
          .child(DateTime.now().microsecondsSinceEpoch.toString());
      TaskSnapshot uploadTask = await _reference.putData(
          await pickedFile.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'));
      return uploadTask.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
