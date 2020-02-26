import 'package:dio/dio.dart';
import 'package:ice_cream/models/debtor_list.dart';

class DebtorRepository {
  Dio dio = new Dio();
  var head = {
    "Authorization":
        "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEiLCJqdGkiOiI2MTYyNDEzZjlhZjk0YmFhOWYwMDRkZjZkY2E3MWEyYiIsImVtYWlsIjoiMSIsIm5iZiI6MTU4MjQ5ODEyMSwiZXhwIjoxNTg3Njk4MTIxLCJpYXQiOjE1ODI0OTgxMjEsImlzcyI6IkV4ZW1wbG9Jc3N1ZXIiLCJhdWQiOiJFeGVtcGxvQXVkaWVuY2UifQ.epyNmD1LBFYmoSoRyPWhr24iB8nvd0Dmvn_uGoIlwvx9zkYV72NZg9kPUAgMOHG3AH8Yr6uH4BFmoUAIK_9PgBmKGj_xxnO0Nqgd-IZupJwJFXr5X8TDiDmP8OWaM0U83EAKgsBiVac5P59qL5tBchJ1Nrp6w3re4JmMFDjacOic6HynzyLZ4azHhW5MTSXlgNyUO4Nq0j3O1FIfzsYsBTWIW6zETZwD0ZLt5cyTYAx6ryEF_YoaeibLBfSYMfcthp_d6ZLG_IEsht5a61mSwi-ys1C1-Iic45Sal-do_U_t30YzfcWtRKkpbR_wwsG6f0VLO2Uu-EaYqddDzs6XkA"
  };

  Future<DebtorList> getDataDebtorsFromApiAsync() async {
    Response response = await dio.get(
        'http://ec2-3-18-112-31.us-east-2.compute.amazonaws.com/icescream/api/UserDebtor/GetPending',
        options: Options(headers: head));
    print(response.data);
  }
}
