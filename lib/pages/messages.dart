import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:resale_app/pages/home_page.dart';
import 'app_fonts.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.white,
    leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations
                .of(context)
                .openAppDrawerTooltip,
          );
        }
    ),
    title: const Text('View Messages', style: AppFonts.h4),
    actions: [
      TextButton(onPressed: (){}, child: const Text('Preferences', style: AppFonts.h1,))
    ],
  ),
  drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 200,
          child: DrawerHeader(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 0.5,
                ),
              ),
            ),
            child: Column(
              children: <Widget>[
                const Text('Demo Agency', style: AppFonts.h5,),
                const Text('Live System', style: AppFonts.h6,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Column(
                        children: const [
                          CircleAvatar(
                            radius: 30,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Katie Hoang",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black)),
                          SizedBox(
                            height: 5,
                          ),
                          Text("uxdesigner@demo.vn",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black)),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.pages),
          title: const Text(' Home '),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        ExpansionTile(
          title: const Text("Properties"),
          leading: const Icon(Icons.home),
          childrenPadding: const EdgeInsets.only(left: 60),
          children: [
            ListTile(
              title: const Text("Last Result"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Search"),
              onTap: () {},
            ),
          ],
        ),
        ListTile(
          leading: const Icon(Icons.people_alt_outlined),
          title: const Text(' Contacts '),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.business_center_outlined),
          title: const Text(' Tasks '),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ExpansionTile(
          title: const Text("AMS"),
          leading: const Icon(Icons.message_outlined),
          childrenPadding: const EdgeInsets.only(left: 60),
          children: [
            ListTile(
              title: const Text("View Messages"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Messages()),
                );
              },
            ),
            ListTile(
              title: const Text("Last AMS Messages"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Send Messages"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Preferences"),
              onTap: () {},
            ),
          ],
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('LogOut'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  ),
  body: Scaffold(
    body: FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      openAxisAlignment: 0.0,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
      },
      transition: CircularFloatingSearchBarTransition(),
      builder: (context,transition) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(8),
        child: Material(
        color: Colors.white,
        elevation: 4.0,
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: Colors.accents.map((color) {
        return Container(height: 50, color: Colors.white);
        }).toList(),
          ),
         ),
        );
      }
    ),
  ),
);

  }


}