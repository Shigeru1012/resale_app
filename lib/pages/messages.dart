import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:resale_app/pages/app_colors.dart';
import 'package:resale_app/pages/app_fonts.dart';
import 'package:resale_app/pages/send_messages.dart';
import 'package:resale_app/model/message_model.dart';
import 'home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
        title: const Text('Message', style: AppFonts.h4),
        actions: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.add), color: AppColors.lightPurple, )
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
      body: const MessageViewPage(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        backgroundColor: AppColors.lightPurple,
        child: const Icon(Icons.home,),
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
                    MaterialPageRoute(builder: (context) => const Messages()),
                  );
                },
                icon: const Icon(Icons.refresh_sharp, color: AppColors.lightBlue,)),
            IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SendMessages()),
                  );
                },
                icon: const Icon(Icons.people_alt_rounded, color: AppColors.lightBlue,))
          ],
        ),
      ),
    );
  }
}


class MessageViewPage extends StatefulWidget {
  const MessageViewPage({Key? key}) : super(key: key);

  @override
  _MessageViewPageState createState() => _MessageViewPageState();
}


class _MessageViewPageState extends State<MessageViewPage> {


  Future<List<Data>> getData() async {
    var headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuaW5ndXllbiIsImV4cCI6MTY3MzMzMzQzNSwiaWF0IjoxNjczMzI0NDM1fQ.F37A9lRl_Rk1Gi8sF_l4Dw1pnvWV1PIBWVmBeFtRhTHjslqCL_K4PFN6ucItmOMzcf_dMNs8B4g0ieWNTerZEA'};
    var response = await http.get(Uri.parse('https://agency-app-final.herokuapp.com/messages'), headers: headers);

    var jsonData = jsonDecode(response.body.toString());
    var jsonList = jsonData['data'];
    List<Data> senders = [];

    if (response.statusCode == 200) {
      for ( var jsonDataList in jsonList) {
        Data datalist = Data( senderName: jsonDataList['senderName'],
                              message: jsonDataList['message'],
                              id: jsonDataList['id'],
                              status: jsonDataList['status'],
                              created: jsonDataList['created'],
                              conversationName: jsonDataList['conversationName'],
                              picUser: jsonDataList['pic_user']);
        senders.add(datalist);
      }
      return senders;
    } else {
      return senders;
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
                      List<Data> senders = snapshot.data!;
                      return ListView.builder(
                          padding: const EdgeInsets.all(5),
                          itemCount: senders.length,
                          itemBuilder: (context, index) {
                            int reverseIndex = senders.length - 1 - index;
                            Data sender = senders[reverseIndex];
                            return Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              elevation: 5,
                              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                              child: ListTile(
                                leading: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(300),
                                      child: CachedNetworkImage(
                                        imageUrl: sender.picUser.toString(),
                                        height: 45,
                                        width: 45,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                ),
                                title: Text(sender.senderName.toString(), style: AppFonts.h9,),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Text(sender.message.toString(), style: AppFonts.h2,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,),
                                    SizedBox(height: 7),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(width: 5,),
                                        Text(sender.created.toString(), style: AppFonts.h12,)
                                      ],
                                    ),
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
    );
  }
}

