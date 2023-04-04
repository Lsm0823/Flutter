import 'package:flutter/material.dart';
import 'package:flutter_hrd_page/check/controller/check_controller.dart';
import 'package:provider/provider.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // watch : 상태를 계속 관찰 하겠다. (데이터가 바뀌는 것을 관할 할 수 있다.), (context.read + 관찰)
    
    final checkController = context.read<CheckController>();
//   read-> 상태를 한번만 확인하겠다.
//   상태가 바뀌어도 화면에 영향을 끼치지 못함, 상태를 변화 시키는 함수는 사용가능 
//  final checkController = context.watch<CheckController>();


    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("체크페이지"),
              ElevatedButton(
                  onPressed:(){
                    checkController.change();
                  },
                child: Text("값 변경"),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
