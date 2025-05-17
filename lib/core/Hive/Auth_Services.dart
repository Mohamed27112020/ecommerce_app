import 'package:crypto/crypto.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'user_model.dart';

class AuthService {
  final Box _authBox = Hive.box('authBox');

  // Hash password
  String _hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  // Register new user
  Future<bool> register(String username, String email, String password) async {
    if (_authBox.get(email) != null) {
      print(_authBox.get(email));
      return false; // User already exists
    }

    final user = User(
      username: username,
      email: email,
      passwordHash: _hashPassword(password),
    );

    await _authBox.put(email, user);
    return true;
  }

  // Login user
  /*
  Future<bool> login(String email, String password) async {
    final user = _authBox.get(email) as User?;
    
    if (user == null) return false;
    
    return user.passwordHash == _hashPassword(password);
  }
  */

  Future<User?> login({required String email, required String password}) async {
    try {
      // Get user from Hive box using email as key
      final user = _authBox.get(email) as User?;

      // If user doesn't exist or password doesn't match
      if (user == null || user.passwordHash != _hashPassword(password)) {
        return null;
      }

      // Return user if credentials are valid
      return user;
    } catch (e) {
      print('Login error: $e');
      return null;
    }
  }

  // Get current user
  User? getCurrentUser(String email) {
    return _authBox.get(email) as User?;
  }

  // Logout (just remove from memory, no Hive action needed)
}
