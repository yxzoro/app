// import dart standard lib
import 'dart:collection';
import 'dart:math';

// import package from pubspec.yaml dependency
import 'package:http/http.dart' as http;

// import myadd from my local lib
import 'lib/test_http.dart' as test_http;


// main function
void main(args) {
  print(args);
  print("hello dart");

  test_http.testHttp();
  
}

















