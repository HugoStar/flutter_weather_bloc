import 'package:flutter/material.dart';

class TabContainerContent {
  final Widget firstTab;
  final Widget secondTab;
  final Widget thirdTab;

  TabContainerContent(
      {@required this.firstTab,
      @required this.secondTab,
      @required this.thirdTab});
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
        icon: Icon(Icons.extension),
        label: 'First',
      ),
    );

    _tabWidgets.add(widget._content.secondTab);
    _bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.map),
        label: 'Second',
      ),
    );

    _tabWidgets.add(widget._content.thirdTab);
    _bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.accessibility),
        label: 'Third',
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
