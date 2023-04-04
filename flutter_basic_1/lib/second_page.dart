import 'package:flutter/material.dart';

// 받아온 데이터를 필터링해서 변경
// 1. 필터링(where) / 2. 변경(map)
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 받아온 데이터
    List<String> strList = ["apple","google", "naver"];

    // String을 받아 a가 들어있는지 확인하는 함수 -> 있으면 true 없으면 false
    final filter = (String str){
      return str.contains('a');
    };
    
    //String을 Widget으로 변경하는 함수
    // 같은 Widget를 리스트로 사용해서 출력할 경우
    // key를 넣어 줘야 한다.
    // Text위젯이 여러개 있을 경우 특정위젯을 바꾸기 위해 key값이 필요
    // 같은 위젯 List의 요소에 번호를 붙여줌, 위젯들의 구분을 위해 key사용
    final change = (String str){
      // String을 받아서 Text에 String을 담아 리턴
      return Text(str,key: UniqueKey(),);
    };

    // a라는 글자가 들어간 str만 필터링 하고 싶음
    // filter함수를 통해 a있는지 확인
    // map함수를 통해 타입변경
    // toList로 list타입으로 변경
    List<Widget> widgetList = strList.where(filter).map(change).toList();
    // Text위젯 리스트로 만들고 싶음

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: widgetList
        ),
      ),
    );
  }
}
