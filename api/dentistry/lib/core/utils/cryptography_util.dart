import 'dart:convert';
import 'package:crypto/crypto.dart';

class Cryptography {
  static String encryptPassword(String senha) {
    final senhaBytes = utf8.encode(senha.trim());

    print(sha256.convert(senhaBytes).toString());
    print(sha256.convert(senhaBytes).toString());
    print(sha256.convert(senhaBytes).toString());

    return sha256.convert(senhaBytes).toString();
  }
}
