import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/uitls/Loading.dart';
import 'package:ecommerce_app/core/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/HomeScreen/Home_Cubit/home_cubit.dart';
import 'package:ecommerce_app/features/HomeScreen/Widget/Cart.dart';
import 'package:ecommerce_app/features/HomeScreen/productmodel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();

    context.read<ProductsCubit>().fetchCatogeys();
    context.read<ProductsCubit>().fetchProducts();
  }

  List<Product> CatNames1 = [];
  String selectedCategory = '';
  bool isselected = false;
  @override
  Widget build(BuildContext context) {
    Future<List<Product>> products =
        context.read<ProductsCubit>().fetchProducts();
    List<String> cats = context.read<ProductsCubit>().Cats;
    return SafeArea(
      child: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: LoadingLottie());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Product> data = snapshot.data!;
            data.asMap().forEach((key, value) {
              if (value.category == selectedCategory) {
                CatNames1.add(value);
              }
            });
            return Scaffold(
              
              body: BlocConsumer<ProductsCubit, Products_States>(
                listener: (context, state) async {
                  // TODO: implement listener
                  if (state is CategoriesloadedSuccess) {
                    cats = state.Categories;
                  }
                  if (state is GetCategoriesNameloadedSuccess) {
                    data = (await state.CategoriesNames).cast<Product>();
                  }
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 39,
                      right: 16,
                      left: 16,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Discover",
                          textAlign: TextAlign.start,
                          style: AppStyles.primaryHeadLinesStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              CustomTextField(
                                controller: searchController,
                                hintText: "Search for Clothes",
                                width: 210.w,
                                height: 52.h,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () async {},
                                child: Image.asset(
                                  "assets/images/Button.png",
                                  width: 30.w,
                                  height: 52.h,
                                  scale: 1.0,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 70,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: cats.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            // physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return buildCartButton(
                                onpressed: () {
                                  setState(() async {
                                    selectedCategory = cats[index];
                                    data = await context
                                        .read<ProductsCubit>()
                                        .GetCategoryProductsName(
                                          categoryname: cats[index],
                                        );
                                  });
                                },
                                isselected: selectedCategory == cats[index],
                                cats: cats,
                                index: index,
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: RefreshIndicator(
                            color: AppColors.primaryColor,
                            backgroundColor: Colors.white,
                            onRefresh: () async {
                              data =
                                  await context
                                      .read<ProductsCubit>()
                                      .fetchProducts();
                            },
                            child: ImageCardList(products: data),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

Widget buildCartButton({
  required bool isselected,
  required List<String> cats,
  required Function() onpressed,
  required int index,
}) {
  return TextButton(
    isSemanticButton: true,
    onPressed: onpressed,
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      ),
    ),
    child: Text(
      cats[index],
      style: TextStyle(
        color: isselected ? Colors.white : Colors.black,
        backgroundColor: isselected ? AppColors.primaryColor : null,
        fontSize: AppStyles.black18BoldStyle.fontSize,
      ),
    ),
  );
}
