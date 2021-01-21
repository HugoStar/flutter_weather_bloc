import 'package:flutter/material.dart';

class TabContainerContent {
  final Widget firstTab;
  final Widget secondTab;

  TabContainerContent({@required this.firstTab, @required this.secondTab});
}

class TabContainerScreen extends StatefulWidget {
  final TabContainerContent _content;

  TabContainerScreen({@required TabContainerContent content})
      : _content = content;

  @override
  _TabContainerScreenState createState() => _TabContainerScreenState();
}

class _TabContainerScreenState extends State<TabContainerScreen> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> _bottomBarItems = [];
  List<Widget> _tabWidgets = [];

  @override
  void initState() {
    super.initState();

    _tabWidgets.add(widget._content.firstTab);
    _bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.map),
        label: 'Location',
      ),
    );

    _tabWidgets.add(widget._content.secondTab);
    _bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.location_city),
        label: 'City',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabWidgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomBarItems,
        currentIndex: _selectedIndex,
        onTap: (int value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
