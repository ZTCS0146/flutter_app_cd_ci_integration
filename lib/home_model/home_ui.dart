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
              
              Image.asset('assests/images/snakeup.png', width: 90),
              
                  Image.asset('assests/images/snake.png', width: 90),
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
      child: 
    Container(
      
      height: 110,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 232, 75, 1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 4),
          ),
        ],
        border: Border(
      top: BorderSide(color: Color.fromRGBO(255, 232, 75, 1), width: 2),
      left: BorderSide(color:Color.fromRGBO(255, 232, 75, 1) ,width: 2),
      right: BorderSide(color:Color.fromRGBO(255, 232, 75, 1), width: 2),
      bottom: BorderSide.none, // no border at bottom
    ),
      ),
      child: Column(
        children: [
          // Top part with icon and gradient background
          Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              gradient: LinearGradient(
                colors: [Color(0xFF004C4C), Color(0xFF006666)], // greenish blue
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Icon(
              icon,
                size: 40,
                color: Color.fromRGBO(255, 232, 75, 1)
              ),
            ),
          ),
          // Bottom part with text
          Expanded(
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: label,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                   
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ));
      // Container(
      //   height: 90,
      //   decoration: BoxDecoration(
      //     color: Colors.teal[800],
      //     borderRadius: BorderRadius.circular(15),
      //     border: Border.all(color: Colors.orangeAccent, width: 4),
      //   ),
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Icon(icon, color: Colors.orangeAccent,),
      //         const SizedBox(height: 6),
      //         Text(label,
      //             textAlign: TextAlign.center,
      //             style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      //       ],
      //     ),
      //   ),
      // ),
    
  }

  Widget _buildClaimSection() {
    return Container(
      width: 240,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFFFA500)], // yellow to orange
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 4),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        children: [
          // Icon or image on the left
        Container(
  width:55,
  height: 80,
  child: Stack(
    alignment: Alignment.centerLeft,
    children: [
      // Shield background
      Image.asset(
        'assests/images/Vector1.png',
        fit: BoxFit.contain,
      ),
      
      // Trophy icon on top
      Image.asset(
        'assests/images/trophy.png', // Replace with your actual trophy asset
        width: 40,
        height: 30,
        fit: BoxFit.contain,
      ),
    ],
  ),
),

     
          // Texts
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "CLAIM",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Play A League Get More Awards",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
            ],
          )
        ],
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
          Image.asset('assests/images/export.png', width: 50),
        ],
      ),
    );
  }

    Widget _buildUpIcons() {
    return Padding(
      padding: EdgeInsets.only(left:16,right:16),
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
