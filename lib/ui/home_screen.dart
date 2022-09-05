import 'package:flutter/material.dart';
import 'package:usleague/ui/GameScreen.dart';
import 'package:usleague/ui/team_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int selected=1;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (() {
        setState(() {
          if(selected==0)selected=1;
          else selected=0;
        });

      }
      
      ),
      child: Text(selected==0?"Team":"Game"),
      ),
    appBar: AppBar(
      toolbarHeight: 80,
      title:Container(child:
     Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        
        GestureDetector(
          onTap: (){
            setState(() {
              selected=0;
            });
          },
          child: Text("Game",style: TextStyle(color: selected==0?Colors.white:Colors.grey),)),

        GestureDetector(onTap: () {
          setState(() {
            selected=1;
          });
          
        },child: Text("Team",style: TextStyle(color: selected==1?Colors.white:Colors.grey),)),
     ]),)),
     body:selected==0?GameScreen():TeamScreen()
    
    );
  }
  Widget whiteMarker(BuildContext context){
    return Material(
      elevation: 10,
      child: Container(
        width: MediaQuery.of(context).size.width*.5,
        height: 2,
        color: Colors.white,
        
        
      ),
    );
  }
}