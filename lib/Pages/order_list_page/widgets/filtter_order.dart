import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltterOrder extends StatelessWidget {
  const FiltterOrder({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () async {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [Text("Select"), Icon(Icons.arrow_drop_down_sharp)],
        ),
      ),
    );
  }
}
