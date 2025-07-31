import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_notes/screens/auth/login.dart';
import 'package:college_notes/utils/button.dart';
import 'package:college_notes/utils/customTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  signUp(String email, pass,name, phone) async {
    if (email.isEmpty || pass == null || name==null || phone==null) {
      Get.snackbar('Error', 'Please Fillup Required fields first');
    } else {
      try {
        UserCredential? userCredential;
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass);

            await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
              'name': nameController.text,
              'email': email,
              'phone': phoneController.text,
              
            });

            Get.snackbar('Congratualations!!', 'You successfully signed up');
            emailController.clear();
            passController.clear();

            Get.off(LoginScreen());
            
      } on FirebaseException catch (ex) {
        Get.snackbar('Error', '$ex');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextField(
              hintText: 'Enter Your name',
              controller: nameController,
              labelText: 'Name',
              icon: Icon(Icons.person),
            ),

            SizedBox(height: 20),

            customTextField(
              hintText: 'Enter Your email',
              controller: emailController,
              labelText: 'Email',
              icon: Icon(Icons.email),
              textInputType: TextInputType.emailAddress,
            ),

            SizedBox(height: 20),

            customTextField(
              hintText: 'Enter Your Password',
              controller: passController,
              labelText: 'Password',
              icon: Icon(Icons.password),
              obscureText: true,
            ),

            SizedBox(height: 20),

            customTextField(
              hintText: 'Enter Your Mobile Number',
              controller: phoneController,
              labelText: 'Phone Number',
              icon: Icon(Icons.phone),
              textInputType: TextInputType.phone,
            ),

            SizedBox(height: 30,),

            customButton(
              text: 'Register yourself',
              voidCallback: () {
                signUp(
                  emailController.text.toString(),
                  passController.text.toString(),
                  nameController.text.toString(),
                  phoneController.text.toString(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
