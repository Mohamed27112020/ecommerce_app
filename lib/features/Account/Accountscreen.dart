import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primay_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Accountscreen extends StatelessWidget {
  const Accountscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Account", style: AppStyles.primaryHeadLinesStyle),
      ),
      body: Column(
        children: [
          Container(
            height: 100.h,
            child: Row(
              children: [
                Icon(
                  Icons.indeterminate_check_box_outlined,
                  size: 40.sp,
                  color: AppColors.blackColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("My Orders", style: AppStyles.black18BoldStyle),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 20.sp,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
          Container(height: 3.h, color: AppColors.greyColor),
          Container(
            height: 100.h,
            child: Row(
              children: [
                Icon(
                  Icons.details_rounded,
                  size: 40.sp,
                  color: AppColors.blackColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("My Details", style: AppStyles.black18BoldStyle),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 20.sp,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1.05.h, width: 200.w, color: AppColors.greyColor),
          Container(
            height: 100.h,
            child: Row(
              children: [
                Icon(
                  Icons.home_outlined,
                  size: 40.sp,
                  color: AppColors.blackColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Address Book",
                    style: AppStyles.black18BoldStyle,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/Address");
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 20.sp,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1.05.h, width: 200.w, color: AppColors.greyColor),
          Container(
            height: 100.h,
            child: Row(
              children: [
                Icon(
                  Icons.question_mark_outlined,
                  size: 40.sp,
                  color: AppColors.blackColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("FAQs", style: AppStyles.black18BoldStyle),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 20.sp,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1.05.h, width: 200.w, color: AppColors.greyColor),
          Container(
            height: 100.h,
            child: Row(
              children: [
                Icon(
                  Icons.headphones_rounded,
                  size: 40.sp,
                  color: AppColors.blackColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("FAQs", style: AppStyles.black18BoldStyle),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 20.sp,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1.05.h, width: 200.w, color: AppColors.greyColor),
          Spacer(),
          GestureDetector(
            onTap: () {
              ShowDialog(context: context);
              //  Hive.box('authBox').clear();
              //    Navigator.pushNamed(context, "/Login");
            },
            child: Container(
              height: 100.h,
              child: Row(
                children: [
                  Icon(Icons.logout_outlined, size: 40.sp, color: Colors.red),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void ShowDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          height: 400.h,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                Icon(Icons.logout_outlined, size: 40.sp, color: Colors.red),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Are you sure to logout?",
                    style: AppStyles.black18BoldStyle,
                  ),
                ),
                SizedBox(height: 10.h),
                PrimayButtonWidget(
                  buttonColor: Colors.red,
                  onPress: () {
                    // Hive.box('authBox').clear();
                    Navigator.pushNamed(context, "/Login");
                  },
                  buttonText: "Logout",
                ),
                SizedBox(height: 10.h),
                PrimayButtonWidget(
                  onPress: () {
                    Navigator.pop(context);
                  },
                  buttonText: "Cancel",
                  buttonColor: AppColors.secondaryColor,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
