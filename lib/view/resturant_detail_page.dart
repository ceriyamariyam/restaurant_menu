import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:resturant_menu/common/image_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:resturant_menu/models/resturant_model.dart';

class RestaurantDetailPage extends StatelessWidget {
  final Resturant restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var websiteDetails = restaurant.website;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Restaurant Name: ${restaurant.pageTitle ?? ''}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: ((context) =>
                                                            ImageView(
                                                              imageUrl: websiteDetails.image!,
                                                            ))));
                },
                child: CachedNetworkImage(
                  imageUrl: websiteDetails!.image!,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.60,
                  placeholder: (context, url) => Container(
                    color: Colors.grey,
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/default_food.jpg'),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text('Phone: ${websiteDetails.phone ?? ''}'),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: Text('Email: ${websiteDetails.email ?? ''}'),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: Text('Address: ${websiteDetails.address ?? ''}'),
              ),
            
              const Text('Social Media Links:'),
              ListTile(
                leading: const Icon(Icons.facebook),
                title: const Text('Facebook'),
                onTap: () {
                  _launchURL(websiteDetails.facebookLink);
                },
              ),
              ListTile(
                  leading: Image.asset(
                                              'assets/images/instagram.jpg',
                                               height: 30,
                                              width: 30,),  
                title: const Text('Instagram'),
                onTap: () {
                  _launchURL(websiteDetails.instagramLink);
                },
              ),
              ListTile(
  leading: Image.asset(
                                              'assets/images/twiter.png',
                                               height: 30,
                                              width: 30,),                title: const Text('Twitter'),
                onTap: () {
                  _launchURL(websiteDetails.twitterLink);
                },
              ),
              ListTile(
                leading: Image.asset(
                                              'assets/images/pinterest.jpg',
                                               height: 30,
                                              width: 30,),
                title: const Text('Pinterest'),
                onTap: () {
                  _launchURL(websiteDetails.pinterestLink);
                },
              ),
              ListTile(
              leading: Image.asset(
                                              'assets/images/linkedin.jpg',
                                              height: 30,
                                              width: 30,),
                title: const Text('LinkedIn'),
                onTap: () {
                  _launchURL(websiteDetails.linkedinLink);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL(String? url) async {
    if (url != null && url.isNotEmpty) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
