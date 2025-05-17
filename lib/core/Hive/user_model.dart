
import 'package:hive/hive.dart';

part 'user_model.g.dart'; // This will be generated

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String username;
  
  @HiveField(1)
  final String email;
  
  @HiveField(2)
  final String passwordHash; // Never store plain passwords
  
  User({
    required this.username,
    required this.email,
    required this.passwordHash,
  });
}