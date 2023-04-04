// 위젯을 가져오는 import
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_hrd_page/default/view/default_page.dart';
import 'package:provider/provider.dart';

import 'check/controller/check_controller.dart';

void main(){
   runApp(
     // MultiProvider는 전역적으로 사용하기 위해 사용
     MultiProvider(
       providers: [
         ChangeNotifierProvider(create: (context) => CheckController()),
       ],
       child: MyApp(),
     ),
   );
}

// stl
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("메인 빌드됨");
    return MaterialApp(
      //default_page.dart파일에서 DefaultPage() 클래스 가져오기 , import 자동생성
      home: DefaultPage(),
    );
  }
}
