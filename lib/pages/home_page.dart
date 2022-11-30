import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/pages/explore.dart';
import 'package:news_app/pages/favorites.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  PageController _pageController = PageController();

  List<Widget> iconList = [
     const Icon(Icons.home),
     const Icon(Icons.favorite)
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

    });
    _pageController.animateToPage(index,
        curve: Curves.easeIn,
        duration:  const Duration(milliseconds: 250));

  }

  Future _onWillPop () async{
    if(_currentIndex != 0){
      setState (()=> _currentIndex = 0);
      _pageController.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    }else{
      await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', true);
    }
  }


  @override
  Widget build(BuildContext context) {


    return  WillPopScope(
      onWillPop: () async => await _onWillPop(),
      child: Scaffold(
        bottomNavigationBar: _bottomNavigationBar(),
        body: PageView(
          controller: _pageController,
          allowImplicitScrolling: false,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Explore(),
            Favorites()
          ],
        ),
      ),
    );
  }


  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) => onTabTapped(index),
      currentIndex: _currentIndex,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      iconSize: 25,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: iconList[0],
            label: 'Home'

        ),
        BottomNavigationBarItem(
            icon: iconList[1],
            label: 'Favorites'

        ),

      ],
    );
  }
}
