import 'package:flutter/material.dart';
import 'package:resale_app/pages/app_fonts.dart';
import 'package:resale_app/pages/dropdown_box.dart';
import 'package:resale_app/pages/messages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        title: const Text('For Sale', style: AppFonts.h4),
        actions: [
          TextButton(onPressed: (){}, child: const Text('Summary', style: AppFonts.h1,)),
          TextButton(onPressed: (){}, child: const Text('Select', style: AppFonts.h1,))
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
                  Navigator.pop(context);
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
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[
                      const Text('3 properties found', style: AppFonts.h6,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        height: 40,
                        child: GestureDetector(
                          onTap: (){
                            const DropdownBox();// perform click here
                          },
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Image(
                                  image: AssetImage('assets/icons/image_icon.png'),
                                ),
                                Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Colors.black,
                                ),
                              ]
                          ),
                        ),
                      ),
                    ],
                  ),
              ))
             ],
            ),
           ),
          );
  }
}

