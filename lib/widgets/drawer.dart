import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.amberAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    decoration:
                        BoxDecoration(color: Color.fromARGB(255, 252, 255, 85)),
                    margin: EdgeInsets.zero,
                    accountName: Text(
                      "Naresh",
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/nary.jpg",
                      ),
                    ),
                    accountEmail: Text("nary2vip@gmail.com"))),
            ListTile(
              leading: Icon(CupertinoIcons.home),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.settings_solid),
              title: Text(
                "Logout",
                textScaleFactor: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
