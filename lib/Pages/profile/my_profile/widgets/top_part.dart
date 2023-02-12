import 'package:flutter/material.dart';

import '../../../../Models/profile_model.dart';
import '../../../../const.dart';

class TopPart extends StatelessWidget {
  final ProfileModel profileModel;
  const TopPart({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
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
                  child: profileModel.data!.profilePic!.isEmpty
                      ? Image.asset(noImage)
                      : Image.network(profileModel.data!.profilePic!),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              profileModel.data!.firstName.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              profileModel.data!.emailId.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: klightTextColor,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Text("Edit Profile"),
              label: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
