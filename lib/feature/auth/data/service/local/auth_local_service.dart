import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final class AuthLocalService {
  static const String _tokenKey = 'auth_token';
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Save authentication token
  Future<void> saveToken(String token) async {
    try {
      await _secureStorage.write(key: _tokenKey, value: token);
      log('Token saved successfully.');
    } catch (e) {
      log('Failed to save token: $e');
    }
  }

  // Remove authentication token
  Future<void> removeToken() async {
    try {
      await _secureStorage.delete(key: _tokenKey);
      log('Token removed successfully.');
    } catch (e) {
      log('Failed to remove token: $e');
    }
  }

  // Check if token exists
  Future<bool> isTokenPresent() async {
    try {
      final String? token = await _secureStorage.read(key: _tokenKey);
      final bool isPresent = token != null;
      log('Token presence check: ${isPresent ? "Token exists" : "Token does not exist"}');
      return isPresent;
    } catch (e) {
      log('Failed to check token presence: $e');
      return false;
    }
  }

  // Get stored authentication token
  Future<String?> getToken() async {
    try {
      final String? token = await _secureStorage.read(key: _tokenKey);
      if (token != null) {
        log('Token retrieved: $token');
      } else {
        log('No token found.');
      }
      return token;
    } catch (e) {
      log('Failed to retrieve token: $e');
      return null;
    }
  }
}
