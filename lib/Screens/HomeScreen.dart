import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:paysatu/Screens/send_to_screen.dart';

import '../Componets/bottom_nav_bar.dart';
import 'CheckBalance.dart';
import 'transfer_screen.dart';
import 'package:paysatu/utils/constants.dart';

import 'package:flutter/material.dart';
import 'package:paysatu/utils/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

class HomeScreen extends StatelessWidget {
  late final FirebaseMessaging _messaging;

  void requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Permission granted');
    } else {
      print('Permission denied');
    }
  }

  // void registerNotification() async {
  //   //...

  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     print('User granted permission');

  //     // For handling the received notifications
  //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //       // Parse the message received
  //       PushNotification notification = PushNotification(
  //         title: message.notification?.title,
  //         body: message.notification?.body,
  //       );

  //       setState(() {
  //         _notificationInfo = notification;
  //         _totalNotifications++;
  //       });
  //     });
  //   } else {
  //     print('User declined or has not accepted permission');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                gradient: AppColors.gradientColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile_photo.jpg'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'ABDALLA GAAFAR',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    'ID: 123456789',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: 'Raleway',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionItem(
                        icon: Icons.swap_horiz,
                        label: 'Transfer',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransferScreen(),
                            ),
                          );
                        },
                      ),
                      ActionItem(
                        icon: Icons.request_quote,
                        label: 'Request',
                        onPressed: () {},
                      ),
                      ActionItem(
                        icon: Icons.send,
                        label: 'Self',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SendToScreen(),
                            ),
                          );
                        },
                      ),
                      ActionItem(
                        icon: Icons.account_balance,
                        label: 'Balance',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckBalance(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }
}

class ActionItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ActionItem({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  _ActionItemState createState() => _ActionItemState();
}

class _ActionItemState extends State<ActionItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: _isPressed ? 100 : 80,
        height: _isPressed ? 100 : 80,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
          border: Border.all(
            // Add a border effect
            color: Colors.blue,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon),
            const SizedBox(height: 8),
            Text(widget.label)
          ],
        ),
      ),
    );
  }
}
