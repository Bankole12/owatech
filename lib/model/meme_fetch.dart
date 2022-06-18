import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:owatech_test/model/home_card_model.dart';

//Fetching data from api class
class FetchActualData implements MemeReposiry{
  String dataurl = 'yoururl';
  @override
  Future<List<HomeCardModel>> fetchMemes() async{
    http.Response response = await http.get(Uri.parse(dataurl));
    final List responseBody = jsonDecode(response.body);
    final statusCode = response.statusCode;
    if(statusCode != 200 || responseBody == null){
      throw FetchDataException("An error occured : Status code $statusCode");
    }

    return responseBody.map((e) => HomeCardModel.fromMap(e)).toList();
  }

}