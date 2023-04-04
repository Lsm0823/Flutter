// detail_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_http_1/post/model/dto/post_dto.dart';
import 'package:flutter_http_1/post/model/repositroy/post_repository.dart';

class DetailPage extends HookWidget {
  final int postId;

  const DetailPage({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final datailState = useState<PostDTODetail?>(null);

    useEffect((){
      PostRepository.instance.getDTO(postId).then((value){
        datailState.value = value;
      });
    },[]);

    // 3항 연산자 - state가 null이 아니면 / null 이면
    // data != null ? a : b


    return Scaffold(
      body: SafeArea(
        child: datailState.value != null ? Column(
          children: [
            // value! : 절대 null이 아님 -> 위에서 null체크 했음
            Text("유저번호 : ${datailState.value!.userId}"),
            Text("글번호 : ${datailState.value!.id}"),
            Text("제목 : ${datailState.value!.title}"),
            Text("내용 : ${datailState.value!.body}"),
          ],
        ) : Text("값이 없습니다."),
      ),
    );
  }
}