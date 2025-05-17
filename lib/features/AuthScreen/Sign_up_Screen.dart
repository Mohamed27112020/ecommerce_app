import 'package:ecommerce_app/core/Hive/Auth_Services.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_text_field.dart';
import 'package:ecommerce_app/core/widgets/primay_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController UserNamecontroller = TextEditingController();

  TextEditingController Passwordcontroller = TextEditingController();

  TextEditingController FullNamecontroller = TextEditingController();

  TextEditingController ConfirmPasswordcontroller = TextEditingController();

  @override
  void dispose() {
    UserNamecontroller.dispose();
    Passwordcontroller.dispose();
    FullNamecontroller.dispose();
    ConfirmPasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Text(
              "Login to your account",
              style: AppStyles.primaryHeadLinesStyle,
            ),
            SizedBox(height: 5.h),
            Text(
              "It's great to see you again!",
              style: AppStyles.grey12MediumStyle,
            ),
            SizedBox(height: 25.h),

            Text(
              "Full Name",
              textAlign: TextAlign.start,
              style: AppStyles.black18BoldStyle,
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: FullNamecontroller,

              hintText: "Enter your Full Name",
              width: double.infinity,
            ),
            Text(
              "User Name",
              textAlign: TextAlign.start,
              style: AppStyles.black18BoldStyle,
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: UserNamecontroller,

              hintText: "Enter your User Name",
              width: double.infinity,
            ),
            SizedBox(height: 10.h),
            Text(
              "Password",
              textAlign: TextAlign.start,
              style: AppStyles.black18BoldStyle,
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              hintText: "Enter your Password",
              controller: Passwordcontroller,
              isPassword: true,
              suffixIcon: Icon(Icons.remove_red_eye, color: Colors.grey),
            ),
            SizedBox(height: 10.h),
            /*  Text(
              "Confirm Password",
              textAlign: TextAlign.start,
              style: AppStyles.black18BoldStyle,
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              hintText: "Confirm your Password",
              controller: ConfirmPasswordcontroller,
              isPassword: true,
              suffixIcon: Icon(Icons.remove_red_eye, color: Colors.grey),
            ),
            */
            SizedBox(height: 40.h),
            PrimayButtonWidget(
              buttonText: "Sign Up",
              onPress: () async {
                final authService = AuthService();
                final success = await authService.register(
                  FullNamecontroller.text,
                  UserNamecontroller.text,
                  Passwordcontroller.text,
                );

                if (success) {
                  Navigator.pushNamed(context, '/Main');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Registration Success - email has been sent',
                      ),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Registration failed - email already exists',
                      ),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  );
                }
              },
              buttonColor: AppColors.primaryColor,
              textColor: Colors.white,
              width: double.infinity,
              height: 60.h,
            ),
            Spacer(),
            Container(
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account ?",
                    style: AppStyles.grey12MediumStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Sign in", style: AppStyles.black16w500Style),
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
