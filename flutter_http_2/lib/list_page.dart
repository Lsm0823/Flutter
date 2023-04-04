import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_http_2/post_dto.dart';
import 'package:http/http.dart' as http;

class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final listState = useState<List<PostDTOTable>?> (null);

    useEffect((){
      String url = "https://jsonplaceholder.typicode.com/users";
      http.get(Uri.parse(url)).then((response){
        if(response.statusCode == 200){
          dynamic decodeBody = jsonDecode(response.body);

          List jsonList = decodeBody as List;

          listState.value = jsonList.map((data){
            return PostDTOTable(
                id: data["id"],
                name: data["name"],
                email: data["email"]);
          }).toList();
        }
      });
  },[]);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: listState.value?.map((e) => ListItem(postDTOTable: e)).toList() ??[],
        ),
      ),
    );
  }
}


class ListItem extends StatelessWidget {

  PostDTOTable postDTOTable ;

  ListItem({Key? key, required this.postDTOTable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
      child: Column(
        children: [
          Text("유저번호 : ${postDTOTable.id}"),
          Divider(),
          Text("이름 : ${postDTOTable.name}"),
          Divider(),
          Text("이메일 : ${postDTOTable.email}")

        ],
      ),

    );
  }
}

