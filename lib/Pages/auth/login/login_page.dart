import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yaqoob_test_project/Models/login_model.dart';
import 'package:yaqoob_test_project/Pages/auth/login/forgot_password/forgot_password.dart';
import 'package:yaqoob_test_project/Pages/bottom_bar/bottom_bar.dart';
import 'package:yaqoob_test_project/shared_service.dart';
import '../../../api/api_service.dart';
import '../../../const.dart';
import '../register_page/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  static TextEditingController firmname = TextEditingController();
  static TextEditingController username = TextEditingController();
  static TextEditingController password = TextEditingController();

  APIService? apiService;
  bool isloading = false;
  @override
  void initState() {
    apiService = APIService();
    super.initState();
  }

  @override
  void dispose() {
    firmname.dispose();
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: OverflowBar(
              overflowSpacing: 20,
              children: [
                TextField(
                  controller: firmname,
                  decoration: const InputDecoration(
                    labelText: "Firm name",
                  ),
                ),
                TextField(
                  controller: username,
                  decoration: const InputDecoration(
                    labelText: "User Id",
                  ),
                ),
                TextField(
                  controller: password,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      icon: obscureText
                          ? SvgPicture.asset("assets/icons/eye-off.svg")
                          : SvgPicture.asset("assets/icons/eye.svg"),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              onPressed: () {
                validate();
              },
              child: isloading
                  ? const CircularProgressIndicator(color: kwhiteColor)
                  : const Text("Login"),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ));
                  },
                  padding: EdgeInsets.zero,
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: kpColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ForgotPassword(),
                    ));
                  },
                  padding: EdgeInsets.zero,
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: ktextColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  validate() {
    if (firmname.text.trim().isEmpty) {
      return Fluttertoast.showToast(msg: "Firm name is Empty");
    } else if (username.text.trim().isEmpty) {
      return Fluttertoast.showToast(msg: "Username is Empty");
    } else if (password.text.trim().isEmpty) {
      return Fluttertoast.showToast(msg: "Password is Empty");
    } else {
      setState(() {
        isloading = true;
      });
      apiService!
          .login(
        loginModel: LoginModel(
          password: password.text.trim(),
          userName: username.text.trim(),
        ),
        firmname: firmname.text.trim(),
      )
          .then((value) {
        setState(() {
          isloading = false;
        });
        if (value.messages!.isNotEmpty) {
          Fluttertoast.showToast(msg: value.messages![0]);
        } else {
          SharedService.setLoginDetails(value);
          Fluttertoast.showToast(msg: "Login Successful");
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const BottomBar(),
          ));
        }
      });
    }
  }
}
