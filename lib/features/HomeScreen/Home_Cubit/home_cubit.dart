import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/features/HomeScreen/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_state.dart';

class ProductsCubit extends Cubit<Products_States> {
  ProductsCubit() : super(HomeCubitInitial());

  bool isdark = false;

  void changetheme() {
    if (isdark) {
      isdark = false;
    } else {
      isdark = true;
    }
    emit(Changethemesuccess());
  }

  DioHelper dioHelper = DioHelper();
  Dio? dio;
  List<Product> Carts = [];
  List<String> Cats = [];
  Future<List<Product>> fetchProducts() async {
    final dio = Dio();
    List<Product> products = [];
    try {
      emit(Productsloading());
      final response = await dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200) {
        emit(ProductloadedSuccess(products));
        final data = response.data;
        final List<Product> responseData = [];
        print(products.length);
        data.forEach((element) async {
          responseData.add(await Product.fromJson(element));
          products.add(await Product.fromJson(element));
        });
        await Future.delayed(Duration(seconds: 1));
        //  print(products.length);
        //  print(responseData.length);
        return responseData;
      } else {
        emit(ProductloadedError(response.data));
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } on DioException catch (e) {
      emit(ProductloadedError(e.error.toString()));
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      emit(ProductloadedError(e.toString()));
      throw Exception('Unexpected error: $e');
    }
  }

  Future<List<String>> fetchCatogeys() async {
    final dio = Dio();
    try {
      emit(Categoriesloading());
      final response = await dio.get(
        'https://fakestoreapi.com/products/categories',
      );
      if (response.statusCode == 200) {
        final data = response.data;
        await Future.delayed(Duration(seconds: 1));
        print(data.length);
        print(data);
        emit(CategoriesloadedSuccess(Cats));
        data.forEach((element) async {
          Cats.add(element);
        });
        print(Cats);
        return data.map((item) => item.toString()).toList();
      } else {
        emit(CategoriesloadedError(response.data));
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } on DioException catch (e) {
      emit(CategoriesloadedError(e.error.toString()));
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      emit(CategoriesloadedError(e.toString()));
      throw Exception('Unexpected error: $e');
    }
  }

  Future<List<Product>> GetCategoryProductsName({
    required String categoryname,
  }) async {
    final dio = Dio();
    List<Product> CatNames = [];
    try {
      emit(Productsloading());
      final response = await dio.get(
        'https://fakestoreapi.com/products/category/${categoryname}',
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final List<Product> responseData = [];
        print(CatNames.length);
        data.forEach((element) async {
          responseData.add(await Product.fromJson(element));
          CatNames.add(await Product.fromJson(element));
        });
        await Future.delayed(Duration(seconds: 1));
        print("5555");
        print(CatNames.first);
        print(responseData.length);
        emit(ProductloadedSuccess(CatNames));
        return responseData;
      } else {
        emit(ProductloadedError(response.data));
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } on DioException catch (e) {
      emit(ProductloadedError(e.error.toString()));
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      emit(ProductloadedError(e.toString()));
      throw Exception('Unexpected error: $e');
    }
  }
}
