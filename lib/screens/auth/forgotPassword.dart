import 'package:college_notes/routes/routes.dart';
import 'package:college_notes/utils/button.dart';
import 'package:college_notes/utils/customTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController emailController= TextEditingController();

  resetPass(String email)async{
    if(email.isEmpty){
      Get.snackbar('Error', 'Enter required field');
    }else{
      
        try{
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        goto.goLoginScreen();
        }on FirebaseAuthException catch (ex) {
          print(ex);
        }
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customTextField(hintText: 'Enter Your Email', controller: emailController),
          SizedBox(height: 30,),
          customButton(text: 'Reset Password', voidCallback: (){resetPass(emailController.text.toString());})
        ],
      ),
    );
  }
}