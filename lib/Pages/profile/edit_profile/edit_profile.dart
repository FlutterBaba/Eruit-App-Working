import 'package:flutter/material.dart';
import 'package:yaqoob_test_project/api/api_service.dart';
import '../../../Models/profile_model.dart';
import '../../../const.dart';

class EditProfile extends StatefulWidget {
  final ProfileModel profileModel;
  const EditProfile({super.key, required this.profileModel});
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    firstName.text = widget.profileModel.data!.firstName.toString();
    lastName.text = widget.profileModel.data!.lastName.toString();
    userName.text = widget.profileModel.data!.userName.toString();
    email.text = widget.profileModel.data!.emailId.toString();
    phone.text = widget.profileModel.data!.phone.toString();
    super.initState();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    userName.dispose();
    email.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: OverflowBar(
          overflowSpacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: kborderColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      height: 70,
                      width: 70,
                      child: widget.profileModel.data!.profilePic!.isEmpty
                          ? Image.asset(noImage)
                          : Image.network(
                              widget.profileModel.data!.profilePic.toString(),
                            ),
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              controller: firstName,
              decoration: const InputDecoration(labelText: "First name"),
            ),
            TextField(
              controller: lastName,
              decoration: const InputDecoration(labelText: "Last name"),
            ),
            TextField(
              controller: userName,
              decoration: const InputDecoration(labelText: "User name"),
            ),
            TextField(
              controller: phone,
              decoration: const InputDecoration(labelText: "Phone"),
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(labelText: "Email name"),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      APIService apiService = APIService();
                      apiService.updateProfile(ProfileModel(
                        data: Data(
                          emailId: email.text,
                          firstName: firstName.text,
                          lastName: lastName.text,
                          phone: phone.text,
                          userName: userName.text,
                        ),
                      ));
                    },
                    child: const Text("Save"),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kwhiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: ktextColor,
                        ),
                      ),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: ktextColor),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
