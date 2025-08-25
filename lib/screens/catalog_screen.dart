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
    Item(
        name: "Shoes",
        price: 59.99,
        imageUrl:
            'https://up.yimg.com/ib/th/id/OIP.M_yPW_pPIxDHh1XbVg2MRAHaJQ?pid=Api&rs=1&c=1&qlt=95&w=81&h=101'),
    Item(
        name: "Shirt",
        price: 29.99,
        imageUrl:
            'https://up.yimg.com/ib/th/id/OIP.obi3X73hahF9hBFIWf53nAHaJM?pid=Api&rs=1&c=1&qlt=95&w=100&h=124'),
    Item(
        name: "Watch",
        price: 99.99,
        imageUrl:
            'https://images.pexels.com/photos/2113994/pexels-photo-2113994.jpeg?cs=srgb&dl=pexels-joey-nguy%E1%BB%85n-2113994.jpg&fm=jpg'),
    Item(
        name: "Cap",
        price: 14.99,
        imageUrl:
            'https://up.yimg.com/ib/th/id/OIP.-TOnPUIi0qH5lv6guKtzjAHaGV?pid=Api&rs=1&c=1&qlt=95&w=134&h=114'),
    Item(
        name: "mobile",
        price: 100.33,
        imageUrl:
            'https://up.yimg.com/ib/th/id/OIP.ePRvf2JuWFkdKRpZKM3mFAHaNK?pid=Api&rs=1&c=1&qlt=95&w=67&h=119'),
    Item(
        name: 'car',
        price: 200.33,
        imageUrl:
            'https://up.yimg.com/ib/th/id/OIP.-wtRKCICcILF5WqJLjODxgHaED?pid=Api&rs=1&c=1&qlt=95&w=210&h=115'),
    Item(
        name: 'bike',
        price: 150.99,
        imageUrl:
            'http://pluspng.com/img-png/png-hd-bike-ktm-rc-390-motorcycle-bike-png-image-1592.png'),
    Item(
        name: 'laptop',
        price: 80.99,
        imageUrl:
            'https://up.yimg.com/ib/th/id/OIP.-AtwxKY70S2aTwoDs2BL4AHaE8?pid=Api&rs=1&c=1&qlt=95&w=157&h=104'),
    Item(
        name: 'coolers',
        price: 30.45,
        imageUrl:
            'https://up.yimg.com/ib/th/id/OIP.2bhuiUIkeKNothIZ4uMwhQHaHa?pid=Api&rs=1&c=1&qlt=95&w=103&h=103'),
    Item(
        name: 'Sunglasses',
        price: 45.99,
        imageUrl:
            'https://images.pexels.com/photos/46710/pexels-photo-46710.jpeg?auto=compress&w=120&h=120'),
    Item(
        name: 'Backpack',
        price: 65.50,
        imageUrl:
            'https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg?auto=compress&w=120&h=120'),
    Item(
        name: 'Headphones',
        price: 89.99,
        imageUrl:
            'https://images.pexels.com/photos/374870/pexels-photo-374870.jpeg?auto=compress&w=120&h=120'),
    Item(
        name: 'Tablet',
        price: 120.49,
        imageUrl:
            'https://images.pexels.com/photos/5082561/pexels-photo-5082561.jpeg?auto=compress&w=120&h=120'),
    Item(
        name: 'Smartwatch',
        price: 75.99,
        imageUrl:
            'https://images.pexels.com/photos/267394/pexels-photo-267394.jpeg?auto=compress&w=120&h=120'),
    Item(
        name: 'Camera',
        price: 199.99,
        imageUrl:
            'https://tse1.mm.bing.net/th/id/OIP.47PFr_H8LS33py9fj-qOwQHaE8?pid=Api&P=0&h=180'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("Shopping List", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
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
        elevation: 4,
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
