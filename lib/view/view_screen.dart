// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:resturant_menu/models/resturant_model.dart';

class ViewPage extends StatelessWidget {
  final Resturant resturant;

  ViewPage({required this.resturant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text('Menu Items:'),
              if (resturant.menuItems != null)
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: resturant.menuItems!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${resturant.menuItems![index].name}"),
                      //subtitle: Text('Price: ${resturant.menuItems![index].price}'),
                    );
                  },
                ),
              SizedBox(height: 16),
              Text('Products:'),
              if (resturant.menuItems != null)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: resturant.menuItems!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Menu Item: ${resturant.menuItems![index].name}'),
                        if (resturant.menuItems![index].products != null)
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                resturant.menuItems![index].products!.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Text(
                                    "${resturant.menuItems![index].products![i].name}"),
                                subtitle: Text(
                                    'Price: ${resturant.menuItems![index].products![i].amount} ${resturant.menuItems![index].products![i].currency}'),
                                // leading:resturant.menuItems![index].products![i].image!=null?
                                // Image.network(resturant.menuItems![index].products![i].image):
                                //  Icon(Icons.person),
                                leading: Image.network(resturant
                                    .menuItems![index].products![i].image
                                    .toString()),
                              );
                            },
                          ),
                      ],
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:resturant_menu/models/resturant_model.dart';

// class ViewPage extends StatelessWidget {
//   final Resturant resturant;

//   ViewPage({required this.resturant});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Restaurant Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//              // Text('Restaurant Name: ${resturant.restaurantName}'),
//               SizedBox(height: 16),
//               Text('Menu Items:'),
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: resturant.menuItems!.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text("${resturant.menuItems![index].name}"),
//                     //subtitle: Text('Price: ${resturant.menuItems[index].price}'),
//                   );
//                 },
//               ),
//               SizedBox(height: 16),
//               Text('Products:'),
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: resturant.menuItems![index].products!.length,
//                 itemBuilder: (context, i) {
//                   return ListTile(
//                     title: Text("${resturant.menuItems![index].products![i].name}"),
//                     subtitle: Text('Price: ${resturant.menuItems![index].products![i].amount} ${resturant.menuItems![index].products![i].currency}'),
//                     leading: Image.network(resturant.menuItems![index].products![i].image),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:resturant_menu/models/resturant_model.dart';

// class ViewPage extends StatelessWidget {
//   final Resturant resturant;

//   ViewPage({required this.resturant});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Restaurant Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//             //  Text('Restaurant Name: ${resturant.restaurantName}'),
//               SizedBox(height: 16),
//               Text('Menu Items:'),
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: resturant.menuItems!.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text("${resturant.menuItems![index].name}"),
//                     subtitle: Text('Price: ${resturant.menuItems![index].products}'),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
