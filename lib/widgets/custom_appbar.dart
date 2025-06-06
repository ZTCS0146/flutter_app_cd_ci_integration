import 'package:flutter/material.dart';

Widget buildCustomAppBar() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: const BoxDecoration(
      color: Color(0xFF006666), // Custom appbar background
      border: Border(
        bottom: BorderSide(color: Colors.yellowAccent, width: 1.5), // bottom line
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Profile image with green dot
        Stack(
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assests/images/profile.png'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
              ),
            ),
          ],
        ),

        // Message Icon
        IconButton(
          onPressed: () {},
          icon: Image.asset('assests/images/message.png', width: 24),
        ),

        // Coin + Add Icon
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.teal[700],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.yellow, width: 1),
          ),
          child: Row(
            children: [
              Image.asset('assests/images/seeting.png', width: 60),
              const SizedBox(width: 4),
              
             
           
            ],
          ),
        ),

        // Settings icon
        IconButton(
          onPressed: () {},
          icon:  Image.asset('assests/images/coin.png', width: 20),
        ),
      ],
    ),
  );
}
