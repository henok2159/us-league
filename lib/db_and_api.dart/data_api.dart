import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:usleague/model/data_model.dart';
class DataApi{
var _client=http.Client();
Future<List<Datum>>getData()async{
  List<Datum>datan=[];
var url=Uri.parse("http://www.mocky.io/v2/5de8d38a3100000f006b1479");
var response=await _client.get(url);
if(response.statusCode==200){
var jsonBody=jsonDecode(response.body);
  DataModel dataModel= DataModel.fromJson(jsonBody);
  datan=dataModel.data;
  
  datan.sort((a,b){
     var adate = a.date; //before -> var adate = a.expiry;
     var bdate = b.date; //var bdate = b.expiry;
     return -adate!.compareTo(bdate!);
  });
 
}
 return datan;

}
}