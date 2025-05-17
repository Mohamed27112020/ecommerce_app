import 'dart:math';

import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_text_field.dart';
import 'package:ecommerce_app/core/widgets/primay_button_widget.dart';
import 'package:ecommerce_app/features/CartScreen/Cart_Cubit/Cartcubit.dart';
import 'package:ecommerce_app/features/CartScreen/Cart_Cubit/cartstates.dart';
import 'package:ecommerce_app/features/HomeScreen/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cartscreen extends StatelessWidget {
  Cartscreen({super.key});
  int counter = 1;
  int totalprice = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CartLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CartErrorState) {
          return Center(child: Text(state.error));
        } else {
          totalprice = context.read<CartCubit>().TotalPrice(
            context.read<CartCubit>().CartItems,
          );
          int t = totalprice * counter;
          int total = totalprice + 80;
          print(totalprice);
          return Scaffold(
            appBar: AppBar(
              title: Text("Cart", style: AppStyles.primaryHeadLinesStyle),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      physics: BouncingScrollPhysics(),
                      itemCount: context.read<CartCubit>().CartItems.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return ItemforList(
                          product: context.read<CartCubit>().CartItems[index],
                        );
                      },
                    ),
                  ),

                  /*  SizedBox(height: 20.h),
              Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      width: 2.w,
                      color: AppColors.greyColor,
                    ),
                    vertical: BorderSide(width: 2.w, color: AppColors.greyColor),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/Tshirt.png", fit: BoxFit.cover),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Regular Fit Slogan",
                                style: AppStyles.black18BoldStyle,
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Size: M",
                                textAlign: TextAlign.start,
                                style: AppStyles.black18BoldStyle,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("\$1,157", style: AppStyles.black18BoldStyle),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove),
                              ),
                              Text("1", style: AppStyles.black18BoldStyle),
                              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),*/
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        "Sub-total ",
                        style: AppStyles.grey12NormalMediumStyle,
                      ),
                      Spacer(),
                      Text(
                        "${t}",
                        //  "\$5,458",
                        style: AppStyles.black18BoldStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text("VAT (%)", style: AppStyles.grey12NormalMediumStyle),
                      Spacer(),
                      Text("\$0.00", style: AppStyles.black18BoldStyle),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        "Shipping fee",
                        style: AppStyles.grey12NormalMediumStyle,
                      ),
                      Spacer(),
                      Text("\$80", style: AppStyles.black18BoldStyle),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Container(height: 1.h, color: AppColors.greyColor),
                  Row(
                    children: [
                      Text("Total ", style: AppStyles.grey12NormalMediumStyle),
                      Spacer(),
                      Text(
                        "\$${total.toString()}",
                        // "\$5,958",
                        style: AppStyles.black18BoldStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  PrimayButtonWidget(
                    buttonText: "Go To Checkout",
                    trailingIcon: Icon(Icons.arrow_forward),
                    buttonColor: AppColors.primaryColor,
                    textColor: Colors.white,
                    height: 56.h,
                    width: 331.w,
                    bordersRadius: 8.r,
                    onPress: () {},
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class ItemforList extends StatefulWidget {
  ItemforList({super.key, required this.product});
  Product product;

  @override
  State<ItemforList> createState() => _ItemforListState();
}

class _ItemforListState extends State<ItemforList> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(width: 2.w, color: AppColors.greyColor),
          vertical: BorderSide(width: 2.w, color: AppColors.greyColor),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            widget.product.image,
            // "assets/images/Tshirt.png",
            fit: BoxFit.contain,
            width: 100.w,
          ),
          SizedBox(width: 5.w),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.product.title.substring(0, 12),
                      // "Regular Fit Slogan",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppStyles.black18BoldStyle,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().CartItems.remove(
                          widget.product,
                        );
                        setState(() {});
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      widget.product.category,
                      //  "Size: M",
                      textAlign: TextAlign.start,
                      style: AppStyles.black18BoldStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      widget.product.price.toString(),
                      //  "\$1,157",
                      style: AppStyles.black18BoldStyle,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          counter--;
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(counter.toString(), style: AppStyles.black18BoldStyle),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
