class HttpConfig {
  static const prod = false;
  static final Map<String, dynamic> apiCampus = {
    "baseUrl": "https://message-api-l17o.onrender.com",
    "connectTimeout": const Duration(seconds: 60),
    "receiveTimeout": const Duration(seconds: 60)
  };
}
