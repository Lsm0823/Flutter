// list_page.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_http_1/post/controller/post_table_controller.dart';
import 'package:flutter_http_1/post/model/dto/post_dto.dart';
import 'package:flutter_http_1/post/model/repositroy/post_repository.dart';
import 'package:flutter_http_1/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 더미데이터
    // PostDTOTable postDTOTable = PostDTOTable(userId: 0, id: 0, title: "테스트 제목");

    // 실제 데이터
    // 통신은 실패할 수 있다 = nullable
    // final listState = useState<List<PostDTOTable>?>(null);
    final controller = context.watch<PostTableController>();
    // final jsonState = useState<String?>(null);

    // useEffect(작동함수, 관찰할 상태 리스트);
    // 빌드가 완료되면 작동한다
    // 관찰하는 상태가 변경되면 작동한다
    // 관찰하는 상태가 없으면 빌드 시 1번 작동한다.
    useEffect(() {
      // String url = "https://jsonplaceholder.typicode.com/posts";
      // http.get(Uri.parse(url)).then((response) {
      //   // 정상적으로 받아왔는지 체크
      //   // 200은 정상 응답
      //   if (response.statusCode == 200) {
      //     listState.value = PostDTOTable.fromJsonList(jsonDecode(response.body));
      //   }
      // });
      // PostRepository.instance.getDTOList().then((value) {
      //   listState.value = value;
      // });
      controller.setPostDTOTableList();
    }, []);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: controller.postDTOTableList
                  ?.map((e) => ListItem(postDTOTable: e))
                  .toList() ??
              [],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  PostDTOTable postDTOTable;

  ListItem({Key? key, required this.postDTOTable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.detail, params: {"postId" : postDTOTable.id.toString()});
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration:
            BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
        child: Column(
          children: [
            Text("유저 번호 ; ${postDTOTable.userId}"),
            Divider(),
            Text("글 번호 ; ${postDTOTable.id}"),
            Divider(),
            Text("글 제목 ; ${postDTOTable.title}"),
            Divider(),
          ],
        ),
      ),
    );
  }
}
