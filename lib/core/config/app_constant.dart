import 'package:flutter/material.dart';

class AppConstant {
  static const kMockupHeight = 812;
  static const kMockupWidth = 375;
  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
  );
  static const appName = 'Messenger';
  static const clientId = '';
  static const clientSecret = '';
  static const serverUrl = 'http://127.0.0.1:8000';

  static const apiUrl = '$serverUrl/api';
  static const apiUser = '$serverUrl/user';
  static const myPhoto =
      'https://scontent.fmnl17-3.fna.fbcdn.net/v/t39.30808-6/425531657_7417096185014024_7583210606655009325_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_ohc=QQ8BFV-sOvYAb7Un95G&_nc_ht=scontent.fmnl17-3.fna&oh=00_AfCf89suOHvgv9-9sbx6k5pt2HqPfuwzn8ZNjpxM4nvi5A&oe=661FCD17';
}
