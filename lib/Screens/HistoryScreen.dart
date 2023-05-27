import 'package:flutter/material.dart';

import '../Componets/bottom_nav_bar.dart';

class Transaction {
  final String name;
  final String number;
  final String upiId;
  final String amount;
  final String type;
  final DateTime date;
  final IconData iconData;

  Transaction({
    required this.name,
    required this.number,
    required this.upiId,
    required this.amount,
    required this.type,
    required this.date,
    required this.iconData,
  });
}

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Transaction> transactionList = [
    Transaction(
      name: 'gaafar',
      number: '1234567890',
      upiId: 'alice@bank',
      amount: '-RM2000.00',
      type: 'Paid',
      date: DateTime.now().subtract(Duration(hours: 2)),
      iconData: Icons.account_circle,
    ),
    Transaction(
      name: 'furqan',
      number: '0987654321',
      upiId: 'bob@bank',
      amount: '-RM1000.00',
      type: 'Paid',
      date: DateTime.now().subtract(Duration(days: 1)),
      iconData: Icons.account_circle,
    ),
    Transaction(
      name: 'ahmed',
      number: '1122334455',
      upiId: 'charlie@bank',
      amount: '+'
          'RM5000.00', // Can you create a random bank account number for everyone
      type: 'Received',
      date: DateTime(2023, 5, 20),
      iconData: Icons.account_circle,
    ),
    Transaction(
      name: 'Aiman',
      number: '1234567890',
      upiId: 'alice@bank',
      amount: '+RM2000.00',
      type: 'Received',
      date: DateTime.now().subtract(Duration(hours: 2)),
      iconData: Icons.account_circle,
    ),
    Transaction(
      name: 'Mustafa',
      number: '1234567890',
      upiId: 'alice@bank',
      amount: '+RM2000.00',
      type: 'Received',
      date: DateTime.now().subtract(Duration(hours: 2)),
      iconData: Icons.account_circle,
    ),
    Transaction(
      name: 'Nor',
      number: '1234567890',
      upiId: 'alice@bank',
      amount: '-RM2000.00',
      type: 'Paid',
      date: DateTime.now().subtract(Duration(hours: 2)),
      iconData: Icons.account_circle,
    ),
    Transaction(
      name: 'loai',
      number: '1234567890',
      upiId: 'alice@bank',
      amount: '+RM2000.00',
      type: 'Received',
      date: DateTime.now().subtract(Duration(hours: 2)),
      iconData: Icons.account_circle,
    ),
    Transaction(
      name: 'abdallah',
      number: '1234567890',
      upiId: 'alice@bank',
      amount: '+RM2000.00',
      type: 'Received',
      date: DateTime.now().subtract(Duration(hours: 2)),
      iconData: Icons.account_circle,
    ),
    Transaction(
      name: 'Alice',
      number: '1234567890',
      upiId: 'alice@bank',
      amount: '-RM2000.00',
      type: 'Paid',
      date: DateTime.now().subtract(Duration(hours: 2)),
      iconData: Icons.account_circle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('History'),
              ],
            ),
            Spacer(),
            SizedBox(width: 8),
            Icon(Icons.help),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false, // this is what you need
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by name, number, or UPI ID.',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(20), // added border radius
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactionList.length,
              itemBuilder: (context, index) {
                final transaction = transactionList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Dismissible(
                    // added swipe gesture
                    key: Key(transaction.name + transaction.number),
                    background: Container(color: Colors.red),
                    onDismissed: (direction) {
                      setState(() {
                        transactionList.removeAt(index);
                      });
                    },
                    child: Card(
                      // original card widget
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Icon(
                          transaction.iconData,
                          size: 36,
                          color: transaction.type == 'Paid'
                              ? Colors.red
                              : Colors.green,
                        ),
                        title:
                            Text('${transaction.name} (${transaction.number})'),
                        subtitle: Text(
                            '${transaction.type} via ${transaction.upiId}'),
                        trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                transaction.amount,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(_formatDate(transaction.date)),
                            ]),
                        onTap: () {
                          // callback when tapped
                          // TODO: implement edit logic
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 1),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
