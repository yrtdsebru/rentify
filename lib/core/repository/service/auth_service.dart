import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rentify/core/repository/model/auth/signin/signin_request_model.dart';
import 'package:rentify/core/repository/model/auth/signup/signup_request_model.dart';
import 'package:rentify/core/repository/model/auth/user/user_response_model.dart';

//tüm auth islemleri, kayit ol, giris yap, cikis yap,  giris yaptigin bilgileri var mı kontrol et
class AuthService {
  // FirebaseAuth ve FirebaseFirestore örneklerinin oluşturulması.
  final FirebaseAuth _auth = FirebaseAuth.instance; //baglanıyoruz  auth
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; //baglanıyoruz firestore

  // Kullanıcı kaydı işlemini gerçekleştiren fonksiyon.
  Future signUp(SignUpRequestModel signUpRequestModel) async {
    // Kullanıcının e-posta ve şifre ile Firebase'e kaydını sağlar.
    final UserCredential userCredential =   // kullanıcının kimlik bilgilerini ve Firebase’e giriş yaparken kullanılan yöntemi içerir.
        await _auth.createUserWithEmailAndPassword(
            email: signUpRequestModel.email,
            password: signUpRequestModel.password);

    // Kayıt işlemi sonrası dönen kullanıcı bilgileri.
    final User? user = userCredential.user;
    if (user == null) {
      throw Exception("User is null");
    }

    // Kullanıcının bilgilerini Firestore'daki "users" koleksiyonuna ekler.
    await _firestore.collection("users").doc(user.uid).set(({
          "userType": signUpRequestModel.userType,
          "userName": signUpRequestModel.userName,
          "name": signUpRequestModel.name,
          "surname": signUpRequestModel.surname,
          "email": signUpRequestModel.email,
          "phoneNumber": signUpRequestModel.phoneNumber,
          "address": signUpRequestModel.address,
          "birth": signUpRequestModel.birth
        }));

    return signUpRequestModel;
  }

// Kullanıcının e-posta ve şifre ile Firebase'e giriş yapmasını sağlar.
  Future signIn(SignInRequestModel signInRequestModel) async {
    final UserCredential
        userCredential = //kullanıcının kimlik bilgilerini ve Firebase’e giriş yaparken kullanılan yöntemi içerir
        await _auth.signInWithEmailAndPassword(
            email: signInRequestModel.email,
            password: signInRequestModel.password);

    // Giriş işlemi sonrası dönen kullanıcı bilgileri.
    final User? user = userCredential.user;
    if (user == null) {
      throw Exception("User is null");
    }
  }

  // Kullanıcının çıkış yapmasını sağlayan fonksiyon.
  Future signOut() async {
    await _auth.signOut();
  }

// Kullanıcının giriş yapıp yapmadığını kontrol eden fonksiyon.
  Future<bool> isSignedIn() async {
    final User? user = _auth.currentUser;
    return user != null;
  }

  // Mevcut kullanıcının bilgilerini döndüren fonksiyon.
  Future<User?> getUser() async {
    return _auth.currentUser;
  }

  // Mevcut kullanıcının detaylı bilgilerini Firestore'dan alıp döndüren fonksiyon.
  Future<UserResponseModel> getUserDetail() async {
    final User? user = _auth.currentUser;
    if (user == null) {
      throw Exception("User is null");
    }

// Firestore'dan kullanıcının detaylı bilgilerini alır.
    DocumentSnapshot documentSnapshot =
        await _firestore.collection("users").doc(user.uid).get();

// Alınan bilgileri UserResponseModel nesnesine dönüştürür ve döndürür.
    return UserResponseModel.fromDocumentSnapshot(documentSnapshot);
  }
}
