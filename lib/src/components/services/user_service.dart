import 'package:http/http.dart' as http;

class UserService {
  Future<String> getDataUser(String url) async {
    final uri = Uri.parse(url);

    final response = await http.get(uri);
    await Future.delayed(const Duration(seconds: 3));
    return response.body;
  }
}
