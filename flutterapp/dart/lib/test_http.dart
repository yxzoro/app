import 'dart:collection';
import 'dart:math';

import 'package:http/http.dart' as http;

class MyApp {
  var name = "myapp";    
}


testHttp() {
    var url = "http://example.com/whatsit/create";
    http.post(url, body: {"name": "doodle", "color": "blue"})
        .then(
            (response) {
                print("Response status: ${response.statusCode}");
                print("Response body: ${response.body}");
            }
        );

    http.read("http://example.com/foobar.txt").then(print);
      
}












