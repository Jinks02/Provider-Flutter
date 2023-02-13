import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class AuthProvider with ChangeNotifier{

  bool _loading = false;
  bool get getLoading => _loading;

  void setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  void login (String email, String password) async {

    setLoading(true);
    try{
      http.Response response = await http.post(Uri.parse('https://reqres.in/api/login'),
      body: {
        'email' : email,
        'password' : password
      }
      );
      if(response.statusCode == 200){
        setLoading(false);
        debugPrint('success');
      }
      else{
        setLoading(false);
        debugPrint('failed');
      }
    }
    catch(e){
      setLoading(false);
      debugPrint(e.toString(),);
    }
  }

}