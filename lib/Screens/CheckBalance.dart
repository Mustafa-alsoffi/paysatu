import 'package:flutter/material.dart';

class CheckBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Balance', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(235, 3, 3, 210),
                Color.fromARGB(254, 54, 54, 246)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                // Define the bank images and names in a list
                final bankImages = [
                  'assets/images/CIMB-logo.png',
                  'assets/images/Maybank_logo.png',
                  'assets/images/Public_Bank_Berhad_logo.png',
                  'assets/images/RHB_Logo.png',
                  'assets/images/logo_hong_leong.png',
                ];
                final bankNames = [
                  'CIMB Bank',
                  'Maybank Bank',
                  'Public Bank',
                  'RHB Bank',
                  'Hong Leong Bank',
                ];
                // Define the bank account numbers in a list
                final bankAccountNumbers = [
                  '1234567890',
                  '2345678901',
                  '3456789012',
                  '4567890123',
                  '5678901234',
                ];

                return Padding(
                  padding: EdgeInsets.all(8),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to another page
                        // Replace 'BankDetailsPage' with the actual page you want to navigate to
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BankDetailsPage(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Image.asset(
                          bankImages[index],
                          width: 50,
                          height: 50,
                        ),
                        title: Text(
                          // Use the bank names from the list
                          bankNames[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: bankAccountNumbers[index],
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BankDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Details'),
      ),
      body: Center(
        child: Text('Bank Details Page'),
      ),
    );
  }
}
