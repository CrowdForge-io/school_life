import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:school_life/models/drawer_item.dart';
import 'package:school_life/routing/router.dart';
import 'package:school_life/routing/router.gr.dart';

int _selectedIndex = 0;

class CustomDrawer extends StatelessWidget {
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int newIndex) => _selectedIndex = newIndex;

  final List<DrawerItem> _drawerItems = <DrawerItem>[
    DrawerItem(
      title: 'Home',
      icon: OMIcons.home,
    ),
    DrawerItem(
      title: 'Assignments',
      icon: OMIcons.assignment,
    ),
    DrawerItem(
      title: 'Schedule',
      icon: OMIcons.schedule,
    ),
    DrawerItem(
      title: 'Subjects',
      icon: OMIcons.school,
    ),
    DrawerItem(
      title: 'Settings',
      icon: OMIcons.settings,
    ),
    DrawerItem(
      title: 'Help and Feedback',
      icon: OMIcons.help,
    ),
  ];

  void _onSelectItem(int index) {
    if (_selectedIndex == index) {
      Router.navigator.pop();
      return;
    }
    _selectedIndex = index;
    Router.navigator.pushReplacementNamed(routes[index]);
  }

  Color _getItemColor(BuildContext context, int currentIndex, Color itemColor) {
    if (_selectedIndex == currentIndex) {
      return const Color(0xff1967d2);
    }
    if (itemColor != null) {
      return itemColor;
    }
    return Theme.of(context).textTheme.body1.color;
  }

  @override
  Widget build(BuildContext context) {
    const Color containerColor = Color(0xffe8f0fe);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color iconColor = Theme.of(context).primaryIconTheme.color;

    final Widget drawerHeader = SafeArea(
      top: true,
      left: true,
      minimum: const EdgeInsets.all(16),
      child: Text(
        'School Life',
        style: textTheme.display3,
      ),
    );

    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            drawerHeader,
            ListView.builder(
              itemCount: _drawerItems.length,
              padding: const EdgeInsets.only(top: 10),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int i) {
                final DrawerItem d = _drawerItems[i];
                return Container(
                  color:
                      _selectedIndex == i ? containerColor : Colors.transparent,
                  child: ListTile(
                    dense: true,
                    leading: Icon(
                      d.icon,
                      color: _getItemColor(context, i, iconColor),
                    ),
                    onTap: () => _onSelectItem(i),
                    title: Text(
                      d.title,
                      style: textTheme.display1.copyWith(
                        color: _getItemColor(context, i, textTheme.body1.color),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
