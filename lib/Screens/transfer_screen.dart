import 'package:flutter/material.dart';
import 'package:paysatu/utils/constants.dart';

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
    var tabBar = TabBar(
      unselectedLabelColor: Colors.black54,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      controller: _tabController,
      tabs: const [
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text("Phone Number", style: TextStyle(color: Colors.black)),
          ),
        ),
        Tab(child: Text('PaySatu ID', style: TextStyle(color: Colors.black))),
        Tab(child: Text('Bank account', style: TextStyle(color: Colors.black))),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text("Send Money", style: TextStyle(color: Colors.black)),
        bottom: PreferredSize(
          preferredSize: tabBar.preferredSize,
          child: Material(
            shadowColor: Colors.black,
            color: AppColors.colorMap[300],
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: tabBar,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(50.0),
              elevation: 20.0,
              borderOnForeground: false,
              shadowColor: Colors.black,
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  fillColor: Colors.grey[300],
                  filled: true,
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Contacts for Bank Account tab
                ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.person), // Add the Icon widget here
                      title: Text('Jack'),
                      subtitle: Text('1234567890'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person), // Add the Icon widget here
                      title: Text('Max'),
                      subtitle: Text('1234567890'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person), // Add the Icon widget here
                      title: Text('Khai'),
                      subtitle: Text('1234567890'),
                    ),
                  ],
                ),
                // Contacts for UPI ID tab
                ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.person), // Add the Icon widget here
                      title: Text('Jack@paysatu.com'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person), // Add the Icon widget here
                      title: Text('Max@paysatu.com'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person), // Add the Icon widget here
                      title: Text('Khai@paysatu.com'),
                    ),
                  ],
                ),
                // Contacts for Phone Number tab
                ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.person), // Add the Icon widget here
                      title: Text('Jack'),
                      subtitle: Text('1234567890'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person), // Add the Icon widget here
                      title: Text('Max'),
                      subtitle: Text('1234567890'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person), // Add the Icon widget here
                      title: Text('Khai'),
                      subtitle: Text('1234567890'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(Icons.add),
          decoration: BoxDecoration(
              shape: BoxShape.circle, gradient: AppColors.gradientColor),
        ),
        onPressed: () {},
      ),
    );
  }
}
