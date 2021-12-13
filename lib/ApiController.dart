import 'package:newsapp/degerler.dart';
import 'package:newsapp/models/photolist.dart';
import 'package:http/http.dart'as http;
import 'dart:convert' as convert;
import 'package:dio/dio.dart';

class httpRequests{
  Dio dio=new Dio();
 static List<AlbumList> result=[];
 static List<AlbumList> ress=[];
 static bool titlee=false;
 static Future<List<AlbumList>> albumGet ()async{
    try{
      var request=await Dio().get("https://jsonplaceholder.typicode.com/photos");
      if(request.statusCode==200){
      result=(request.data as List).map((e) => AlbumList.fromJson(e)).toList();
      Degerler.listeUzunlugu= result.length;
      print(result.length);
       return result;
    }
      return result;
    }on DioError catch(e){
      return Future.error(e.message);
    }
}
static albumPut(int id,String title)async{
   try{
     var request=await http.put(Uri.parse("https://jsonplaceholder.typicode.com/photos/"+id.toString()),
     headers: { 'Content-Type': 'application/json',
       'Accept': 'application/json',},
         body: convert.jsonEncode({
           "id":id,
           "title":title
            })
     );
     if(request.statusCode==200){
       print("güncelleme başarılı"+request.body);
       AlbumList album=AlbumList.fromJson(convert.jsonDecode(request.body));
       return "Güncelleme Başarılı";
     }else{
       print("güncelleme başarılı olamadı");
        return "Güncelleme Başarısız";
     }
   }catch(e){
     return "hata";
   }
}
static Future<List<AlbumList>?> delete(int id)async{
  var request;
  var result;
   try{
     request=await http.delete(Uri.parse("https://jsonplaceholder.typicode.com/photos/"+id.toString()),
     headers: {
       "Content-Type":"application/json; charset=utf-8"
     }
     );
     if(request.statusCode==200){
       var response=await convert.jsonDecode(request.body) as Map<String,dynamic>;
       result=AlbumList.fromJson(response);
       for(int i=0;i<response.length;i++){
         ress.add(response[i]);
       }

       return ress;
     }else{
       return null;
     }
   } catch(e){
     return null;
   }




}


}