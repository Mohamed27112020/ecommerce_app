import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Address", style: AppStyles.primaryHeadLinesStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(height: 1, color: AppColors.greyColor),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Text(
                "Saved Address",
                textAlign: TextAlign.start,
                style: AppStyles.black18BoldStyle,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 90.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyColor),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.location_on_outlined, size: 30),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text("Home", style: AppStyles.black18BoldStyle),

                      Text(
                        "925 S Chugach St #APT 10, Alas...",
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: AppStyles.subtitles10Styles,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 90.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyColor),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.location_on_outlined, size: 30),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text("Office", style: AppStyles.black18BoldStyle),

                      Text(
                        "2438 6th Ave, Ketchikan, Alaska 99",
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: AppStyles.subtitles10Styles,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 90.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyColor),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.location_on_outlined, size: 30),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text("Apartment", style: AppStyles.black18BoldStyle),

                      Text(
                        "2551 Vista Dr #B301, Juneau,99999",
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: AppStyles.subtitles10Styles,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 90.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greyColor),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.location_on_outlined, size: 30),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text("Parent’s House", style: AppStyles.black18BoldStyle),

                      Text(
                        "4821 Ridge Top Cir, Anchorage,9999",
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: AppStyles.subtitles10Styles,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
