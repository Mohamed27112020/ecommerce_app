import 'package:ecommerce_app/core/Hive/Auth_Services.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/uitls/Storage.dart';
import 'package:ecommerce_app/core/widgets/custom_text_field.dart';
import 'package:ecommerce_app/core/widgets/primay_button_widget.dart';
import 'package:ecommerce_app/features/AuthScreen/Cubit/AuthCubit.dart';
import 'package:ecommerce_app/features/AuthScreen/Cubit/AuthStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController UserNamecontroller = TextEditingController();

  TextEditingController Passwordcontroller = TextEditingController();

  Storagehelper storagehelper = Storagehelper();
@override
  void initState() {
    super.initState();
  storagehelper.getToken().then((value) {
    if (value != null && value.isNotEmpty) {
      Navigator.pushNamed(context, '/Main');
    }
  });
  }
  @override
  void dispose() {
    UserNamecontroller.dispose();
    Passwordcontroller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            storagehelper.saveToken(state.tokenModel.token);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login Success - Successful credentials'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            );
            Navigator.pushNamed(context, '/Main');
          }
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login Failed - Invalid credentials'),
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
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                Text(
                  "Login to your account",
                  style: AppStyles.primaryHeadLinesStyle,
                ),
                SizedBox(height: 5.h),
                Text(
                  "It's great to see you again!",
                  style: AppStyles.grey12MediumStyle,
                ),
                SizedBox(height: 40.h),
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
                SizedBox(height: 20.h),
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
                SizedBox(height: 80.h),
                PrimayButtonWidget(
                  buttonText: "Sign In",
                  onPress: () async {
                    BlocProvider.of<AuthCubit>(context).login(
                      username: UserNamecontroller.text,
                      password: Passwordcontroller.text,
                      context: context,
                    );
                    /*
                      final authService = AuthService();
                      final success = await authService.login(
                        email: UserNamecontroller.text,
                        password: Passwordcontroller.text,
                      );
                      if (success != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login Success - Successful credentials'),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        );
                        Navigator.pushNamed(context, '/Main');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login failed - invalid credentials'),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        );
                      }
                      */
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
                          Navigator.pushNamed(context, "/Register");
                        },
                        child: Text("Join", style: AppStyles.black16w500Style),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
