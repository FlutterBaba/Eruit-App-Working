import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yaqoob_test_project/Pages/order/order_details/order_details.dart';
import 'package:yaqoob_test_project/utils/hex_color.dart';
import '../../../../Models/get_order_model.dart';
import '../../../../const.dart';

class SingleOrder extends StatelessWidget {
  final Entities entities;
  const SingleOrder({
    required this.entities,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OrderDetailsPage(order: entities.order!),
        ));
      },
      padding: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: kwhiteColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kwhiteColor),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(orderImage),
          ),
          title: Row(
            children: [
              Text(
                "${entities.name}\t",
                style: TextStyle(
                  fontSize: 14.0 * MediaQuery.of(context).textScaleFactor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SvgPicture.asset(circleIconSvg,
                  color: entities.colorHexa!.toColor())
            ],
          ),
          subtitle: Text("#Order No - ${entities.order}"),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
