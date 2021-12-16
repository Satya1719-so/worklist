import 'dart:developer';

import 'package:flutter/material.dart';

import 'app_screens/home.dart';

void main(){
  runApp(MaterialApp(
    title: "exploring",
    home:Scaffold(
      appBar: AppBar(title: Text("wellcome"),),
      body: getListview(),
      floatingActionButton: FloatingActionButton(onPressed:() {
        debugPrint("FAB clicked");
      },
      child: Icon(Icons.add),
      tooltip: 'add new list',),
      ) ,
  ));
}
void showSnackBar(BuildContext context, String item){
  var snackBar = SnackBar(content: Text(" you clicked $item"),
  action: SnackBarAction(label: "undo",
  onPressed: (){
    debugPrint("perform");
  },),
  );
  // ignore: deprecated_member_use
  Scaffold.of(context).showSnackBar(snackBar);
}
  List<String>getListElement(){
    var items =List<String>.generate(1000, (counter) => "Item $counter");
    return items;
  
}
Widget getListview(){
  var listItems=getListElement();
  var listview= ListView.builder(itemBuilder:(context,index){
    return ListTile(
      leading: Icon(Icons.arrow_right),
    title: Text(listItems[index]),
    onTap: (){
      showSnackBar(context,listItems[index]);
    },
    );
  }
  );
  return listview;
  }
