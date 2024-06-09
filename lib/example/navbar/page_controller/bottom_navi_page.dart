import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNaviPage extends ConsumerStatefulWidget {
  const BottomNaviPage({super.key});

  @override
  ConsumerState<BottomNaviPage> createState() => _BottomNaviPageState();
}

class _BottomNaviPageState extends ConsumerState<BottomNaviPage> {
  late PageController _pageController;
  int _selectedIndex = 0;

  final _bottomNavigationItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: '検索'),
    const BottomNavigationBarItem(icon: Icon(Icons.history), label: '閲覧履歴'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // _pageController.jumpToPage(index);
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      Container(
        alignment: Alignment.center,
        color: Colors.green[100],
        child: const Text('ホーム'),
      ),
      Container(
        alignment: Alignment.center,
        color: Colors.blue[100],
        child: const Text('検索'),
      ),
      Container(
        alignment: Alignment.center,
        color: Colors.pink[100],
        child: const Text('閲覧履歴'),
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('空'),
        ),
        body: PageView(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _bottomNavigationItems,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.lightBlue,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.white54,
        ));
  }
}
