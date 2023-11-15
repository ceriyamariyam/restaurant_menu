// ignore_for_file: unnecessary_string_interpolations

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:resturant_menu/api/api_client.dart';
import 'package:resturant_menu/common/image_view.dart';
import 'package:resturant_menu/models/resturant_model.dart';
import 'package:resturant_menu/view/resturant_detail_page.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({Key? key}) : super(key: key);

  @override
  _RestaurantDetailsState createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  late Future<Resturant> restaurantFuture;

  @override
  void initState() {
    super.initState();
    restaurantFuture = fetchRestaurantData();
  }

  ApiClient apiClient = ApiClient('https://kezel.co/api/');

  Future<Resturant> fetchRestaurantData() async {
    final Map<String, dynamic> dataValue = {
      "restaurant": "LeisureInnVKL",
    };
    try {
      final apiClient = ApiClient('https://kezel.co/api/');
      final data = await apiClient.postData(dataValue);
      return data;
    } catch (e) {
      debugPrint('Error: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: FutureBuilder(
        future: restaurantFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final Resturant restaurant = snapshot.data as Resturant;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RestaurantDetailPage(restaurant: restaurant),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: ListTile(
                          title: Text(
                            'Restaurant Name: ${restaurant.pageTitle ?? ''}',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text("view restaurant details",
                            textAlign: TextAlign.left,),
                          trailing: const Icon(
                            Icons.chevron_right,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Menu Items:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      shrinkWrap: true,
                      itemCount: restaurant.menuItems?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                ),
                                child: ListTile(
                                  title: Text(
                                      "${restaurant.menuItems![index].name ?? ''}",
                                        textAlign: TextAlign.left,),
                                  subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (var product in restaurant
                                                .menuItems![index].products ??
                                            [])
                                          ListTile(
                                            title: Text(product.name ?? ''),
                                            subtitle: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                    'Price: ${product.amount ?? ''} ${product.currency ?? ''}',
                                                      textAlign: TextAlign.left,),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                SizedBox(
                                                  height: 100,
                                                  child: SingleChildScrollView(
                                                    child: Text(
                                                        product.desc ?? "",
                                                          textAlign: TextAlign.left,),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            leading: product.image != null
                                                ? GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  ((context) =>
                                                                      ImageView(
                                                                        imageUrl:
                                                                            product.image!,
                                                                      ))));
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            product.image!,
                                                        fit: BoxFit.fill,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.18,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.40,
                                                        placeholder:
                                                            (context, url) =>
                                                                Container(
                                                          color: Colors.grey,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              4,
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.asset(
                                                                'assets/images/default_food.jpg'),
                                                      ),
                                                    ),
                                                  )
                                                : Image.asset(
                                                    'assets/images/default_food.jpg'),
                                          ),
                                      ]),
                                )));
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
