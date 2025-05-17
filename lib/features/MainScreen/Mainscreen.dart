import 'package:ecommerce_app/ThemeCubt.dart';
import 'package:ecommerce_app/features/Account/Accountscreen.dart'
    show Accountscreen;
import 'package:ecommerce_app/features/HomeScreen/HomeScreen.dart';
import 'package:ecommerce_app/features/HomeScreen/Home_Cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../CartScreen/CartScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // List of screens to display
  final List<Widget> _screens = [
    BlocProvider(
      create:
          (context) =>
              ProductsCubit()
                ..GetCategoryProductsName(categoryname: "jewelery"),
      child: HomeScreen(),
    ),
    Cartscreen(),
    Accountscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, Products_States>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
                icon: Icon(Icons.dark_mode),
              ),
            ],
          ),
          body: _screens[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
