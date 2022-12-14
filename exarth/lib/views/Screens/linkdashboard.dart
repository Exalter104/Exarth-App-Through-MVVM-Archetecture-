// ignore_for_file: unnecessary_new, use_key_in_widget_constructors, must_be_immutable

import 'package:exarth/utils/Routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  var item1 = new Items(title: "Dlivery List", img: "images/calendar.png");

  Items item2 = new Items(
    title: "Profile",
    img: "images/food.png",
  );
  Items item3 = new Items(
    title: "Locations",
    img: "images/map.png",
  );
  Items item4 = new Items(
    title: "History",
    img: "images/notification.png",
  );

  Items item5 = new Items(
    title: "Update Distance",
    img: "images/todo.png",
  );
  Items item6 = new Items(
    title: "Warehouse",
    img: "images/setting.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesNames.home);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(color),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String img;

  Items({required this.title, required this.img});
}
