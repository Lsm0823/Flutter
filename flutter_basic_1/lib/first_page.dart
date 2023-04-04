import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //통신을 받는다
    //통신 데이이터 -> Json String
    // 통신에서 받아온 데이터를 파싱했다고 가정
    List<String> strList = ["첫번째", "두번째"];



    // 해당 데이터를 위젯으로 바꿔서 칠드런에 넣고 싶다.
    // 방법 1. 직접 리스트를 만든다.
    // List<Widget> widgetList =[
    //   Text("첫번째"),
    //   Text("두번째")
    // ];


    // 방법 2.
    // 요소의 타입을 String에서 Widget으로 바꿀 함수 = change
    final change = (String str){
      // String을 받아서 Text에 String을 담아 리턴
      return Text(str);
    };
    // List<Widget> widgetList = [
    //   change("첫번째"),
    //   change("두번째"),
    // ];

    // 방법 3.

    // list메소드 map은 리스트의 요소를 다른 타입으로 변경할 수 있다
    // map이 요소 각각을 change함수를 사용해서 Widget으로 변경
    // 리스트로 다시 만들어줌
    // 리트스로 다시 만들어줌 = toList(), map은 함수 필요 = chang

    List<Widget> widgetList = strList.map(change).toList();


    // map은 이터러블로 변환되어 있기 때문에 list로 다시 변경
    // java에서는 1급객체가 class이므로 class만 다른곳에서 사용할수 있지만
    // dart에서는 1급객체가 변수, 클래스 등 모든것이 1급객체이므로 다른곳에서 모두 사용가능
    // List<Widget> widgetList = strList.map(change).toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          //children은 위젯 리스트를 받는다
          children: widgetList,
        ),
      ),
    );
  }
}