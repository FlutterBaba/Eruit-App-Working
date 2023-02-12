import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yaqoob_test_project/Models/change_password_model.dart';
import 'package:yaqoob_test_project/api/api_service.dart';
import 'package:yaqoob_test_project/const.dart';

Future<void> changePassword(BuildContext context) async {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  bool oldpasswordobscureText = true;
  bool newpasswordobscureText = true;
  bool isloading = false;
  return showDialog<void>(
    context: context,
    builder: (BuildContext showDialogcontext) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          content: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                OverflowBar(
                  overflowSpacing: 20,
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Change Password',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      obscureText: newpasswordobscureText,
                      controller: oldPassword,
                      decoration: InputDecoration(
                        hintText: "Old Password",
                        suffixIcon: IconButton(
                          icon: newpasswordobscureText
                              ? SvgPicture.asset("assets/icons/eye-off.svg")
                              : SvgPicture.asset("assets/icons/eye.svg"),
                          onPressed: () {
                            setState(() {
                              newpasswordobscureText = !newpasswordobscureText;
                            });
                          },
                        ),
                      ),
                    ),
                    TextField(
                      obscureText: oldpasswordobscureText,
                      controller: newPassword,
                      decoration: InputDecoration(
                        hintText: "Old Password",
                        suffixIcon: IconButton(
                          icon: oldpasswordobscureText
                              ? SvgPicture.asset("assets/icons/eye-off.svg")
                              : SvgPicture.asset("assets/icons/eye.svg"),
                          onPressed: () {
                            setState(() {
                              oldpasswordobscureText = !oldpasswordobscureText;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(
                            () => isloading = true,
                          );
                          APIService apiService = APIService();
                          apiService
                              .changeuserPassword(
                            changePasswordModel: ChangePasswordModel(
                              newPassword: newPassword.text,
                              oldPassword: oldPassword.text,
                            ),
                          )
                              .then(
                            (value) {
                              setState(
                                () => isloading = false,
                              );
                              if (value.requestResponse == false) {
                                Fluttertoast.showToast(msg: value.messages![0]);
                              } else {
                                Fluttertoast.showToast(msg: value.messages![0]);
                                setState(() {
                                  Navigator.of(showDialogcontext).pop();
                                });
                              }
                            },
                          );
                        },
                        child: isloading
                            ? const CircularProgressIndicator(
                                color: kwhiteColor,
                              )
                            : const Text("Submit"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
