import 'dart:convert';

import 'package:http/http.dart' as http;

import 'attr_dto.dart';

class AttrRepository{
  // 싱클톤 : static 입력하면 싱글톤
  static Future<List<AttrDTO>?> getDTO() async{
    final String url = "https://apis.data.go.kr/6260000/AttractionService/getAttractionKr?serviceKey=L4O6Jd5locofQV0Sa674EwMQ4GyHi380DNlzkWVMQLw8O2LvzNMvBKe1RxTj4jssgmQKPrDvinJFtSOIs9KmbA%3D%3D&pageNo=1&numOfRows=10&resultType=json";
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      dynamic json = jsonDecode(response.body);
      return AttrDTO.fromJsonList(json["getAttractionKr"]["item"]);
    }else{
      return null;
    }
  }
}