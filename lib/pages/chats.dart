import 'package:first_app/colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  int percent = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (percent == 100) {
        timer.cancel();
        return;
      }
      percent++;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Chats Page"),
        SizedBox(height: 10),

        Container(
          height: 30,
          width: MediaQuery.sizeOf(context).width * percent / 100,
          decoration: BoxDecoration(
            border: Border.all(),
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text("$percent%", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
