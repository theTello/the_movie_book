import 'package:flutter/foundation.dart' show immutable;

/// class containing all the network data such as [baseURL] and endpoints
@immutable
class NetworkData {
  /// Base url for network requests
  static const String baseURL = "https://api.themoviedb.org/";

  /// receive timeout duration for network requests
  static const Duration receiveTimeout = Duration(milliseconds: 150000);

  /// connection timeout duration for network requests
  static const Duration connectionTimeout = Duration(milliseconds: 150000);
}
