import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yaqoob_test_project/Models/register_model.dart';
import 'package:yaqoob_test_project/api/api_service.dart';
import '../../../const.dart';
import '../login/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController firmName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool isloading = false;
  @override
  void dispose() {
    userName.dispose();
    firstName.dispose();
    lastName.dispose();
    firmName.dispose();
    password.dispose();
    email.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        actions: const [],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(logoSmallImagee),
                const SizedBox(height: 40),
                Row(
                  children: const [
                    Text(
                      "Welcome to\t",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      "Eruit",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: kpColor,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Registration",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: klightTextColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CupertinoButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                      },
                      padding: EdgeInsets.zero,
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          color: kpColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: OverflowBar(
              overflowSpacing: 20,
              children: [
                TextField(
                  controller: userName,
                  decoration: const InputDecoration(labelText: "userName"),
                ),
                TextField(
                  controller: firstName,
                  decoration: const InputDecoration(labelText: "firstName"),
                ),
                TextField(
                  controller: lastName,
                  decoration: const InputDecoration(labelText: "lastName"),
                ),
                TextField(
                  controller: firmName,
                  decoration: const InputDecoration(labelText: "firmName"),
                ),
                TextField(
                  obscureText: true,
                  controller: password,
                  decoration: const InputDecoration(labelText: "password"),
                ),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(labelText: "email"),
                ),
                TextField(
                  keyboardType: TextInputType.phone,
                  controller: phone,
                  decoration: const InputDecoration(labelText: "phone"),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: validation,
                    child: isloading
                        ? const CircularProgressIndicator(color: kwhiteColor)
                        : const Text("Register"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  validation() {
    if (userName.text.trim().isEmpty) {
      return Fluttertoast.showToast(msg: "User Name is Empty");
    } else if (firstName.text.trim().isEmpty) {
      return Fluttertoast.showToast(msg: "First Name is Empty");
    } else if (lastName.text.trim().isEmpty) {
      return Fluttertoast.showToast(msg: "Last Name is Empty");
    } else if (firmName.text.trim().isEmpty) {
      return Fluttertoast.showToast(msg: "Firm Name is Empty");
    } else if (password.text.trim().isEmpty) {
      return Fluttertoast.showToast(msg: "Password is Empty");
    } else if (email.text.trim().isEmpty) {
      return Fluttertoast.showToast(msg: "Email is Empty");
    } else if (phone.text.trim().isEmpty) {
      return Fluttertoast.showToast(msg: "Phone Number is Empty");
    } else {
      setState(() {
        isloading = true;
      });
      APIService apiService = APIService();
      apiService
          .createUserAccount(
        registerModel: RegisterModel(
          email: email.text,
          firmName: firmName.text,
          firstName: firstName.text,
          lastName: lastName.text,
          password: password.text,
          phone: phone.text,
          userName: userName.text,
        ),
      )
          .then(
        (value) {
          setState(() {
            isloading = false;
          });
          if (value.requestResponse == false) {
            return Fluttertoast.showToast(msg: value.messages![0]);
          } else {
            Fluttertoast.showToast(msg: value.messages![0]);

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          }
        },
      );
    }
  }
}
