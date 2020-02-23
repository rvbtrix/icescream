import 'package:dio/dio.dart';
import 'package:ice_cream/api/model/debtor_model.dart';

class DebtorApi {
  Dio dio = new Dio();
 var head = {"Authorization": "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjAiLCJqdGkiOiI1YTJhMDI1ZDY3YzY0MmQyOTdhMGFjMTMzMjE4Zjk5NyIsImVtYWlsIjoiMCIsIm5iZiI6MTU4MjE1OTcxMCwiZXhwIjoxNTgyMTYwOTEwLCJpYXQiOjE1ODIxNTk3MTAsImlzcyI6IkV4ZW1wbG9Jc3N1ZXIiLCJhdWQiOiJFeGVtcGxvQXVkaWVuY2UifQ.UEswbT0Xt6m9czE4HrIi9ynhX8DA8zxz2ISP0pKpZssu2NYQX69hc0CWNtutpjEz4tr2gZm44_Gfi4MjoefbpM7wQpwPPkWsG5vJRrJ7EYNymTa6oXYGGUidfJAthN643-kKtvj_RtCo0YtYS3xTdCVydJa_1_W8eSU3VwsinaSR76ssIjp_Z2m0tRMtji7IsAJt0vYIc29BQ_D2KqR5le3UdxUmQkLj6W7zbhxzRvspzq9aHVx0hkIgEjGAMrHUjqWjH6uOaZs9Z_LKPJKSNxazWqHTQ5QH7epVPM-aoRvn3EtctOmZszM87nZPcsGsZp417v8LRNwRPwkw_f4Ssw"};

  Future<List<Debtor>> getDataDebtorsFromApiAsync() async {
    Response response = await dio.get(
        'http://ec2-3-18-112-31.us-east-2.compute.amazonaws.com/icescream/api/UserDebtor/GetPending',options: Options(headers: head));
        print(response.data);
  }
}
