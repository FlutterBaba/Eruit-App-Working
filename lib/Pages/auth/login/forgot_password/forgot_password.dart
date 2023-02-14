import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yaqoob_test_project/const.dart';

import '../../../../Models/forgot_password_model.dart';
import '../../../../api/api_service.dart';
import '../login_page.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController firmName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void dispose() {
    firmName.dispose();
    email.dispose();
    userName.dispose();
    super.dispose();
  }

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: OverflowBar(
          overflowSpacing: 20,
          children: [
            Image.asset(logoSmallImagee),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
                Text(
                  "Enter your email address to retrieve your password",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    height: 1.6,
                    color: klightTextColor,
                  ),
                ),
              ],
            ),
            TextField(
              controller: firmName,
              decoration: const InputDecoration(labelText: "Firm name"),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Username"),
              controller: userName,
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: validation,
                    child: isloading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text("Send"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  validation() {
    if (firmName.text.trim().isEmpty) {
      return Fluttertoast.showToast(msg: "Firm Name is Empty");
    } else if (userName.text.trim().isEmpty) {
      return Fluttertoast.showToast(msg: "User Name is Empty");
    } else if (email.text.trim().isEmpty) {
      return Fluttertoast.showToast(msg: "Email is Empty");
    } else {
      setState(() {
        isloading = true;
      });
      APIService apiService = APIService();
      apiService
          .userForgetPassword(
        forgotPasswordModel: ForgotPasswordModel(
          emailId: email.text,
          userName: userName.text,
        ),
        firmName: firmName.text,
      )
          .then(
        (value) {
          setState(() {
            isloading = false;
          });
          if (value.requestResponse == false) {
            Fluttertoast.showToast(msg: value.messages![0]);
          } else {
            Fluttertoast.showToast(msg: value.messages![0]);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ));
          }
        },
      );
    }
  }
}
