import 'package:flutter/material.dart';
import 'package:yaqoob_test_project/Pages/auth/login/login_page.dart';
import 'package:yaqoob_test_project/shared_service.dart';

import '../../../../Models/profile_model.dart';
import '../../../../const.dart';
import 'change_password.dart';
import 'delete_account.dart';

class UserDetails extends StatelessWidget {
  final ProfileModel profileModel;
  const UserDetails({super.key, required this.profileModel});
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const ListTile(
          title: Text('User Content'),
        ),
        Column(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              ListTile(
                title: const Text('First name'),
                subtitle: Text(profileModel.data!.firstName.toString()),
              ),
              ListTile(
                title: const Text('Last name'),
                subtitle: Text(profileModel.data!.lastName.toString()),
              ),
              ListTile(
                title: const Text('User name'),
                subtitle: Text(profileModel.data!.userName.toString()),
              ),
              ListTile(
                title: const Text('Phone'),
                subtitle: Text(profileModel.data!.phone.toString()),
              ),
            ],
          ).toList(),
        ),
        const ListTile(
          title: Text('Account Settings'),
        ),
        Column(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              ListTile(
                onTap: () => changePassword(context),
                leading: const Icon(Icons.key, color: kpColor),
                title: const Text("Chnage Password"),
              ),
              ListTile(
                onTap: () => deleteAccount(context),
                leading: const Icon(Icons.delete_outline, color: kpColor),
                title: const Text("Delete Account"),
              ),
              ListTile(
                onTap: () async {
                  SharedService.logout();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ));
                },
                leading: const Icon(Icons.logout, color: kpColor),
                title: const Text("Sign out"),
              ),
            ],
          ).toList(),
        ),
      ],
    );
  }
}
