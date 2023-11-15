import 'package:flutter/material.dart';

class RestaurantDetailsDrawer extends StatelessWidget {
  final String restaurantName;
  final String phoneNumber;
  final String email;
  final String address;
  final String website;
  final String facebookLink;
  final String instagramLink;
  final String twitterLink;
  final String pinterestLink;
  final String linkedinLink;
  final String copyright;
  final String image;

  RestaurantDetailsDrawer({
    required this.restaurantName,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.website,
    required this.facebookLink,
    required this.instagramLink,
    required this.twitterLink,
    required this.pinterestLink,
    required this.linkedinLink,
    required this.copyright,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 12.0,
                  child: Text(
                    restaurantName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone: $phoneNumber'),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email: $email'),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Address: $address'),
          ),
          ListTile(
            leading: Icon(Icons.web),
            title: Text('Website: $website'),
            onTap: () {
              // Handle opening the website link
            },
          ),
          Divider(),
          ListTile(
            title: Text('Social Media Links'),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset('assets/facebook_icon.png'), // Replace with actual image asset
            title: Text('Facebook'),
            onTap: () {
              // Handle opening the Facebook link
            },
          ),
          ListTile(
            leading: Image.asset('assets/instagram_icon.png'), // Replace with actual image asset
            title: Text('Instagram'),
            onTap: () {
              // Handle opening the Instagram link
            },
          ),
          ListTile(
            leading: Image.asset('assets/twitter_icon.png'), // Replace with actual image asset
            title: Text('Twitter'),
            onTap: () {
              // Handle opening the Twitter link
            },
          ),
          ListTile(
            leading: Image.asset('assets/pinterest_icon.png'), // Replace with actual image asset
            title: Text('Pinterest'),
            onTap: () {
              // Handle opening the Pinterest link
            },
          ),
          ListTile(
            leading: Image.asset('assets/linkedin_icon.png'), // Replace with actual image asset
            title: Text('LinkedIn'),
            onTap: () {
              // Handle opening the LinkedIn link
            },
          ),
          Divider(),
          ListTile(
            title: Text('Legal Information'),
            onTap: () {},
          ),
          ListTile(
            title: Text(copyright),
          ),
        ],
      ),
    );
  }
}
