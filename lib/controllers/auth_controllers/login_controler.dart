import 'package:college_notes/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginControler extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  login(String email, pass) async {
    if (email.isEmpty || pass == null) {
      return Get.snackbar('Error!!', 'Please enter required fields');
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pass,
        );

        goto.goHomePage();
        emailController.clear();
        passwordController.clear();
      } on FirebaseAuthException catch (ex) {
        Get.snackbar('Error!!', 'Error:$ex');
        print('Error: $ex');
      }
    }
  }

  Future<bool> loginWithgoogle() async {
    try {
      final GoogleSignInAccount? User = await GoogleSignIn().signIn();
      if(User==null){
        return false;
      }else{
        GoogleSignInAuthentication userAuth = await User.authentication;
      var credential = GoogleAuthProvider.credential(
        idToken: userAuth.idToken,
        accessToken: userAuth.accessToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      goto.goHomePage();
        emailController.clear();
        passwordController.clear();
      return await FirebaseAuth.instance.currentUser != null;
      }
      
    } on FirebaseAuthException catch (ex) {
      print(ex);
      return false;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
