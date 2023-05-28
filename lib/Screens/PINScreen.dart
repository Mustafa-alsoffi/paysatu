import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class PINScreen extends StatefulWidget {
  const PINScreen({Key? key}) : super(key: key);

  @override
  _PINScreenState createState() => _PINScreenState();
}

class _PINScreenState extends State<PINScreen> {
  // The controller for the pin text field
  TextEditingController _pinController = TextEditingController();

  // The color for the dart blue
  Color _dartBlue = Color(0xFF0175C2);

  // Flag to track whether the payment was successful
  bool _paymentSuccessful = false;

  // Function to handle the verification process
  void _verifyPin() {
    // Perform your pin verification logic here

    // Assuming the payment was successful, update the flag
    setState(() {
      _paymentSuccessful = true;
    });

    // Show the pop-up screen
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Successful'),
          content: Text('Your payment has been successfully processed.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the pop-up screen
                Navigator.of(context).pop();
                // Navigate to the HomeScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('OK', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('PaySatu PIN'),
        backgroundColor: _dartBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your PaySatu PIN',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _dartBlue,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 250, // Increased the width of the container
              child: TextField(
                controller: _pinController,
                keyboardType: TextInputType.number,
                maxLength: 4,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  counterText: '',
                  hintText: '----',
                  hintStyle: TextStyle(
                    fontSize: 32, // Increased the font size of the hint
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[300],
                    decoration: TextDecoration.underline,
                  ),
                ),
                style: TextStyle(
                  fontSize: 32, // Increased the font size of the input
                  fontWeight: FontWeight.bold,
                  color: _dartBlue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyPin,
              child: Text('Verify'),
              style: ElevatedButton.styleFrom(
                primary: _dartBlue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
