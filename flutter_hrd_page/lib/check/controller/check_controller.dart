import 'package:flutter/material.dart';


// 여러 페이지에서 사용하기 위해 따로 파일 분리

class CheckController extends ChangeNotifier{
  // bool의 변수는 보통 is변수 사용
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  //값을 바꿔주는 함수
  void change(){
    // !는 NOT이랑 같음
    _isChecked = !_isChecked;

    // 값을 바꿨는지 알려주는것 (필수)
    notifyListeners();

  }
}