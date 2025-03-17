import 'package:flutter/material.dart';
import 'tabs/home_tab.dart';
import 'tabs/library_tab.dart';
import 'tabs/profile_tab.dart';
import 'theme_provider.dart';

class HomeScreen extends StatefulWidget {
  final ThemeProvider themeProvider;

  const HomeScreen({super.key, required this.themeProvider});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:
              widget.themeProvider.isDarkMode
                  ? [Colors.black, Colors.blue.shade900]
                  : [Colors.white, Colors.blue.shade100],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _buildSelectedTab(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color:
                    widget.themeProvider.isDarkMode
                        ? const Color(0xFF333333)
                        : Colors.grey.shade300,
                width: 1,
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor:
                widget.themeProvider.isDarkMode ? Colors.black : Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.gamepad),
                label: 'Games',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedTab() {
    switch (_selectedIndex) {
      case 0:
        return HomeTab(themeProvider: widget.themeProvider);
      case 1:
        return LibraryTab(themeProvider: widget.themeProvider);
      case 2:
        return ProfileTab(themeProvider: widget.themeProvider);
      default:
        return HomeTab(themeProvider: widget.themeProvider);
    }
  }
}
