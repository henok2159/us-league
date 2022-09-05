import 'package:flutter/material.dart';
import 'package:usleague/constant.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({ Key? key }) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    
      builder:((context, snapshot) {
        if(!snapshot.hasData){
            return ListView.builder(itemBuilder: ((context, index) {                
                return  Card(
                  
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: Row(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Club Name",style: forClub,)],),
                        // Column(),
                        // Column()
                      ]),
                    ),
                  ),);
                 // Spacer()
                
              
            }));
        }
        else return Center(child: CircularProgressIndicator());
      }) ,);
    
  }
}