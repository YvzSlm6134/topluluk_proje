import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:topluluk_proje/common/colors.dart';
import 'package:topluluk_proje/common/paths.dart';
import 'package:topluluk_proje/features/dashboard/views/dashboard.dart';
import 'package:topluluk_proje/features/profile/views/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> list = [
    const Dashboard(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(color: titlecolor),
        currentIndex: _currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              homeDeactiveSvg,
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              homeActiveSvg,
              width: 24,
              height: 24,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              userDeactiveSvg,
              width: 24,
              height: 24,
            ),
            activeIcon: SvgPicture.asset(
              userActiveSvg,
              width: 24,
              height: 24,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
