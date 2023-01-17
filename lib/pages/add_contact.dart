import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:resale_app/pages/home_page.dart';
import 'app_colors.dart';
import 'app_fonts.dart';
import 'package:resale_app/pages/messages.dart';
import 'package:resale_app/model/user_model.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {

  Future<List<Data>> getData() async {
    var headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuaW5ndXllbiIsImV4cCI6MTY3MzY3MTMyNCwiaWF0IjoxNjczNjYyMzI0fQ.MjX5nH4lQvpp_uh4D-6a76CaUzsXB4X8rAD6jLADPIVJn0Fh5lGMIVp4c7at9hnBw4UEcTHEzR4663XXryBN1A'};
    var response = await http.get(Uri.parse('https://agency-app-final.herokuapp.com/users'), headers: headers);
    var jsonData = jsonDecode(response.body.toString());
    var jsonList = jsonData['data'];
    List<Data> users = [];

    if (response.statusCode == 200) {
      for ( var jsonDataList in jsonList) {
        Data datalist = Data.fromJson(jsonDataList);
        users.add(datalist);
      }
      return users;
    } else {
      return users;
    }
  }

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
        title: const Text('Contact', style: AppFonts.h4),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search_outlined), color: AppColors.lightPurple, )
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
              leading: const Icon(Icons.business_center_outlined, color: AppColors.lightPurple),
              title: const Text(' Tasks '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ExpansionTile(
              title: const Text("Properties"),
              leading: const Icon(Icons.home, color: AppColors.lightPurple),
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
              leading: const Icon(Icons.settings, color: AppColors.lightPurple),
              title: const Text(' Settings '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: AppColors.lightPurple),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFf85187), Color(0xFF3ac3cb)]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                child: FutureBuilder<List<Data>>(
                    future: getData(),
                    builder: (context, AsyncSnapshot<List<Data>> snapshot){
                      if (snapshot.data == null) {
                        return const Center( child: CircularProgressIndicator(),);
                      } else {
                        List<Data> users = snapshot.data!;
                        return ListView.builder(
                            padding: const EdgeInsets.all(5),
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              int reverseIndex = users.length - 1 - index;
                              Data user = users[reverseIndex];
                              return Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                elevation: 5,
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                child: ListTile(
                                  subtitle: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 60,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(300),
                                              child: CachedNetworkImage(
                                                imageUrl: user.picUser.toString(),
                                                height: 45,
                                                width: 45,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(user.lastName.toString(), style: AppFonts.h9,),
                                              Text(' '),
                                              Text(user.firstName.toString(), style: AppFonts.h9,)
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text('Agency: ', style: AppFonts.h1,),
                                              SizedBox(height: 5,),
                                              Text(user.agencyName.toString(),
                                                  maxLines: 2,style: AppFonts.h2)
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text('Job: ', style: AppFonts.h1,),
                                              Text(user.jobTitle.toString(), style: AppFonts.h2,)
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text('Email: ', style: AppFonts.h1,),
                                              Text(user.email.toString(), style: AppFonts.h2,)
                                            ],
                                          ),
                                          SizedBox(height: 7,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text('since ', style: AppFonts.h1,),
                                              Text(user.created.toString(), style: AppFonts.h12,)
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  dense: true,
                                  onTap: (){},
                                ),
                              );
                            }
                        );
                      }

                    }
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        backgroundColor: AppColors.lightPurple,
        child: const Icon(Icons.home),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddContact()),
                  );
                },
                icon: const Icon(Icons.refresh_sharp, color: AppColors.lightBlue,)),
            IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Messages()),
                  );
                },
                icon: const Icon(Icons.comment_outlined, color: AppColors.lightBlue,))
          ],
        ),
      ),
    );
  }
}

