
import 'dart:convert';

import 'package:flutter_http_1/post/model/dto/post_dto.dart';
import 'package:http/http.dart' as http;

class PostRepository{
  //싱클톤 - 해당 타입의 객체가 프로그램에서 단 1개
  // 스태틱 변수 선언
  static PostRepository? _instance;
  
  // public 생성자 제거
  // dart에서 private는 맨 앞에 _(언더바)사용
  // public생성자가 아닌 private생성자 생성
  PostRepository._();

  // ??이면 항상 새로운 객체가 생성
  // ??=을 붙혀 PostRepository._()가 생성되면서 instance에 들어가고
  // 다음 호출부터는 PostRepository._() 사용하지 않는다.
  static PostRepository get instance => _instance ??= PostRepository._();

// 변수 ?? 대체값
  // -> 변수가 null일 경우 대체값을 리턴한다.
  // String str = null일수도 있는 String ?? "값이 없습니다."
  // String str = "값이 없습니다"

  // 변수 ??= 대입값
  // -> 변수가 null일 경우 변수에 대입값을 넣고 리턴한다.
  // String str = [null일수도 있는 String] ??= "값이 없습니다"
  // STring str = ["값이 없습니다"라는 값이 들어간 null일수도 있는 String]

  // 통신은 실패할 수 있다 == nullable -> 변수 뒤에 ?
  Future<List<PostDTOTable>?> getDTOList() async{

    String url = "https://jsonplaceholder.typicode.com/posts";

    http.Response response = await http.get(Uri.parse(url)) ;
      // 정상적으로 받아왔는지 체크
      // 200은 정상 응답
      if (response.statusCode == 200) {
        return PostDTOTable.fromJsonList(jsonDecode(response.body));
      } else{
        // 통신에 실패 했을 때
        return null;
      }
  }

  Future<PostDTODetail?> getDTO(int postId) async{
    String url = "https://jsonplaceholder.typicode.com/posts/$postId";
    http.Response response = await http.get(Uri.parse(url)) ;
    if (response.statusCode == 200) {
      return PostDTODetail.fromJson(jsonDecode(response.body));
    } else{
      // 통신에 실패 했을 때
      return null;
    }
  }
}

// void main(){
//   PostRepository.instance;
//   PostRepository.instance;
//   PostRepository.instance;
// }
