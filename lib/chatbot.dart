// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:new_geolocation/geolocation.dart';
// import 'package:geocoder/geocoder.dart';
// import 'dart:async';
// import 'dart:math';
// import 'package:latlong/latlong.dart';
// import './flutter_screenutil.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';
// import './prod_details.dart';
// import 'package:keyboard_visibility/keyboard_visibility.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// class Chat extends StatefulWidget {
//   String userid;
//   Chat(this.userid);
//   @override
//   _ChatState createState() => _ChatState(userid);
// }

// class _ChatState extends State<Chat> {
//   String userid;
//   _ChatState(this.userid);
//   int triggerJollibee=0;
 
//   double price;
//   String description;
//   String tags;
//   List companyId=[];
//   List descriptions;
//   List prices;
//   List tags1;
//  int counterResult=0;
//   final TextEditingController _textEditingController=new TextEditingController();
//   bool _isWriting=false;
//   List textMessage=["Hi Jervin,what are you looking for today?"];
//   List<bool> counterBoolean=[false];
//   List id=[];
//   List details=[];
//   List tagsThrow=[];
//   List branch=[];
//   List serviceName=[];
//   List branchName=[];
//   TextEditingController _message=new TextEditingController();
//      final ScrollController controller = ScrollController();
//   final Distance distance = new Distance();
  
//     bool heightFlex=false;
//   @protected
  
//   @override
//   int x=0;
//   String addressit;
//   LocationResult locations = null; 
//   StreamSubscription<LocationResult> streamSubscription;
//   bool trackLocation = false;
//   double kilometers;
//   @override
//   @protected
//  initState() {
//     super.initState();
   
//     checkGps();
//     getLocations();
//     trackLocation = false;
//     locations = null;
//   }

//   getLocations()async{

// if(locations==null){

// }
// else{
 
// }
//     if (trackLocation) {
//       setState(() => trackLocation = false);
//       streamSubscription.cancel();
//       streamSubscription = null;
//       locations =null;
     
//     } else {
//       setState(() => trackLocation = true);

//       streamSubscription = Geolocation 
//           .locationUpdates(
//         accuracy: LocationAccuracy.best,
//         displacementFilter: 0.0,
//         inBackground: false,
//       )
//           .listen((result)async {
//         final location = result;

//         setState(() {
//           locations=location;
         
//         });
          
//     // meter = 422591.551
//       });
//       streamSubscription.onDone(() => setState(() {
//             trackLocation = false;
//           }));
//     }
//   }
//   checkGps() async {
  
//     final GeolocationResult result = await Geolocation.isLocationOperational();
//     if (result.isSuccessful) {
//       print("Success");
//     } else {
//       print("Failed");
//     }
//   }
 

// String a="e";
//   void send(){
//     textMessage.add(_message.text);
//         counterBoolean.add(true);
//         _message.text="";
//         id=[];
//       //controller.animateTo(controller.offset + textMessage.length,
//         //curve: Curves.linear, duration: Duration(milliseconds: 500));
//     setState(() async{

        
//          if(textMessage[textMessage.length-1]=="hello"){
//            print(locations.location.longitude);
//         textMessage.add("hi");
//         counterBoolean.add(false);}
//         else if(textMessage[textMessage.length-1]=="ano pangalan mo?"){
//         textMessage.add("i dont know");
//         counterBoolean.add(false);
//         }
//          else if(textMessage[textMessage.length-1]=="nearest cleaning service") {
//            counterResult=0;
//            final coordinates = new Coordinates(locations.location.latitude,locations.location.longitude);
//             var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//            var first = addresses.first;
//             http.Response response=await http.get(Uri.encodeFull("http://filmeapi.azurewebsites.net/api/services/GetAllServicesPerBranch"),headers: {
//         "Accept":"application/json"
//      });
//     var reviewdata=json.decode(response.body);
//     print(reviewdata.length);
//            for(int x=0;x<reviewdata.length;x++){
//              print("${reviewdata[0]['latitude']} eto talaga");
//             String latitude=reviewdata[x]['latitude'];
//             double latitudeConverted=double.parse(latitude);
//             String longitude=reviewdata[x]['longitude'];
//             double longitudeConverted=double.parse(longitude);
//             double km = distance.as(LengthUnit.Kilometer,
//      new LatLng(locations.location.latitude,locations.location.longitude),new LatLng(latitudeConverted,longitudeConverted));
//       print(km);
//      print(km);
    
//      if(km>5.0 && reviewdata[x]['tags'].contains('Cleaning')){
//         counterResult++;
//        print("eto ba");
//        a=reviewdata[x]['serviceName'];
//         id.add("${reviewdata[x]['_id']}");
//         print("$id eto ang id");
//         details.add("${reviewdata[x]['description']}");
//         tagsThrow.add("${reviewdata[x]['tags']}");
//         serviceName.add("${reviewdata[x]['serviceName']}");
//         companyId.add("${reviewdata[x]['companyId']}");
//           branchName.add("${reviewdata[x]['branchName']}");
//         branch.add("${reviewdata[x]['branchId']}");
//         price=reviewdata[x]['price'];
//       print(counterResult);
//       tags1=["awer","awercwaer"];
//       print(id);
     
//      }
//            }
//            if(tags1!=null){
             
//             textMessage.add("Cleaning Service");
//               counterBoolean.add(false);
              
//            }

       

        
//         print("$a eto yun ah");
//         }
//         else if(textMessage[textMessage.length-1].contains('looking for Men\'s shoes')) {
//            counterResult=0;
//            final coordinates = new Coordinates(locations.location.latitude,locations.location.longitude);
//             var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//            var first = addresses.first;
//             http.Response response=await http.get(Uri.encodeFull("http://filmeapi.azurewebsites.net/api/services/GetAllServicesPerBranch"),headers: {
//         "Accept":"application/json"
//      });
//     var reviewdata=json.decode(response.body);
//     print(reviewdata.length);
//            for(int x=0;x<reviewdata.length;x++){
//              print("${reviewdata[0]['latitude']} eto talaga");
//             String latitude=reviewdata[x]['latitude'];
//             double latitudeConverted=double.parse(latitude);
//             String longitude=reviewdata[x]['longitude'];
//             double longitudeConverted=double.parse(longitude);
//             double km = distance.as(LengthUnit.Kilometer,
//      new LatLng(locations.location.latitude,locations.location.longitude),new LatLng(latitudeConverted,longitudeConverted));
//       print(km);
//      print(km);
    
//      if(km<5.0 && reviewdata[x]['tags'].contains('Carwash')){
//         counterResult++;
//        print("eto ba");
//        a=reviewdata[x]['serviceName'];
//         id.add("${reviewdata[x]['_id']}");
//         details.add("${reviewdata[x]['description']}");
//         tagsThrow.add("${reviewdata[x]['tags']}");
//         serviceName.add("${reviewdata[x]['serviceName']}");
//         companyId.add("${reviewdata[x]['companyId']}");
//         branch.add("${reviewdata[x]['companyId']}");
//         price=reviewdata[x]['price'];
//       print(counterResult);
//       tags1=["awer","awercwaer"];
//       print(id);
     
//      }
//            }
//            if(tags1!=null){
             
//             textMessage.add("Carwash");
//               counterBoolean.add(false);
              
//            }

       

        
//         print("$a eto yun ah");
//         }
//         else if(textMessage[textMessage.length-1]=="nearest restaurant") {
//            counterResult=0;
//            final coordinates = new Coordinates(locations.location.latitude,locations.location.longitude);
//             var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//            var first = addresses.first;
//             http.Response response=await http.get(Uri.encodeFull("http://filmeapi.azurewebsites.net/api/services/GetAllServicesPerBranch"),headers: {
//         "Accept":"application/json"
//      });
//     var reviewdata=json.decode(response.body);
//     print(reviewdata.length);
//            for(int x=0;x<reviewdata.length;x++){
//              print("${reviewdata[0]['latitude']} eto talaga");
//             String latitude=reviewdata[x]['latitude'];
//             double latitudeConverted=double.parse(latitude);
//             String longitude=reviewdata[x]['longitude'];
//             double longitudeConverted=double.parse(longitude);
//             double km = distance.as(LengthUnit.Kilometer,
//      new LatLng(locations.location.latitude,locations.location.longitude),new LatLng(latitudeConverted,longitudeConverted));
//       print(km);
//      print(km);
    
//      if(km<5.0 && reviewdata[x]['tags'].contains('Restaurant')){
//         counterResult++;
//        print("eto ba");
//        a=reviewdata[x]['serviceName'];
//         id.add("${reviewdata[x]['_id']}");
//         details.add("${reviewdata[x]['description']}");
//         tagsThrow.add("${reviewdata[x]['tags']}");
//         serviceName.add("${reviewdata[x]['serviceName']}");
//         companyId.add("${reviewdata[x]['companyId']}");
//         branchName.add("${reviewdata[x]['branchName']}");
//         branch.add("${reviewdata[x]['companyId']}");
      
//         price=reviewdata[x]['price'];
//       print(counterResult);
//       tags1=["awer","awercwaer"];
//       print(id);
     
//      }
//            }
//            if(tags1!=null){
             
//             textMessage.add("Restaurant");
//               counterBoolean.add(false);
              
//            }

       

        
//         print("$a eto yun ah");
//         }
//          else if(textMessage[textMessage.length-1]=="my latitude"){
//         textMessage.add("${locations.location.latitude}");
//         counterBoolean.add(false);
//         }
//           else if(textMessage[textMessage.length-1]=="my latitude"){
//         textMessage.add("${locations.location.latitude}");
//         counterBoolean.add(false);
//         }
//         else if(textMessage[textMessage.length-1]=="where is the location?"){
//         textMessage.add("here?");
//         counterBoolean.add(false);
//         }
//         else if(textMessage[textMessage.length-1]=="location?"){
//           textMessage.add("the location is near from jollibee restaraunt at Cavite.");
//         counterBoolean.add(false);
//         }
//         else if(textMessage[textMessage.length-1]=="clear"){
//            textMessage=[];
//         counterBoolean=[];

//         }
//         else if(textMessage[textMessage.length-1].contains('locations')&&textMessage[textMessage.length-1].contains('i')
//         &&textMessage[textMessage.length-1].contains('may')){
//          textMessage.add("these are the locations!");
//         counterBoolean.add(false);
//         }
//         else if(textMessage[textMessage.length-1].contains('i')&&textMessage[textMessage.length-1].contains('use')
//         &&textMessage[textMessage.length-1].contains('may')){
//         textMessage.add("yes ofcourse!");
//         counterBoolean.add(false);
//         }
//         else if(textMessage[textMessage.length-1]=="may I?"){
//         textMessage.add("may i what?");
//         counterBoolean.add(false);
//         }
//         else if(textMessage[textMessage.length-1]=="nearest mcdo here"){
//         textMessage.add("Here's the nearest mcdo!");
//         counterBoolean.add(false);
//         }
            

//         else{
//           textMessage.add("I'm sorry, I don't understand what you are trying to say.");
//         counterBoolean.add(false);
//         }
      
    

//     });
    
//   }
//   void locationOnClick(){
//     setState(() {
//      textMessage.add("where is the location?");
//         counterBoolean.add(true); 
//         textMessage.add("here");
//         counterBoolean.add(false);
//     });
    
//   }


  
//   @override
//   Widget build(BuildContext context) {
//      ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
//     return Scaffold(
//       resizeToAvoidBottomPadding: true,
//       appBar: AppBar(flexibleSpace: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors:[
//            Color(0xff134781),
//                   Color(0xff30336b)
//           ]
//           )
//         ),
//       ),backgroundColor: Colors.orange,title: Text("MyBot",style: TextStyle(color: Colors.white),),
//       actions: <Widget>[
//         FlatButton(
//           onPressed: (){

//           },
//           child: Text("Yoohoo",style: TextStyle(color: Colors.white)),
//         )
//       ],),
//       body: Stack(
        
//         children: <Widget>[
//           Container(
//             child:new Column(
//               children: <Widget>[
//                  Flexible(
//               child: ListView.builder(
                
//                 controller: controller,
//                 itemCount:1,
                
//                 shrinkWrap: false,
//                 itemBuilder: (BuildContext context,int index){
//                   return Padding(
//                     padding:EdgeInsets.all(ScreenUtil.getInstance().setWidth(30)),
//                     child: Column(
//                       children: <Widget>[
//                         Text("Today",style: TextStyle(color:Colors.grey,fontSize: 12),),
//                        new Container(
//                          height: heightFlex==false? 460 : 200,
//                          child:   new ListView.builder(
//                            reverse: true,
//                           itemCount: textMessage.length,
//                           itemBuilder: (BuildContext context, int index){
//                             List reversedAnimals = textMessage.reversed.toList();
//                             print(reversedAnimals);
//                             List reversed = counterBoolean.reversed.toList();
//                             return new Container( 
//                               child: Column(
//                                 children: <Widget>[

                                  
//                                    Bubble(message: "${reversedAnimals[index]}", isMe: reversed[index],),
//                                  reversedAnimals[index]=="where is the location?" ? new Container( padding: EdgeInsets.only(right: 250),
//                                    height: ScreenUtil.getInstance().setHeight(400),
//                                    child:  Image(image: AssetImage("assets/map.jpg"),fit: BoxFit.cover,), 
//                                  ): reversedAnimals[index]=="Cleaning Service" ? 
//                                 Container(
//                                   height: 250,
//                                   child: ListView.builder(
                                 
//                                     itemCount: counterResult,
//                                     itemBuilder: (BuildContext context, int index){
//                                       return   new Container( 
//                                    height: ScreenUtil.getInstance().setHeight(400),
//                                    child:   Card(
//       elevation: 10,
//      child: Hero(tag:{},child: Material(
//         child: InkWell(
//           onTap: ()async{
//             double wallet;
//               http.Response response = await http.get(
//          Uri.encodeFull("http://filmeapi.azurewebsites.net/api/user/getall"),
//          headers: {
//         "Accept":"application/json",
//         "Content-Type": "application/json"
//             });
//     List reviewdata=json.decode(response.body);
//     for(int x=0;x<reviewdata.length;x++){
//       if(reviewdata[x]['_id']=="$userid"){
//         wallet=reviewdata[x]['balance'];
//       }
//     }

//             Navigator.of(context).push(new MaterialPageRoute(
//          builder:(BuildContext context)=>prod_details(1,"${serviceName[index]}",price,"${details[index]}","awercwer","${id[index]}","${tagsThrow[index]}","${companyId[index]}",wallet,"$userid","${id[index]}","${branch[index]}","${branchName[index]}",0.0,"",[],[])));
//           },
//           child: GridTile(footer: Container( 
//             padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(20)),
//             color: Colors.white70,
//              child: Column(
           
//                children: <Widget>[
//                  new Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text("${serviceName[index]} ${branchName[index]}",style: TextStyle(fontWeight: FontWeight.bold),),
//                      Text("      "),     
                    
//                    ],
//                  ),
//                  new Row(
//                 children: <Widget>[
//                   SizedBox(
//                     height: ScreenUtil.getInstance().setHeight(50),
//                     child: Row(
//                       children: <Widget>[
                      
//                       ],
//                     ),
//                   )
              
//                 ],
//               ),
//                ],
//              )
//           ),
//           child:
//           Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTrz2ILush1AYeN6s53k7I1tGua9eZXeypOWjAYQNem3ssnGI7l",fit: BoxFit.cover,)
//           ),
//         ),
//       ),),
    
//     )
//   );
//                                     },
//                                   ),
//                                 ) : reversedAnimals[index]=="Restaurant" ? 
//                                 Container(
//                                   height: 250,
//                                   child: ListView.builder(
                                 
//                                     itemCount: counterResult,
//                                     itemBuilder: (BuildContext context, int index){
//                                       return   new Container( 
//                                    height: ScreenUtil.getInstance().setHeight(400),
//                                    child:   Card(
//       elevation: 10,
//      child: Hero(tag:{},child: Material(
//         child: InkWell(
//           onTap: ()async{
//             double wallet;
//               http.Response response = await http.get(
//          Uri.encodeFull("http://filmeapi.azurewebsites.net/api/user/getall"),
//          headers: {
//         "Accept":"application/json",
//         "Content-Type": "application/json"
//             });
//     List reviewdata=json.decode(response.body);
//     for(int x=0;x<reviewdata.length;x++){
//       if(reviewdata[x]['_id']=="$userid"){
//         wallet=reviewdata[x]['balance'];
//       }
//     }

//             Navigator.of(context).push(new MaterialPageRoute(
//          builder:(BuildContext context)=>prod_details(1,"${serviceName[index]}",price,"${details[index]}","awercwer","awercawerd213","${tagsThrow[index]}","${companyId[index]}",wallet,"$userid","${id[index]}","${branch[index]}","${branchName[index]}",0.0,"",[],[],)));
//           },
//           child: GridTile(footer: Container( 
//             padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(20)),
//             color: Colors.white70,
//              child: Column(
           
//                children: <Widget>[
//                  new Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text("${serviceName[index]} ${branchName[index]}",style: TextStyle(fontWeight: FontWeight.bold),),
//                      Text("      "),     
                    
//                    ],
//                  ),
//                  new Row(
//                 children: <Widget>[
//                   SizedBox(
//                     height: ScreenUtil.getInstance().setHeight(50),
//                     child: Row(
//                       children: <Widget>[
                      
//                       ],
//                     ),
//                   )
              
//                 ],
//               ),
//                ],
//              )
//           ),
//           child:
//           Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQRs0MFtj3ywVs4cQhqFnzWBc0YM2Q_cm5lhF6rzT1yJ6rA--IF",fit: BoxFit.cover,)
//           ),
//         ),
//       ),),
    
//     )
//   );
//                                     },
//                                   ),
//                                 )
//                                :textMessage[index]=="choices" ?
//                                   Center(
//                                    child: Container(
    
//                                       height: ScreenUtil.getInstance().setHeight(540),
//                                       width: ScreenUtil.getInstance().setHeight(1000),
//                                       child: Card(

//                                         child: Column(
//                                          crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [

//                                            Image(image: AssetImage("assets/map.jpg")),
//                                            Row(
//                                              children: <Widget>[
//                                                 RaisedButton(
                                                  
//                                                   color: Colors.blue,
//                                                   onPressed: (){},
//                                                   child: Text("Location"),
//                                                 shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
//                                                 )
//                                              ],
//                                            )
//                                          ],
//                                        ),
    
//                                      ),
//                                 ),
//                               )
                                  
//                                    : Text("")
//                                 ],
//                               )
//                             );

//                           }
//                         ),
//                        ),
                     
                        

//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//               ],
//             )
//           ),
//           Positioned(
//             bottom: 70,
//             left: 0,
//             width: MediaQuery.of(context).size.width,
//             child: new Container(
//               height: 60,
//                     child: ListView(
//                     controller: controller,
//                     scrollDirection: Axis.horizontal,
//                     children: <Widget>[
//                          new Container(
//                     padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(30)),
//                     child:  OutlineButton(              
//                   color: Colors.blue,
//               onPressed: (){
//                 locationOnClick();
//               },
//                child: Text("Book"),
//             shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
//              ),
//                   ),
//                  new Container(
//                     padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(30)),
//                     child:  OutlineButton(
                                                  
//                   color: Colors.blue,
//               onPressed: (){},
//                child: Text("Wave"),
//             shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
//              ),
//                   )
                 
//             ,
//                  new Container(
//                     padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(30)),
//                     child:  OutlineButton(
                                                  
//                   color: Colors.blue,
//               onPressed: (){},
//                child: Text("Maps"),
//             shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
//              ),
//                   )
                 
//             ,
//             new Container(
//               padding: EdgeInsets.all(10),
//               child: OutlineButton(                                 
//                color: Colors.blue,
//                onPressed: (){},
//               child: Text("Choices"),
//              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
//              )
//             )
//                     ],
//                   ),
                 
//             ),
//           ),
//           Positioned(
//             bottom:0,
//             left:0,
//             width: MediaQuery.of(context).size.width,
//             child: Container(
//               padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(30)),
//               decoration: BoxDecoration(
//                 color:Colors.white,
//                 boxShadow: [                  
//                   BoxShadow(
//                     color:Colors.grey[300],
//                     offset:Offset(-2,0),
//                     blurRadius: 5,
//                   ),
                
//                 ]
//               ),
//               child: Row(
//                 children: <Widget>[
//                 IconButton(
//                   onPressed: (){

//                   },
//                   icon: Icon(Icons.camera),
//                    color: Colors.green,
//                 ),
//                 IconButton(
//                   onPressed: 
//                   (){

//                   },
//                   icon: Icon(Icons.image),
//                   color: Colors.green,
                  
//                 ),
//                 Expanded(
//                   child: TextFormField(
//                     controller: _message,
//                     keyboardType:TextInputType.text,
                    
//                     decoration: InputDecoration(
//                       hintText: 'Enter Message',
//                       border: InputBorder.none
//                     ),
//                   ),
//                 ),
//                  IconButton(
//                   onPressed: 
//                   (){
//                       send();
//                   },
//                   icon: Icon(Icons.send),
//                   color: Colors.green,
                  
//                 ),
                
//                 ],
//               ),
//             ),
//           )
//         ],
//       )
    
//     );
//   }
// }
// class Bubble extends StatelessWidget {
//   final bool isMe;
//   final String message;
//   Bubble({this.message,this.isMe});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin:EdgeInsets.all(5),
//       padding:isMe? EdgeInsets.only(left:40) : EdgeInsets.only(right:40),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//         Column(
//           crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
//          mainAxisAlignment: isMe? MainAxisAlignment.start : MainAxisAlignment.end,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(50)),
//               decoration: BoxDecoration(
//                 gradient: isMe?LinearGradient(
//                   begin: Alignment.topRight,
//                   end:Alignment.topLeft,
//                   colors: [
//                     Colors.blue,
//                     Colors.blue
//                   ]
//                 ): LinearGradient(
//                    begin: Alignment.topRight,
//                   end:Alignment.topLeft,
//                   colors: [
//                     Colors.orange,
//                     Colors.orange
                    
//                   ]
//                 ),
//                 borderRadius: isMe? BorderRadius.only(
//                   topRight: Radius.circular(15),
//                   topLeft: Radius.circular(15),
//                   bottomLeft: Radius.circular(15),
//                   bottomRight: Radius.circular(0),
//                 ) :  BorderRadius.only(
//                   topRight: Radius.circular(15),
//                   topLeft: Radius.circular(15),
//                   bottomLeft: Radius.circular(0),
//                   bottomRight: Radius.circular(15),
//                 ) 
//               ),
//               child: Column(
//                 crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(message,textAlign: isMe ? TextAlign.end : TextAlign.start,
//                   style: TextStyle(color: isMe? Colors.black : Colors.black),),
                  
//                 ],
//               ),
//             )
//         ],)
//         ],
//       ),
//     );
//   }
// }