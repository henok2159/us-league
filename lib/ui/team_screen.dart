import 'package:flutter/material.dart';
import 'package:usleague/constant.dart';
import 'package:usleague/db_and_api.dart/data_api.dart';
import 'package:usleague/model/data_model.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({ Key? key }) : super(key: key);

  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataApi().getData(),
      builder: ((context, snapshot) {
        
        if(snapshot.hasData){
            List<Datum>?data=snapshot.data;
            return ListView.builder(itemBuilder: ((context, index) {
              return SizedBox(
                height:150,
                child: Card(child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data![index].homeTeam!.fullName,style: forClub,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Column(children: [
                        Text(data[index].homeTeam!.city),
                         Text(data[index].homeTeam!.division??"Central")
                      ],),
                      Column(children: [
                             Text(data[index].homeTeam!.name),
                         Text(data[index].homeTeam!.conference??"East")
                      ],)
                    ],)

                ]),),
              );
            }));
        }
        else return Center(child: CircularProgressIndicator.adaptive());
      }),
    );
  }
}