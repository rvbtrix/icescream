import 'dart:convert';

import 'package:dart_ice_cream/consts/consts_api.dart';
import 'package:dart_ice_cream/models/login.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'icecreamapi_store.g.dart';

class IceCreamApiStore = _IceCreamApiStoreBase with _$IceCreamApiStore;

abstract class _IceCreamApiStoreBase with Store {
  @observable
  Login login;

  @action
  fetchLogin() {
    login = null;
    loginRequest().then((data) {
      login = data;
    });
  }

  Future<Login> loginRequest() async {
    try {
      final response = await http.post(ConstsAPI.iceCreamURL + 'Login',
          headers: {
            "Content-Type": "application/json"
          },
          body: {
            "Email": "reginaldo.botelho@dartdigital.com.br",
            "senha": "!@#123abc"
          });
      var decodeJson = jsonDecode(response.body);
      return Login.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro no login" + stacktrace.toString());
      return null;
    }
  }
}
