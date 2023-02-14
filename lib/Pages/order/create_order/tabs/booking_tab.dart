import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../const.dart';

TextEditingController name = TextEditingController();
TextEditingController address1 = TextEditingController();
TextEditingController telephone1 = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController contact = TextEditingController();
TextEditingController telephone2 = TextEditingController();
TextEditingController email1 = TextEditingController();

class BookingTab extends StatefulWidget {
  const BookingTab({super.key});

  @override
  State<BookingTab> createState() => _BookingTabState();
}

class _BookingTabState extends State<BookingTab> {
  @override
  void dispose() {
    name.dispose();
    address1.dispose();
    telephone1.dispose();
    email.dispose();
    phone.dispose();
    contact.dispose();
    telephone2.dispose();
    email1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: kborderColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/no_image.png"),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: kpColor,
                    child: SvgPicture.asset("assets/icons/edit.svg"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          OverflowBar(
            overflowSpacing: 20,
            children: [
              TextField(
                controller: name,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: address1,
                keyboardType: TextInputType.streetAddress,
                decoration: const InputDecoration(labelText: "Address 1"),
              ),
              TextField(
                controller: telephone1,
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: "Telephone 1"),
              ),
              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: phone,
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: "Phone"),
              ),
              TextField(
                controller: contact,
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: "Contact"),
              ),
              TextField(
                controller: telephone2,
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: "Telephone 2"),
              ),
              TextField(
                controller: email1,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: "Email 1"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
