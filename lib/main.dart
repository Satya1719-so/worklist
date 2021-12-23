import 'package:flutter/material.dart';
void main(){
  runApp(
    MaterialApp(
      title: "new work",
      home: Favorite(),)

  );
}
class Favorite extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FavoriteState();
  }

}
class _FavoriteState extends State<Favorite>{
  String nameCity = "";
  var _currencies = ['Rupees','Dollar','pounds','other'];
  var _currentItemSelected ='Rupees';
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("new worklist"),
       ),
       body: Container(
         margin: EdgeInsets.all(20.0),
         child: Column(
           children:<Widget>[
             TextField(
               onChanged: (String userInput){
                 setState(() {
                   nameCity=userInput;
                 });
                
               },
             ),
             DropdownButton<String>(
               items: _currencies.map((String dropDownStringItem){
               return DropdownMenuItem<String>(
                 value:dropDownStringItem,
                 child:Text(dropDownStringItem),

               );
             }).toList(),
             onChanged: (String? newValue){
               _onDropdown(newValue!);
               
             },
             value: _currentItemSelected,
             ),
             Padding(
               padding: EdgeInsets.all(30.0),
               child: Text("your city $nameCity",
             style: TextStyle(fontSize: 20),
             ))
           ],
         ),),
   );
  }
  void _onDropdown(String newValue) {
    setState(() {
                 this. _currentItemSelected = newValue;
               });
  }
}