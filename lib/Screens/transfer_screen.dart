import 'package:flutter/material.dart';

class TransferScreen extends StatefulWidget {
  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                  child: Text('Phone Number',
                      style: TextStyle(color: Colors.black))),
              Tab(
                  child: Text('PaySatu ID',
                      style: TextStyle(color: Colors.black))),
              Tab(
                  child: Text('Bank account',
                      style: TextStyle(color: Colors.black))),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Contacts for Bank Account tab
                ListView(
                  children: const [
                    ListTile(title: Text('Contact 1')),
                    ListTile(title: Text('Contact 2')),
                    ListTile(title: Text('Contact 3')),
                  ],
                ),
                // Contacts for UPI ID tab
                ListView(
                  children: const [
                    ListTile(title: Text('Contact 4')),
                    ListTile(title: Text('Contact 5')),
                    ListTile(title: Text('Contact 6')),
                  ],
                ),
                // Contacts for Phone Number tab
                ListView(
                  children: const [
                    ListTile(title: Text('Contact 7')),
                    ListTile(title: Text('Contact 8')),
                    ListTile(title: Text('Contact 9')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Perform action when the floating button is pressed
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
