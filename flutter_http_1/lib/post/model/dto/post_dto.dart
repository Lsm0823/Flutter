// post_dto.dart

// 클래스 생성

//

// 테이블 용 클래스
import 'package:flutter/foundation.dart';

class PostDTOTable {
  int userId; // 유저 번호
  int id; // 글 번호
  String title; //제목

  PostDTOTable({required this.userId, required this.id, required this.title});

  // 팩토리
  // 생성자를 통해서 객체를 만들려고 하는데
  // 처리가 번거러운 경우
  // 어떠한 타입을 받아서 클래스(보통 dto파일) 내부에서 객체를 생성해서
  // 리턴 해주기 위함
  // 모양은 화살표 함수랑 비슷 but 기능과 역할은 다르다
  factory PostDTOTable.fromJson(dynamic json) =>
      PostDTOTable(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  // 팩토리를 이용한 함수
  static List<PostDTOTable> fromJsonList(List jsonList) {
    return jsonList.map((json) => PostDTOTable.fromJson(json)).toList();
  }
}

// 상세 페이지 용
class PostDTODetail{
  int userId; // 유저 번호
  int id; // 글 번호
  String title; //제목
  String body; // 내용

  PostDTODetail({
  required this.userId,
  required this.id,
  required this.title,
  required this.body});

  factory PostDTODetail.fromJson(dynamic json) =>
      PostDTODetail(
          userId: json["userId"],
          id: json["id"],
          title: json["title"],
          body: json["body"]);

}

