// 화면을 만들면 가장 먼저 할 것.
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hrd_page/check/controller/check_controller.dart';
import 'package:flutter_hrd_page/check/view/check_page.dart';
import 'package:flutter_hrd_page/default/widgets/default_first_item.dart';
import 'package:flutter_hrd_page/default/widgets/default_second_item.dart';
import 'package:provider/provider.dart';

// HookWidget은 페이지 내부의 상태를 관리화기 위해
// 사용할 수 있는 Hook은
// useState
// serEffect 등이 있다.
// Hook은 build 함수 안에 적는다.

class DefaultPage extends HookWidget {
   DefaultPage({Key? key}) : super(key: key);

  //const 때문에 클래스 단위에서 생성 금지
   // 한 페이지 내에서 화면 전환 방법 (지역)
  // List widgetItems = [
  //   Container(color: Colors.yellow,),
  //   Container(color: Colors.blue,),
  // ];
   
  // 위젯 객체를 만드는 함수를 생성, 메모리 생성 용량 감소
   // SafeArea에 value뒤에 () 붙히기
  //  List widgetItems = [
  //    (color) => Container(color: Colors.yellow,),
  //    () => Container(color: Colors.blue,),
  //  ];

   // 다른 파일에서 페이지 전환 (전역)



   @override
  Widget build(BuildContext context) {
     final checkController = context.watch<CheckController>();

     List widgetItems = [
           () => DefaultFirstItem(checkController.isChecked),

           () => DefaultSecondItem(),
     ];

     final navlndex = useState(0);

    print("DefaultPage 빌드됨" + navlndex.value.toString());

    //페이지 내에서 변화
    // 빌드에 List를 만들면 빌드변화때만 실행
    // List widgetItems = [
    //
    // ];

    return Scaffold(
      appBar: AppBar(

        // title: Text("나의 정보"),

        // 타이틀 중간 정렬 두가지 방법 (서로 위치 다름),
        // title: Center(child: Text("나의 정보"))는 다른 글자가 들어와도 중간
        title: Center(child: Text("나의 정보")),


        // 다른글자가 들어오면 글자의 공간만큼 밀려남
        // title : Text("가운데정렬"),
        // centerTitle: true,

        actions: [
          // all 은 모든 방향 패딩 only는 한쪽 방향만 설정할 때
          InkWell(
            onTap: (){
              Navigator.push(

                  context, MaterialPageRoute(builder: (context)=>CheckPage()));
            },
            child: Padding(padding: const EdgeInsets.only(right: 30),
             child : Icon(Icons.move_to_inbox),
            ),
          ),
      ],

      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int idx){
          // 버튼 선택시 생성되는 idx를 넣음
          navlndex.value = idx;
        },
        currentIndex: navlndex.value,
        // Items에는 2개 이상의 네비게이션바가 있어야 함
        items: [
          // label과 icon이 필수
          BottomNavigationBarItem(
              label: "home",
              icon: Icon(Icons.access_alarm_outlined)),
          BottomNavigationBarItem(
              label: "myinfo",
              icon: Icon(Icons.cable)),
        ],
      ),
      body: SafeArea(
        // child: Container(color: Colors.green),
        // 빌드될때 마다 화면 전환
        child: widgetItems[navlndex.value](),
      ),
    );
  }
}


