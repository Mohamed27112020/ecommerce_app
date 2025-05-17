import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primay_button_widget.dart';
import 'package:ecommerce_app/features/CartScreen/Cart_Cubit/Cartcubit.dart';
import 'package:ecommerce_app/features/CartScreen/Cart_Cubit/cartstates.dart';
import 'package:ecommerce_app/features/HomeScreen/Home_Cubit/home_cubit.dart';
import 'package:ecommerce_app/features/HomeScreen/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Detailsscreen extends StatelessWidget {
  Detailsscreen({super.key, this.product});
  Product? product;

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)?.settings.arguments as Product;

    if (product == null) {
      return Scaffold(body: Center(child: Text('No data received')));
    }
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Details", style: AppStyles.primaryHeadLinesStyle),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Hero(
                  tag: "products${product!.image}",
                  child: Image.network(
                    product!.image,
                    // "assets/images/Tshirt.png",
                    fit: BoxFit.cover,
                    height: 300.h,
                    width: 200.w,
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: double.infinity,
                  child: Text(
                    product!.title,
                    maxLines: 2,
                    //"Fit Polo T Shirt",
                    textAlign: TextAlign.start,
                    style: AppStyles.primary24HeadStyle,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 5.w),
                    Text(
                      "rating",
                      //"4.5",
                      style: AppStyles.black16w500Style,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      product!.rating.rate.toString(),
                      //"4.5",
                      style: AppStyles.black16w500Style,
                    ),
                    Spacer(),
                    Text("count", style: AppStyles.grey12NormalMediumStyle),
                    SizedBox(width: 5.w),
                    Text(
                      product!.rating.count.toString(),
                      style: AppStyles.grey12NormalMediumStyle,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  product!.description,
                  // "Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them",
                  maxLines: 3,
                  style: AppStyles.grey10w500Style,
                ),
                Spacer(),
                Container(
                  height: 1.h,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("Price", style: AppStyles.grey10w500Style),
                        SizedBox(height: 5.h),
                        Text(
                          product!.price.toString(),
                          // "\$156",
                          style: AppStyles.black16w500Style,
                        ),
                      ],
                    ),
                    SizedBox(width: 8.w),
                    PrimayButtonWidget(
                      trailingIcon: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),
                      buttonText: "Add to Cart",
                      height: 56.h,
                      width: 200.w,
                      buttonColor: AppColors.primaryColor,
                      textColor: Colors.white,
                      onPress: () {
                        context.read<CartCubit>().CartItems.add(product!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Added to Cart"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        print(context.read<CartCubit>().CartItems.length);
                        Navigator.pushNamed(context, '/Main');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
