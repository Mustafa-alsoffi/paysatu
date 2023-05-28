import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:paysatu/Screens/PaymentScreen.dart';
import 'package:paysatu/Screens/PopUpScreen.dart';
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
                    'Jeremy Yon',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    'ID: jeremy\@paysatu',
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 420,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        TransactionItem(
                          avatar: AssetImage('assets/images/avatar1.jpg'),
                          name: 'Alice Smith',
                          amount: '\$100.00',
                          status: 'Sent',
                        ),
                        TransactionItem(
                          avatar: AssetImage('assets/images/avatar1.jpg'),
                          name: 'Bob Jones',
                          amount: '\$50.00',
                          status: 'Received',
                        ),
                        TransactionItem(
                          avatar: AssetImage('assets/images/avatar1.jpg'),
                          name: 'Charlie Brown',
                          amount: '\$25.00',
                          status: 'Pending',
                        ),
                        TransactionItem(
                          avatar: AssetImage('assets/images/avatar1.jpg'),
                          name: 'David Lee',
                          amount: '\$75.00',
                          status: 'Failed',
                        ),
                      ],
                    ),
                  ),
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
            Text(widget.label),
          ],
        ),
      ),
    );
  }
}

class AccountItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String balance;

  const AccountItem({
    required this.icon,
    required this.label,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, color: Colors.blue),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Text(
            balance,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final ImageProvider avatar;
  final String name;
  final String amount;
  final String status;

  const TransactionItem({
    required this.avatar,
    required this.name,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    // Define a map of colors for each status
    final statusColors = {
      'Sent': Colors.red[600],
      'Received': Colors.green[600],
      'Pending': Colors.black,
      'Failed': Colors.black,
    };

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      width: 365,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 8),
          CircleAvatar(radius: 30, backgroundImage: avatar),
          SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(status, style: TextStyle(color: Colors.grey)),
            ],
          ),
          Spacer(),
          // Use the statusColors map to get the color for the amount
          Text(
            amount,
            style: TextStyle(fontSize: 18, color: statusColors[status]),
          ),
          SizedBox(width: 16),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(),
                ),
              );
            },
            child: Text(''),
          )
        ],
      ),
    );
  }
}
