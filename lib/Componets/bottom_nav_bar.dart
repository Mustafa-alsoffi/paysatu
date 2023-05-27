import 'package:flutter/material.dart';
import '../Screens/History_Screen.dart';
import '../Screens/ProfileScreen().dart';
import '../Screens/home_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  const CustomBottomNavBar({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    PageRouteBuilder _pageRouteBuilder(Widget page) {
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, a1, a2, child) {
          return FadeTransition(
            opacity: a1,
            child: child,
          );
        },
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Hero(
                  tag: 'home',
                  child: Icon(Icons.home,
                      color:
                          _currentIndex == 0 ? Colors.blue : inActiveIconColor),
                ),
                onPressed: () {
                  Navigator.of(context).push(_pageRouteBuilder(HomeScreen()));
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Hero(
                  tag: 'history',
                  child: Icon(Icons.history_rounded,
                      color:
                          _currentIndex == 1 ? Colors.blue : inActiveIconColor),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(_pageRouteBuilder(HistoryScreen()));
                  setState(() {
                    _currentIndex = 1;
                  });
                },
              ),
              IconButton(
                icon: Hero(
                  tag: 'profile',
                  child: Icon(Icons.perm_identity_rounded,
                      color:
                          _currentIndex == 2 ? Colors.blue : inActiveIconColor),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(_pageRouteBuilder(ProfileScreen()));
                  setState(() {
                    _currentIndex = 2;
                  });
                },
              ),
            ],
          )),
    );
  }
}
