import 'package:resale_app/pages/app_colors.dart';
import 'package:resale_app/pages/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:resale_app/model/properties_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'chat_property.dart';

class PropertyDetail extends StatefulWidget {
  final Data property;

  const PropertyDetail({Key? key, required this.property}) : super(key: key);

  @override
  _PropertyDetailState createState() => _PropertyDetailState();
}

class _PropertyDetailState extends State<PropertyDetail> {

  int activeIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: AppColors.lightBlue),
          title: Text(widget.property.userName.toString(), style: AppFonts.h14),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatProperty(senders: widget.property,)));
            },
                icon: Icon(Icons.insert_comment_outlined, color: AppColors.lightBlue,))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('ID: ', style: AppFonts.h6,),
                        Text(widget.property.id.toString(), style: AppFonts.h2,),
                      ],
                    )
                  ],
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    Column(
                      children: [
                        CarouselSlider.builder(
                            itemBuilder: (context, index, realIndex){
                              final urlImage = widget.property.picProperties![index];
                              return buildImage(urlImage, index);
                            },
                            itemCount: widget.property.picProperties!.length,
                            options: CarouselOptions(
                              autoPlay: false,
                              enlargeCenterPage: true,
                              aspectRatio: 2,
                              viewportFraction: 1,
                              enableInfiniteScroll: false,
                              onPageChanged: (index, reason) =>
                                  setState(() => activeIndex = index),
                            ),
                        ),
                        SizedBox(height: 15,),
                        buildIndicator()
                      ],
                    )
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Price: ', style: AppFonts.h6,),
                    Text(widget.property.priceSale.toString(), style: AppFonts.h11,),
                    SizedBox(width: 5,),
                    Text(widget.property.currency.toString(), style: AppFonts.h15,)
                  ],
                ),
                trailing: Text(widget.property.status.toString(), style: AppFonts.h10,),
              ),
              ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address: ', style: AppFonts.h6,),
                    SizedBox(height: 10,)
                  ],
                ),
                subtitle: Expanded(
                    child: Text(widget.property.address1.toString(), style: AppFonts.h2,)
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Property type: ', style: AppFonts.h6,),
                    Text(widget.property.typeName.toString(), style: AppFonts.h2,)
                  ],
                ),
              ),
              Container(
                width: 360,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Bedroom: ', style: AppFonts.h6,),
                            Text(widget.property.beds.toString(), style: AppFonts.h2,)
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Text('Terrace: ', style: AppFonts.h6,),
                            Text(widget.property.terraceSpace.toString(), style: AppFonts.h2,)
                          ],
                        )
                      ],
                    ),
                    SizedBox(width: 100,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Bathroom: ', style: AppFonts.h6,),
                            Text(widget.property.baths.toString(), style: AppFonts.h2,)
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Text('Garden: ', style: AppFonts.h6,),
                            Text(widget.property.gardenSpace.toString(), style: AppFonts.h2,)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description: ', style: AppFonts.h6,),
                    SizedBox(height: 10,)
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(widget.property.description.toString(), style: AppFonts.h2
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: CachedNetworkImage(
      width: double.infinity,
      imageUrl: urlImage,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
    ),
    ),
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: widget.property.picProperties!.length,
      effect: const ScrollingDotsEffect(
        dotWidth: 10,
        dotHeight: 10,
        activeDotColor: AppColors.lightBlue,
        dotColor: Colors.black12,
      ),);
}
