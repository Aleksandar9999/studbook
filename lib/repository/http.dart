import 'dart:convert';
import "package:http/http.dart" as http;

class RequestResult {
  bool ok;
  dynamic data;
  RequestResult({this.ok, this.data});
}

const PROTOCOL = "http";
const DOMAIN = "192.168.0.14:8080";

Future<RequestResult> http_get(String route) async {
  var url = "$PROTOCOL://$DOMAIN/$route";
  print(url);
  var res = await http.get(url);
  print(res);
  String jsonRec = res.body.substring(11, res.body.length - 1);
  return RequestResult(ok: true, data: json.decode(res.body)['results']);
}

Future<RequestResult> http_post(String route, [dynamic data]) async {
  var url = "$PROTOCOL://$DOMAIN/$route";
  print(url);
  var datas = jsonEncode(data);
  print(datas);
  var res = await http.post(url, body: datas, headers: {
    "Content-Type": "application/json",
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    "Access-Control-Allow-Credentials":
        "true", // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS"
  });
  return RequestResult(ok: true, data: jsonDecode(res.body));
}
