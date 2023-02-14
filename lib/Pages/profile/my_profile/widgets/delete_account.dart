import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yaqoob_test_project/Pages/auth/login/login_page.dart';
import 'package:yaqoob_test_project/api/api_service.dart';

Future<void> deleteAccount(BuildContext context) async {
  bool isloading = false;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text("Delete?"),
          content: const Text("Are you sure you want to delete this account?"),
          actions: <Widget>[
            TextButton(
              child: isloading
                  ? const CircularProgressIndicator()
                  : const Text("Ok"),
              onPressed: () {
                setState(() => isloading = true);
                APIService apiService = APIService();
                apiService.deactivateUser().then(
                  (value) {
                    setState(() => isloading = false);
                    if (value.requestResponse == false) {
                      Fluttertoast.showToast(msg: value.messages![0]);
                    } else {
                      Fluttertoast.showToast(msg: value.messages![0]);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                    }
                  },
                );
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
