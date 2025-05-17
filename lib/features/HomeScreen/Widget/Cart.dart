import 'package:ecommerce_app/features/DetailsScreen/DetailsScreen.dart';
import 'package:ecommerce_app/features/HomeScreen/Home_Cubit/home_cubit.dart';
import 'package:ecommerce_app/features/HomeScreen/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCardList extends StatefulWidget {
  ImageCardList({super.key, required this.products});
  List<Product> products;

  @override
  State<ImageCardList> createState() => _ImageCardListState();
}

class _ImageCardListState extends State<ImageCardList>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Product? product;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of items per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8, // Adjust card aspect ratio
      ),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        Product? product = widget.products[index];
        return ScaleTransition(
          scale: _animation,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Detailsscreen(product: product);
                  },
                ),
              );
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Hero(
                        tag: "products${product.image}",
                        child: Image.network(
                          product.image,
                          // "assets/images/Tshirt.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          //  "shoes",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          product.price.toString(),
                          //  "\$120.00",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
