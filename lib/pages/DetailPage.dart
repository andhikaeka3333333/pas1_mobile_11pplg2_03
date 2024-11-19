import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detailpage extends StatelessWidget {
  const Detailpage({super.key});

  @override
  Widget build(BuildContext context) {
    final post = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffe7a4),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 150),
              Center(
                  child: Image.network(
                    post.strBadge,
                    width: 150,
                  )),
              SizedBox(height: 20),
              // Name
              Text(
                post.strTeam,
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffffbc00),
                ),
              ),
              SizedBox(height: 8),
              // Email
              Text(
                post.strStadium,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Expanded(child: Container()),
              // Logout Button

              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
