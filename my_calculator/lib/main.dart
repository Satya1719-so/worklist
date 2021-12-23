import 'package:flutter/material.dart';




void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "simple interest Calculator",
  home: SIForm(),
  theme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.indigo,
    accentColor: Colors.indigoAccent
  ),
  ));
}
class SIForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _SIFormState();
  }
}
class _SIFormState extends State<SIForm>{
  var _formkey = GlobalKey<FormState>();
  get asssetmage => null;
  var _currencies =['Rupees','Dollar','Pounds'];
  final double _minimumPadding =5.0;
  var _currentItemSelected ='';

  void initState(){
    super.initState();
     _currentItemSelected =_currencies[0];

  }
  TextEditingController principalController = TextEditingController();
  TextEditingController roicontroller =TextEditingController();
  TextEditingController termcontroller =TextEditingController();
  var display ="";


  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    TextStyle? textStyle= Theme.of(context).textTheme.title;
    return Scaffold(
      resizeToAvoidBottomInset:false,
      appBar: AppBar(
        title: Text("Simple intrest "),
      ),
      body: Form(
        key: _formkey,
        child:Padding(
          padding: EdgeInsets.all(_minimumPadding*2),
        child: ListView(children:<Widget> [
          getImageAsset(),
          Padding(
            padding: EdgeInsets.only(top:_minimumPadding,bottom: _minimumPadding ),
          child:TextFormField(
            keyboardType: TextInputType.number,
            style: textStyle,
            controller: principalController,
            validator: (String? value){
              if (value!.isEmpty){
                return 'please enter principal amount';
              }
            },
            decoration: InputDecoration(
              labelText: "principal",
            hintText: "Enter principal",
            labelStyle: textStyle,
            errorStyle: TextStyle(
              color: Colors.yellowAccent,
              fontSize: 15.0

            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)
            )
            ),
          )),
          Padding(
            padding: EdgeInsets.only(top:_minimumPadding,bottom: _minimumPadding ),
           child:TextFormField(
            keyboardType: TextInputType.number,
            style: textStyle,
            controller: roicontroller,
            validator: (String? value){
              if (value!. isEmpty){
                return 'please enter rate of interest';
              }
            },
            decoration: InputDecoration(labelText: "Rate of interest",
            hintText: "Enter interest rate",
            labelStyle: textStyle,
            errorStyle: TextStyle(
              color: Colors.greenAccent,
              fontSize: 15.0
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)
            )
            ),
          )),
         Padding(
           padding: EdgeInsets.only(top: _minimumPadding,bottom:_minimumPadding),
           child: Row(children:<Widget> [
            Expanded(child: TextFormField(
            keyboardType: TextInputType.number,
            style: textStyle,
            controller: termcontroller,
             validator: (String? value){
              if (value!. isEmpty){
                return 'please enter time';
              }
            },
            decoration: InputDecoration(labelText: "Terms",
            hintText: "Time in year",
            labelStyle: textStyle,
             errorStyle: TextStyle(
              color: Colors.yellowAccent,
              fontSize: 15.0
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)
            )
            ),
          )),
          Container(width: _minimumPadding * 5,),
          Expanded(child: DropdownButton<String>(items: _currencies.map((String value){
            return DropdownMenuItem<String>(value: value,
            child: Text(value),);
          }
          ).toList(),
          value: _currentItemSelected,
          onChanged: (String? newValue){
            _onDropDownItemSelected(newValue);

          },
          ))
          ],
          )),
          Padding(
            padding: EdgeInsets.only(bottom: _minimumPadding, top: _minimumPadding),
            child: Row(children: <Widget>[
            Expanded(child: ElevatedButton(
              child: Text('calculate',textScaleFactor: 1.5,),
              onPressed: (){
                
                setState(() {
                   if(_formkey.currentState!.validate()){
                  this.display=_calculateReturn();
                   }
                });

              },
            )
            ),
             Container(width: _minimumPadding * 5,),
            Expanded(
              child: ElevatedButton(
              
              child: Text('Reset',style: textStyle),
              onPressed: (){
                setState(() {
                  _reset();
                });

              },
            )
            )

          ],
          )),
          Padding(padding: EdgeInsets.all(_minimumPadding*2),
          child: Text(this.display,textScaleFactor: 1.5,),
          )


        ],
        )),
        ),
    );
  }
Widget getImageAsset(){
  AssetImage assetimage = AssetImage('images/download.jpg');
  Image image =Image(image: assetimage, width:125.0,height: 125.0,);
  return Container(child:image,margin: EdgeInsets.all(50.0),);
}
void _onDropDownItemSelected(String? newValue){
  setState(() {
    this._currentItemSelected=newValue!;
  });
}
String _calculateReturn(){
  
  double principal = double.parse(principalController.text);
  double roi = double.parse(principalController.text);
  double term = double.parse(principalController.text);
  double total = principal+(principal*roi*term)/100;
  String result ='after $term years, your investment will be worth $total $_currentItemSelected';
  return result;

}
void _reset(){
  principalController.text='';
  roicontroller.text='';
  termcontroller.text='';
  display ='';
  _currentItemSelected =_currencies[0];
}
}



