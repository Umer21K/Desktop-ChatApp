
import 'package:desktop_flutter_app/pages/settingspage.dart';
import 'package:desktop_flutter_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout () {
    // get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            //logo
            DrawerHeader(
              child: Center(
                child: Icon(
                  Icons.message,
                  color: Theme.of(context).colorScheme.primary,
                  size: 40,
                ),
              ),
            ),

            //home list title
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: Text("H O M E"),
                leading: Icon(Icons.home),
                onTap: () {
                  // pop the drawer
                  Navigator.pop(context);
                },
              ),
            ),

            //setting list tile
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: const Text("S E T T I N G S"),
                leading: const Icon(Icons.settings),
                onTap: () {
                  // pop the drawer
                  Navigator.pop(context);
                  // navigate to setting page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                  ),
                  );
                },
              ),
            ),
          ],
          ),

          //logout list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
