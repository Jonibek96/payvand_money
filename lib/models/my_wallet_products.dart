import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWalletProducts {
  final String title;
  final String icons;
  MyWalletProducts({
    required this.title,
    required this.icons
  });
}

List<MyWalletProducts> my_walletItem = [
  MyWalletProducts(
      title: "Electricity",
      icons: "assets/icons/electr.png"
  ),
  MyWalletProducts(
      title: "E-Commerce",
      icons:  "assets/icons/e-com.png"
  ),
  MyWalletProducts(
      title: "Mobile & Data",
      icons:  "assets/icons/mobile.png"
  ),
  MyWalletProducts(
      title: "Transportation",
      icons:  "assets/icons/transport.png"
  ),
  MyWalletProducts(
      title: "TV & Internet",
      icons:  "assets/icons/wifi.png"
  ),
  MyWalletProducts(
      title: "Pharmacy",
      icons:  "assets/icons/pharmacy.png"
  ),
  MyWalletProducts(
      title: "Tickets",
      icons:  "assets/icons/tickets.png"
  ),
  MyWalletProducts(
      title: "Hotel",
      icons:  "assets/icons/hotel.png"
  ),
  MyWalletProducts(
      title: "Flight",
      icons:  "assets/icons/flight.png"
  ),
  MyWalletProducts(
      title: "Fuel",
      icons:  "assets/icons/fuel.png"
  ),
  MyWalletProducts(
      title: "Pay Google play",
      icons:  "assets/icons/play.png"
  ),
  MyWalletProducts(
      title: "Food & Drink",
      icons:  "assets/icons/food.png"
  )
];