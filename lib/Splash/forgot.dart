import 'package:flutter/material.dart';
import 'package:restuarant/Authentication/google_signin.dart';
class ForgotPasword extends StatefulWidget {
  const ForgotPasword({Key? key}) : super(key: key);

  @override
  State<ForgotPasword> createState() => _ForgotPaswordState();
}

class _ForgotPaswordState extends State<ForgotPasword> {
var emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          TextField(
            controller: emailController,
          
          ),
          TextButton(onPressed: () {
            resetPassword(emailController.text);
          }, child: Text("Send mail"))
        ],
      ),
    );
  }
}
