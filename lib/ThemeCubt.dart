import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:equatable/equatable.dart';

// State
class ThemeState extends Equatable {
  final ThemeMode themeMode;

  const ThemeState({this.themeMode = ThemeMode.system});

  @override
  List<Object> get props => [themeMode];
}

// Cubit
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  Future<void> toggleTheme() async {
    final newMode =
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    emit(ThemeState(themeMode: newMode));

    // Save preference
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', newMode == ThemeMode.dark);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;
    emit(ThemeState(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
  }
}
