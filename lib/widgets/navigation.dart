// ignore_for_file: unused_import, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:greencircuit/load_images/add_screen.dart';
import 'package:greencircuit/screen/explor_screen.dart';
import 'package:greencircuit/screen/explore.dart';
import 'package:greencircuit/screen/home.dart';
import 'package:greencircuit/profile/profile_screen.dart';
import 'package:greencircuit/screen/reelsScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants.dart';

class Navigations_Screen extends StatefulWidget {
  const Navigations_Screen({super.key});

  @override
  State<Navigations_Screen> createState() => _Navigations_ScreenState();
}

int _currentIndex = 0;

class _Navigations_ScreenState extends State<Navigations_Screen> {
  late PageController pageController;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // : implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // : implement dispose
    super.dispose();
    pageController.dispose();
  }

  onPageChanged(int page) {
    setState(() {
      _currentIndex = page;
    });
  }

  navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: icons,
        unselectedItemColor: icons2,
        currentIndex: _currentIndex,
        onTap: navigationTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          const HomeScreen(),
          const ExploreScreen(),
          const AddScreen(),
          const ReelScreen(),
          ProfileScreen(
            Uid: _auth.currentUser!.uid,
          ),
        ],
      ),
    );
  }
}
