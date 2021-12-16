import 'package:flutter/material.dart';
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Center(
     child:Container(
       padding: EdgeInsets.only(left:10.0,top: 40.0),
     alignment: Alignment.center,
     color: Colors.deepPurple,
   
     child:Column(
       children:<Widget>[Row(children:<Widget> [
      
      Expanded(child: Text("Flight",textDirection: TextDirection.ltr,
     style: TextStyle(
       decoration: TextDecoration.none,
       fontSize: 35.0,
       fontFamily: 'Raleway',
       fontWeight: FontWeight.w700,
       color: Colors.white
     )
     ),
     ),
    Expanded(child:  Text("Flight from mumbai to goa ",textDirection: TextDirection.ltr,
     style: TextStyle(
       decoration: TextDecoration.none,
       fontSize: 75.0,
       fontFamily: 'Raleway',
       fontWeight: FontWeight.w700,
       color: Colors.white
     ),
     )
     ),
     

       ],
       ),
       Row(children:<Widget> [
      
      Expanded(child: Text("Flight",textDirection: TextDirection.ltr,
     style: TextStyle(
       decoration: TextDecoration.none,
       fontSize: 35.0,
       fontFamily: 'Raleway',
       fontWeight: FontWeight.w700,
       color: Colors.white
     )
     ),
     ),
    Expanded(child:  Text("Flight from mumbai to goa ",textDirection: TextDirection.ltr,
     style: TextStyle(
       decoration: TextDecoration.none,
       fontSize: 75.0,
       fontFamily: 'Raleway',
       fontWeight: FontWeight.w700,
       color: Colors.white
     ),
     )
     ),
     

       ],
       ),
       FlightImage(),
       FlightButton()

     ],
    
      
   )
   ));
   
  }

}
class FlightImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage=AssetImage('images/satya.jpg');
    Image image = Image(image: assetImage,width: 250.0,height: 250.0,);
    return Container(child: image,);

  }

}
class FlightButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0,top: 40.0),
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Text("Booked",
        style: TextStyle(fontSize: 16.0,
        color: Colors.white,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.w700),
        ),
        
      
        onPressed: ()=> bookFlight(context)

        ),
    );
  }
  void bookFlight(BuildContext context){
    var alertDialog =AlertDialog(
      title: Text("Flight Booked Sucessfully"),
      content: Text("have aplesant flight"),
    );
    showDialog(context: context,builder:(BuildContext context)=> alertDialog
    );
  }
}