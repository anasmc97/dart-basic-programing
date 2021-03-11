import 'dart:convert';
import 'dart:io';

import 'package:web_services_missing_number/web_services_missing_number.dart' as web_services_missing_number;

import 'missing_number.dart';

Future<void> main(List<String> arguments) async {
    final server = await createServer();
  print('Server started: ${server.address} port ${server.port}');
  await handleRequests(server);
}
//create function createServer with localhost adress and port 4040
Future<HttpServer> createServer() async {
  final address = InternetAddress.loopbackIPv4;
  const port = 4040;
  return await HttpServer.bind(address, port);
}
//create function handlerequest
Future<void> handleRequests(HttpServer server) async {
  await for (HttpRequest request in server) {
    //check request.method if case 1 called function handelGet(), case 2 called function handlePost, default case handleDefault
    switch (request.method) {
      case 'GET':
        handleGet(request);
        break;
      case 'POST':
        handlePost(request);
        break;
      default:
        handleDefault(request);
    }
  }
}
//initialize object number and data
String number = "kosong";
Map data = {
  'Missing Number': number, //number is value from Missing Number
};

/// GET requests
void handleGet(HttpRequest request) {
  //get path from rquest.uri
  final path = request.uri.path;
  //if path is /missingnumber called function handleGetMissingNumber, if not called function handleGetOther 
  switch (path) {
    case '/missingnumbers':
      handleGetMissingNumber(request);
      break;
    default:
      handleGetOther(request);
  }
}

void handleGetMissingNumber(HttpRequest request) {
  //get value of queryparameter from request.uri
  final queryParams = request.uri.queryParameters;
  // if there is no queryparameter put in then response is "tidak ada yang dimasukan"
  if (queryParams.isEmpty) {
    final jsonString = jsonEncode("tidak ada angka yang dimasukan");
    request.response //response from request
      ..statusCode = HttpStatus.ok //response status code from request
      ..write(jsonString) //is response which will return server to client.
      ..close();
    return;
  }

  // get value sequenceofnumber from queryParamater'
  final prefix = queryParams['sequenceOfNumbers'];
  //number contain return value from function missing digit
  number = missing_digits(prefix).toString();
    final jsonString = jsonEncode(data); //encode data from map to json
    request.response
      ..statusCode = HttpStatus.ok //response status code from request
      ..write(jsonString) //is response which will return server to client.
      ..close();
  // }
}
void handleGetOther(HttpRequest request) {
  request.response
    ..statusCode = HttpStatus.badRequest //response status code from request
    ..close();
}

var myStringStorage = 'Hello from a Dart server';

/// POST requests
Future<void> handlePost(HttpRequest request) async {
  myStringStorage = await utf8.decoder.bind(request).join();
  request.response
    ..write('Got it. Thanks.')
    ..close();
}

/// Other HTTP method requests
void handleDefault(HttpRequest request) {
  request.response
    ..statusCode = HttpStatus.methodNotAllowed
    ..write('Unsupported request: ${request.method}.')
    ..close();
}
