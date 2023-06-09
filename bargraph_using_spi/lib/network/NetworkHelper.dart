import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<http.Response> get(String endpoint) async {
    var url = Uri.parse(endpoint);
    var response = await http.get(url);
    return response;
  }
}

class APIConstants
{
  static const String Base_url = "https://api.genderize.io/?name[]=venkat&name[]=ram&name[]=yash&name[]=kavya&name[]=pavan" ;
}
