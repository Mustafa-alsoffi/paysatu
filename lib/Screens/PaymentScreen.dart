import 'package:flutter/material.dart';
import 'package:paysatu/Screens/PINScreen.dart';

import 'PopUpScreen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // Add a variable to keep track of the selected index
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Process'),
        // Add an icon to go back to HomeScreen
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to HomeScreen
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Section one
          Container(
            // Remove the color property
            // color: Colors.white,
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Delete the name textfield
                  // Text(
                  //   'Name of the person',
                  //   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  // ),
                  // SizedBox(height: 8.0),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(),
                  //     hintText: 'Enter the name',
                  //   ),
                  // ),
                  // SizedBox(height: 16.0),
                  Text(
                    'Amount of memoey',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          // Use borderRadius to make the textfield rounded
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Enter the amount',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          // Section two
          Expanded(
            child: Container(
              // Remove the color property
              // color:
              //   Colors.blue[50],

              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total amount of memoey',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8.0),
                        Text('\$100.00',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.green)),

                        // Add a divider to separate the total amount of memoey and the choose bank account
                        Divider(color: Colors.grey),

                        SizedBox(height: 16.0),
                        Text('Choose a bank account',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8.0),
                        // Four different options of bank accounts
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Icon(Icons.account_balance,
                                    color: Colors.blue),
                                title: Text('Bank account ${index + 1}'),
                                subtitle:
                                    Text('Balance \$${(index + 1) * 100}.00'),
                                trailing:

                                    // Use a ternary operator to show an empty circle or box if the index is not selected
                                    selectedIndex == index
                                        ? Icon(Icons.check_circle,
                                            color: Colors.green)
                                        : Icon(Icons.radio_button_off_outlined),
                                onTap:

                                    // Update the selected index when tapping on a bank account
                                    () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                              );
                            }),
                      ])),
            ),
          ),
          // Section three
          Container(
            width: double.infinity,
            height: 60.0,
            child: ElevatedButton(
              onPressed: () {
                // Perform payment logic here
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PINScreen(),
                  ),
                );
              },
              child: Text('PAY', style: TextStyle(fontSize: 24.0)),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)))),
            ),
          ),
        ],
      ),
    );
  }
}
