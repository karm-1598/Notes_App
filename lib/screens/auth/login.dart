import 'package:college_notes/controllers/auth_controllers/login_controler.dart';
import 'package:college_notes/routes/routes.dart';
import 'package:college_notes/utils/button.dart';
import 'package:college_notes/utils/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controller = Get.put(LoginControler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customTextField(
                hintText: 'Enter your Email',
                controller: controller.emailController,
                icon: Icon(Icons.email),
                textInputType: TextInputType.emailAddress,
                labelText: 'Email',
              ),
          
              SizedBox(height: 20),
          
              customTextField(
                hintText: 'Enter Your Password',
                controller: controller.passwordController,
                labelText: 'Password',
                icon: Icon(Icons.password),
                obscureText: true,
              ),
          
              SizedBox(height: 30),
          
              Obx(
                () => controller.isLoading.value
                    ? CircularProgressIndicator()
                    : customButton(
                        text: 'Sign In',
                        voidCallback: () {
                          controller.login(
                            controller.emailController.text.toString(),
                            controller.passwordController.text.toString(),
                          );
                        },
                      ),
              ),
              SizedBox(height: 30,),
              customButton(text: 'SignIn with google', voidCallback: (){controller.loginWithgoogle();}),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Does not have an account? '),
                  TextButton(
                    onPressed: () {
                      goto.goSignUpScreen();
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
              Text('OR'),
              TextButton(
                onPressed: () {
                  goto.goforgotPass();
                },
                child: Text('Forgot Password'),
              ),
              SizedBox(height: 30),
          
              
            ],
          ),
        ),
      ),
    );
  }
}
