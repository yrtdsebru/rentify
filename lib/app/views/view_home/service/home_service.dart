import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentify/app/views/view_home/model/post_request_model.dart';
import 'package:uuid/uuid.dart';

class HomeService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var uuid = const Uuid();

  createPost(PostRequestModel postRequestModel) async {
    await _firestore.collection("posts").doc(uuid.v4()).set(
        {"label": postRequestModel.label, "content": postRequestModel.content});
  }

  
}
