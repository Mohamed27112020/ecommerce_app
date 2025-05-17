import 'package:device_preview/device_preview.dart';
import 'package:ecommerce_app/ThemeCubt.dart';
import 'package:ecommerce_app/core/Hive/Hiveservices.dart';
import 'package:ecommerce_app/core/Hive/user_model.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/core/routing/router_generation_config.dart'
    show AppRouter;
import 'package:ecommerce_app/core/styling/theme_data.dart';
import 'package:ecommerce_app/features/AuthScreen/Cubit/AuthCubit.dart';
import 'package:ecommerce_app/features/CartScreen/Cart_Cubit/Cartcubit.dart';
import 'package:ecommerce_app/features/HomeScreen/Home_Cubit/home_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  Hive.registerAdapter(UserAdapter()); // Generated adapter
  await DioHelper.initDio();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (BuildContext context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<CartCubit>(create: (context) => CartCubit()),
            BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
            BlocProvider<ThemeCubit>(
              create: (context) => ThemeCubit()..loadTheme(),
            ),
            BlocProvider<ProductsCubit>(create: (context) => ProductsCubit()),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'E-Commerce Demo',
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                themeMode: state.themeMode,
                // theme:
                //   context.read<ProductsCubit>().isdark
                //       ? AppThemes.darktheme
                //       : AppThemes.lightTheme,
                debugShowCheckedModeBanner: false,
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: '/',
              );
            },
          ),
        );
      },
    );
  }
}
