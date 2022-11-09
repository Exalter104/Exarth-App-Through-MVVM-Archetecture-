import 'package:exarth/data/response/status.dart';
// import 'package:exarth/models/delivery_model.dart';
import 'package:exarth/view_models/home_view_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DeliverListViewViewModel deliverListViewViewModel =
      DeliverListViewViewModel();

  @override
  void initState() {
    deliverListViewViewModel.getDeliveryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        automaticallyImplyLeading: false,
      ),
      body: ChangeNotifierProvider<DeliverListViewViewModel>(
          create: (BuildContext context) => deliverListViewViewModel,
          child:
              Consumer<DeliverListViewViewModel>(builder: (context, value, _) {
            switch (value.deliverylistviewviewModel.status) {
              case Status.LOADING:
                return CircularProgressIndicator();
              case Status.ERROR:
                return Text(value.deliverylistviewviewModel.message.toString());
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount:
                        value.deliverylistviewviewModel.data!.results!.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Card(
                            child: Center(
                          child: ListTile(
                            title: Text(value.deliverylistviewviewModel.data!
                                .results![index].id
                                .toString()),
                            subtitle: Text(value.deliverylistviewviewModel.data!
                                .results![index].acceptedOn
                                .toString()),
                          ),
                        )),
                      );
                    });

              default:
            }
            return Container();
          })),
    );
  }
}
