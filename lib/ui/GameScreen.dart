import 'package:flutter/material.dart';
import 'package:usleague/constant.dart';
import 'package:usleague/db_and_api.dart/data_api.dart';
import 'package:usleague/model/data_model.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({ Key? key }) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataApi().getData(),
      builder:((context, snapshot) {
        if(snapshot.hasData){
          List<Datum>?data=snapshot.data;
            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: ((context, index) {                
                return  Card(
                  
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text(data![index].homeTeam!.fullName,style: forClub,maxLines: 2,),
                                  Text(data[index].homeTeam!.abbreviation,style: fordetail,)
                          ],),
                         Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Text("${data[index].date!.day}:${data[index].date!.month}:${data[index].date!.year}"),
                            
                                  Container(
                                    padding: EdgeInsets.all(3),
                                    color: Colors.green,
                                    child: Row(children: [
                                    
                                    Text("${data[index].homeTeamScore}"),
                                    Text(":"),
                                     Text("${data[index].visitorTeamScore}"),
                                    
                                  ]),),
                                  Text("${data[index].status}")
                         ],),
                         Column(  mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text(data[index].visitorTeam!.fullName,style: forClub,maxLines: 2,),
                                  Text(data[index].visitorTeam!.abbreviation,style: fordetail,)
                          ])
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