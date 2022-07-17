import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_app/model/data_model.dart';
class DataServices{
  String baseUrl = "http://mark.bslmeiyu.com";
  String api = "/api";
  String getPlace = "/getplaces";

  Future<List<DataModel>> getInfo() async{
    http.Response response = await http.get(Uri.parse(baseUrl+api+getPlace));
    try{
      if(response.statusCode == 200){
        List<dynamic> list = json.decode(response.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }else {
        return <DataModel>[];
      }

    }catch(e){
      print(e);

    }
    return <DataModel>[];
  }

}