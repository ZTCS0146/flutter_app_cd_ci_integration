import 'package:flutter/material.dart';
import 'package:flutter_application_game/widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assests/images/bg.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.teal.withOpacity(0.9), // Colored overlay
                  BlendMode.srcATop,
                ),
              ),
            ),
        child: SafeArea(
          child: Column(
            children: [
            buildCustomAppBar(),
              const SizedBox(height: 10),
              _buildUpIcons(),
              const SizedBox(height: 10),
              Image.asset('assests/images/snakeup.png', width: 80),
              
                  Image.asset('assests/images/snake.png', width: 80),
              const SizedBox(height: 10),
              _buildModeButtons(),
              const SizedBox(height: 10),
              _buildClaimSection(),
              const Spacer(),
              _buildBottomIcons(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.mail, color: Colors.white),
                onPressed: () {},
              ),
              Row(
                children: [
                  Image.asset('assets/images/coin.png', width: 24),
                  const SizedBox(width: 4),
                  const Text('1000', style: TextStyle(color: Colors.white)),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildModeButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              _modeButton('Play\nOnline', Icons.people_alt),
              const SizedBox(width: 10),
              _modeButton('Play With\nFriends', Icons.public),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _modeButton('Computer', Icons.tablet_mac),
              const SizedBox(width: 10),
              _modeButton('Pass & Play', Icons.casino),
            ],
          ),
        ],
      ),
    );
  }

  Widget _modeButton(String label, IconData icon) {
    return Expanded(
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.teal[800],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.orangeAccent, width: 4),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.orangeAccent,),
              const SizedBox(height: 6),
              Text(label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClaimSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.yellow, width: 2),
      ),
      child: const Text(
        "CLAIM\nPlay & League Get More Awards",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }

  Widget _buildBottomIcons() {
    return Padding(
      padding: EdgeInsetsDirectional.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assests/images/frame.png', width: 50),
          Image.asset('assests/images/group.png', width: 50),
        ],
      ),
    );
  }

    Widget _buildUpIcons() {
    return Padding(
      padding: EdgeInsetsDirectional.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assests/images/frame2.png', width: 50),
          Image.asset('assests/images/frame1.png', width: 50),
        ],
      ),
    );
  }
}
