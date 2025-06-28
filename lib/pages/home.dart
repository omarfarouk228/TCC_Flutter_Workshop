import 'package:first_app/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.email, required this.name, super.key});

  final String email;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: primaryColor.withAlpha(50),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            spacing: 5,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              VerticalDivider(),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(children: [Icon(Icons.wallet), Text("800.000 XOF")]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
