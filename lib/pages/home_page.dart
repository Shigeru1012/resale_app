import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:resale_app/pages/app_colors.dart';
import 'package:resale_app/pages/app_fonts.dart';
import 'package:resale_app/pages/messages.dart';
import 'package:resale_app/pages/add_contact.dart';
import 'package:http/http.dart' as http;
import 'package:resale_app/model/properties_model.dart';
import 'package:resale_app/pages/property_detail.dart';

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
        title: const Text('FOR SALE', style: AppFonts.h4),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search_outlined), color: AppColors.lightPurple,)
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
      body: const DashboardViewPage(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Messages()),
          );
        },
        backgroundColor: AppColors.lightPurple,
        child: const Icon(Icons.insert_comment_outlined),
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
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                icon: const Icon(Icons.refresh_sharp, color: AppColors.lightBlue,)),
            IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddContact()),
                  );
                },
                icon: const Icon(Icons.people_alt_rounded, color: AppColors.lightBlue,))
          ],
        ),
      ),
    );
  }
}

class DashboardViewPage extends StatefulWidget {
  const DashboardViewPage({Key? key}) : super(key: key);


  @override
  _DashboardViewPage createState() => _DashboardViewPage();
}


class _DashboardViewPage extends State<DashboardViewPage> {

  Future<List<Data>> getData() async {
    var headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuaW5ndXllbiIsImV4cCI6MTY3NTIzMDUxNSwiaWF0IjoxNjc1MjIxNTE1fQ.NG8fy9O2z7AoaaRumcLT75PZj82dWR-N-oYGElkca8RdgyFT7hkZbnXZGxSa7Nj6B_Rhj8IUzaHBpVlTray-5A'};
    var response = await http.get(Uri.parse('https://agency-app-final.herokuapp.com/properties'), headers: headers);
    var jsonData = jsonDecode(response.body.toString());
    var jsonList = jsonData['data'];
    List<Data> properties = [];

    if (response.statusCode == 200) {
      for ( var jsonDataList in jsonList) {
        Data datalist = Data.fromJson(jsonDataList);
        properties.add(datalist);
      }
      return properties;
    } else {
      return properties;
    }
  }

  @override
  Widget build(BuildContext context){
    return Container(
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
                      List<Data> properties = snapshot.data!;
                      return ListView.builder(
                          padding: const EdgeInsets.all(5),
                          itemCount: properties.length,
                          itemBuilder: (context, index) {
                            int reverseIndex = properties.length - 1 - index;
                            Data property = properties[reverseIndex];
                            return Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              elevation: 5,
                              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(property.priceSale.toString(), style: AppFonts.h11,),
                                        SizedBox(width: 5,),
                                        Text(property.currency.toString(), style: AppFonts.h15,),
                                      ],
                                    ),
                                    Text(property.status.toString(), style: AppFonts.h10,),
                                    SizedBox(width: 5,),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_outlined, color: Colors.black,))
                                  ],
                                ),
                                subtitle: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 200,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text('Commission: ', style: AppFonts.h2,),
                                                  Flexible(child: Text(property.commission.toString(), overflow: TextOverflow.ellipsis, style: AppFonts.h2,)),
                                                  Text('%', style: AppFonts.h2,)
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(10),
                                                    child: CachedNetworkImage(
                                                      imageUrl: property.picProperties!.elementAt(0).toString(),
                                                      width: 145,
                                                      height: 90,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(Icons.grid_on, color:  Colors.black,),
                                                  SizedBox(width: 7,),
                                                  Text(property.dimension.toString(),style: AppFonts.h2,)
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Icon(Icons.bedroom_parent_outlined, color: Colors.black,),
                                                      SizedBox(width: 7,),
                                                      Text(property.beds.toString(), style: AppFonts.h2,)
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Icon(Icons.bathroom_outlined, color: Colors.black,),
                                                      SizedBox(width: 7,),
                                                      Text(property.baths.toString(), style: AppFonts.h2,)
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 170,
                                          height: 200,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(Icons.person_outline, color: Colors.black,),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(width: 7,),
                                                  Container(
                                                    width: 120,
                                                    height: 40,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(property.userName.toString(), style: AppFonts.h2, maxLines: 2, overflow: TextOverflow.ellipsis,)
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(width: 4,),
                                                  Text('ID   ', style: AppFonts.h2,),
                                                  Text(property.id.toString(), style: AppFonts.h2,)
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(Icons.apartment_outlined, color: Colors.black,)
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(width: 7,),
                                                  Container(
                                                    width: 130,
                                                    height: 40,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(property.typeName.toString(), style: AppFonts.h2, maxLines: 2, overflow: TextOverflow.ellipsis,)
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(Icons.location_on_outlined, color: Colors.black,)
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(width: 7,),
                                                  Container(
                                                    width: 120,
                                                    height: 40,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(property.address1.toString(), style: AppFonts.h2, maxLines: 2, overflow: TextOverflow.ellipsis,)
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => PropertyDetail(property: property,))
                                  );
                                },
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
    );
  }
}
