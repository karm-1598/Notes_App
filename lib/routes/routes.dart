import 'package:college_notes/screens/auth/forgotPassword.dart';
import 'package:college_notes/screens/auth/login.dart';
import 'package:college_notes/screens/auth/registration.dart';
import 'package:college_notes/screens/home/homeScreen.dart';
import 'package:college_notes/screens/notesScreen.dart';
import 'package:get/get.dart';

class goto{
  static Transition transition = Transition.circularReveal;
  static Duration duration = const Duration(milliseconds: 500);

  static goLoginScreen(){
    Get.off(()=> LoginScreen());
  }

  static goSignUpScreen(){
    Get.to(()=> SignUp());
  }

  static goHomePage(){
    Get.off(()=> Myhome());
  }

  static goforgotPass(){
    Get.to(()=> Forgotpassword());
  }

  static goNotesScreen({required note}){
    Get.to(()=>Notesscreen(note: note,));
  }
}