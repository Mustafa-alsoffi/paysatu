import 'package:flutter/material.dart';
import 'package:paysatu/Screens/HomeScreen.dart';
import 'package:paysatu/Screens/SignUp.dart';
import 'package:paysatu/Screens/PINScreen.dart';

import 'PaymentScreen.dart';

class PaymentPopup extends StatelessWidget {
  final String name; // the name of the requester
  final double amount; // the amount of money requested

  PaymentPopup({required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 20, // change this to adjust the size of the avatar
            backgroundImage: AssetImage(
                'assets/images/avatar1.jpg'), // changed this to use gaafar’s image
          ),
          SizedBox(width: 8), // add some space between the avatar and the name
          Text('Requested by ',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 18)),
          SizedBox(width: 8),
          Text(name, style: TextStyle(fontFamily: 'Raleway', fontSize: 18)),
        ],
        crossAxisAlignment:
            CrossAxisAlignment.center, // align the widgets vertically
        mainAxisAlignment: MainAxisAlignment
            .start, // align the widgets horizontally to the start of the row
      ),
      content: Text(
        'RM$amount',
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // handle payment logic here
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(),
                  ),
                );
              },
              icon: Icon(Icons.check),
              label: Text(
                'Pay',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                // handle later logic here
              },
              child: Text(
                'Later',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.blue,
                ),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                // handle decline logic here
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Text(
                'Decline',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.red,
                ),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
