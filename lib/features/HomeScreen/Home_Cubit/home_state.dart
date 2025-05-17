part of 'home_cubit.dart';

@immutable
sealed class Products_States {}

final class HomeCubitInitial extends Products_States {}

final class Productsloading extends Products_States {}

final class ProductloadedSuccess extends Products_States {
  final List<Product> products;
  ProductloadedSuccess(this.products);
}

final class ProductloadedError extends Products_States {
  final String error;
  ProductloadedError(this.error);
}

final class Categoriesloading extends Products_States {}

final class CategoriesloadedSuccess extends Products_States {
  final List<String> Categories;
  CategoriesloadedSuccess(this.Categories);
}

final class CategoriesloadedError extends Products_States {
  final String error;
  CategoriesloadedError(this.error);
}

final class GetCategoriesNameloading extends Products_States {}

final class GetCategoriesNameloadedSuccess extends Products_States {
  final List<String> CategoriesNames;
  GetCategoriesNameloadedSuccess(this.CategoriesNames);
}

final class GetCategoriesNameloadedError extends Products_States {
  final String error;
  GetCategoriesNameloadedError(this.error);
}

final class Changethemesuccess extends Products_States {
}