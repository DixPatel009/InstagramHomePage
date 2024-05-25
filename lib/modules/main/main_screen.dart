import 'package:flutter/material.dart';
import 'package:intagramhome/modules/addpost/add_post_screeen.dart';
import 'package:intagramhome/modules/home/home_screen.dart';
import 'package:intagramhome/modules/profile/profile_screen.dart';
import 'package:intagramhome/modules/reels/reels_screen.dart';
import 'package:intagramhome/modules/search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int bottomMenuPos = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomAppBar(context),
      body: _bindScreen,
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.black,
      iconSize: 24,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search_outlined,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_a_photo_outlined,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.video_collection_outlined,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.people_outline,
          ),
          label: '',
        ),
      ],
      currentIndex: bottomMenuPos,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      showModalBottomSheet<void>(
        context: context,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.0),
          ),
        ),
        builder: (BuildContext context) {
          return const AddPostScreeen();
        },
      );
    } else {
      setState(() {
        bottomMenuPos = index;
      });
    }
  }

  get _bindScreen {
    switch (bottomMenuPos) {
      case 0:
        return HomeScreen();
      case 1:
        return const SearchScreen();
      case 3:
        return const ReelsScreen();
      case 4:
        return const ProfileScreen();
      default:
        return HomeScreen();
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
