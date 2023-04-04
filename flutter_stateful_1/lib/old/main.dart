import 'dart:math';

import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  Parent(),
    );
  }
}

class Parent extends StatefulWidget {
  const Parent({Key? key}) : super(key: key);

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  //2번 자식한테 줄 변수
  int count = 0;
  
  //1번 자식한테 줄 함수
  void setCount(int newCount){
    // state 변경하기 위해 사용
    setState(() {
      count = newCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Child1(callback: setCount),
        Child2(count: count),
      ],
    );
  }
}

//자식 1
class Child1 extends StatelessWidget {

  final Function callback;

  const Child1({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          //함수 넣을 공간
          callback(Random().nextInt(100));
        },
        child: const Text("난수 생성"));
  }
}
// 자식 2
class Child2 extends StatelessWidget {

  final int count;

  const Child2({Key? key, required this.count}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Text(count.toString());
  }
}



