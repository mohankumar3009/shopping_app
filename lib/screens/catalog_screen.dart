import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopping_app/models/list_model.dart';
import 'package:shopping_app/widgets/item_widgets.dart';
import '../providers/cart_provider.dart';

import 'cart_screen.dart';
import 'package:badges/badges.dart' as badges;

class CatalogScreen extends StatelessWidget {
  CatalogScreen({super.key});

  final List<Item> catalog = [
    Item(name: "Shoes", price: 59.99),
    Item(name: "Shirt", price: 29.99),
    Item(name: "Watch", price: 99.99),
    Item(name: "Cap", price: 14.99),
    Item(name: "mobile", price: 100.33),
    Item(name: 'car', price: 200.33),
    Item(name: 'bike', price: 150.99),
    Item(name: 'laptop', price: 80.99),
    Item(name: 'coolers', price: 30.45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("Catalog", style: TextStyle(color: Colors.black)),
        leading: Builder(
          builder: (context) => Tooltip(
            message: 'Drawer',
            child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Image.asset('assets/menu 1 (1).png', width: 22, height: 22),
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) => badges.Badge(
              showBadge: cart.counter > 0,
              badgeStyle: badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                badgeColor: Colors.redAccent,
                elevation: 4,
                padding: const EdgeInsets.all(4),
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.white, width: 1),
              ),
              badgeAnimation: badges.BadgeAnimation.scale(
                animationDuration: const Duration(milliseconds: 500),
                curve: Curves.elasticInOut,
                toAnimate: true,
              ),
              badgeContent: SizedBox(
                width: 15,
                height: 15,
                child: Center(
                  child: Text(
                    cart.counter.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                ),
                child: const Icon(Icons.shopping_cart, color: Colors.black),
              ),
            ),
          ),

          const SizedBox(width: 15),
        ],
      ),
      drawer: Drawer(
        elevation: 16,
        backgroundColor: Colors.black38,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(30),
            bottomEnd: Radius.circular(30),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                'Mohan',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: const Text(
                '210921205006',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              decoration: BoxDecoration(color: Colors.amberAccent),
            ),
            ListTile(
              leading: const Icon(Icons.home_filled, color: Colors.grey),
              title: Text('Catalog', style: TextStyle(color: Colors.white)),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.amberAccent,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CatalogScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.add_shopping_cart_rounded,
                color: Colors.grey,
              ),
              title: Text('cart', style: TextStyle(color: Colors.white)),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.amberAccent,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: catalog.length,
        itemBuilder: (context, index) => ItemWidget(item: catalog[index]),
      ),
    );
  }
}
