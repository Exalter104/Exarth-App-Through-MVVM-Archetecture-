// import 'package:exarth/view_models/deliverylist_model.dart';
import 'package:exarth/components/buttons/buttons.dart';
// import 'package:exarth/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class DeliveryList extends StatefulWidget {
  const DeliveryList({super.key});

  @override
  State<DeliveryList> createState() => _DeliveryListState();
}

class _DeliveryListState extends State<DeliveryList> {
  @override
  Widget build(BuildContext context) {
    // final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("GET API")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Roundbutton(title: "MyDeliveryList", onPress: () {})],
      ),
    );
  }
}






// Expanded(
          //   child: FutureBuilder(
          //     future: DeliveryListModel(),
          //     builder: (context, snapshot) {
          //       if (!snapshot.hasData) {
          //         return const Center(child: Text("Loading"));
          //       } else {
          //         return ListView.builder(
          //             itemCount: postmodel.length,
          //             itemBuilder: (context, index) {
          //               return Card(
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       const Text(
          //                         "Title",
          //                         style: TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold),
          //                       ),
          //                       Text("${DeliveryList[index].title}"),
          //                       const Text(
          //                         "Description",
          //                         style: TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold),
          //                       ),
          //                       Text("${DeliveryList[index].body}"),
          //                     ],
          //                   ),
          //                 ),
          //               );
          //             });
          //       }
          //     },
          //   ),
          // ) 