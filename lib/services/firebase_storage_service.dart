import 'package:firebase_storage/firebase_storage.dart';

Future<List<String>> getImageUrls(List<String> paths) async {
  FirebaseStorage storage = FirebaseStorage.instance;
  
  List<String> downloadUrls = [];
  
  for (String path in paths) {
    Reference ref = storage.ref(path);
    String downloadUrl = await ref.getDownloadURL();
    downloadUrls.add(downloadUrl);
  }
  
  return downloadUrls;
}
