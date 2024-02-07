

import 'package:flutter/material.dart';
import 'package:movie/contoller/bottombar_provider.dart';
import 'package:movie/view/home_screen.dart';
import 'package:movie/view/movie_screen.dart';
import 'package:movie/view/search_screen.dart';
import 'package:movie/view/tv_show_screen.dart';

import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    MovieScreen(),
    TvShowScreen()
  ];

   BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomBarProvider>(context);
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 0, 0, 0),
      body: _pages[bottomProvider.currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: NavigationBar(
              backgroundColor:const Color.fromARGB(255, 0, 0, 0),
              selectedIndex: bottomProvider.currentIndex,
              onDestinationSelected: (index) {
                bottomProvider.navigatePage(index);
              },
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.home,
                      color: bottomProvider.currentIndex == 0
                          ? Colors.white
                          :const Color.fromARGB(255, 106, 105, 105)),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.search,
                      size: 30,
                      color: bottomProvider.currentIndex == 1
                          ? Colors.white
                          :const Color.fromARGB(255, 106, 105, 105)),
                  label: 'Search',
                ),
                NavigationDestination(
                  icon: Icon(Icons.videocam_outlined,
                      size: 30,
                      color: bottomProvider.currentIndex == 2
                          ? Colors.white
                          : const Color.fromARGB(255, 106, 105, 105)),
                  label: 'Movies',
                ),
                NavigationDestination(
                  icon: Icon(Icons.tv,
                      color: bottomProvider.currentIndex == 3
                          ? Colors.white
                          : const Color.fromARGB(255, 106, 105, 105)),
                  label: 'TV',
                ),
              ],
              indicatorColor:const Color.fromARGB(255, 33, 143, 149),
              surfaceTintColor:const Color.fromARGB(255, 4, 2, 17),
            ),
          ),
        ),
      ),
    );
  }
}
