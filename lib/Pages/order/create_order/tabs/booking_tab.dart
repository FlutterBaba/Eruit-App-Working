import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yaqoob_test_project/provider/order_provider/create_order_provider.dart';
import '../../../../const.dart';

class BookingTab extends StatefulWidget {
  const BookingTab({super.key});

  @override
  State<BookingTab> createState() => _BookingTabState();
}

class _BookingTabState extends State<BookingTab> {
  TextEditingController name = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController telephone1 = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    CreateOrderProvider createOrderProvider =
        Provider.of<CreateOrderProvider>(context, listen: false);
    if (createOrderProvider.editBool == true) {
      name.text = createOrderProvider.name.toString();
      address1.text = createOrderProvider.address1.toString();
      telephone1.text = createOrderProvider.telephone1.toString();
      email.text = createOrderProvider.email.toString();
      phone.text = createOrderProvider.phone.toString();
    }
    super.initState();
  }

  @override
  void dispose() {
    name.clear();
    address1.clear();
    telephone1.clear();
    email.clear();
    phone.clear();
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
          Consumer<CreateOrderProvider>(
            builder: (context, ceateOrderProvider, child) => OverflowBar(
              overflowSpacing: 20,
              children: [
                TextField(
                  onChanged: ceateOrderProvider.setname,
                  controller: name,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                TextField(
                  onChanged: ceateOrderProvider.setAddress1,
                  controller: address1,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(labelText: "Address 1"),
                ),
                TextField(
                  onChanged: ceateOrderProvider.setTelephone1,
                  controller: telephone1,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: "Telephone 1"),
                ),
                TextField(
                  onChanged: ceateOrderProvider.setEmail,
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextField(
                  onChanged: ceateOrderProvider.setPhone,
                  controller: phone,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: "Phone"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
