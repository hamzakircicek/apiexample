import 'package:flutter/material.dart';
import 'package:newsapp/degerler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:newsapp/models/photolist.dart';
import 'package:newsapp/ApiController.dart';
import 'package:newsapp/pages/updatePage.dart';
import 'package:newsapp/util.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}
int gelenDeger=30;
var _scrollController=ScrollController();

var getreq;
class _homeState extends State<home> {

var getRequest;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequest=httpRequests.albumGet();
    _scrollController.addListener((){
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          debugPrint("en yukarıdasın");
        } else {
          loading();
        }
      }
    });
  }
  @override
  Widget build(BuildContext contextAna) {
print("state güncellendi");
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("Home"),
      ),
      body: Container(
        child:  FutureBuilder<List<AlbumList>>(
          future:getRequest,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: CircularProgressIndicator(),));
            } else {
              var data = snapshot.data!;
              return ListView.builder(
                  controller: _scrollController,
                  itemCount:gelenDeger,
                  itemBuilder: (context, index) {
                    AlbumList list = data[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: (){

                            Degerler.index=list.id;
                            Degerler.title=list.title;
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>update()));
                          },
                          child: Padding(
                          padding: const EdgeInsets.all(8.0),
                               child: Slidable(
                               actionPane:SlidableDrawerActionPane(),
                                 actionExtentRatio: 0.25,
                                secondaryActions: [
                                Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                        child: IconSlideAction(
                                                color: Colors.red.shade500,
                                                icon: Icons.delete,
                    onTap: (){
                 getRequest=httpRequests.delete(list.id);
                    ScaffoldMessenger.of(context).showSnackBar(Snacbar().Snackbar(context,"Değer Silindi"));
                      },),
                    ),)
                                ],

                    child: Container(
                      height: 70,
                        key: Key(index.toString()),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.shade400.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10)
                    ),
                    child: ListTile(
                                tileColor:Colors.white,

                                leading: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Center(
                                    child: Text(list.id.toString(),style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                                title: Text("Açıklama",style: TextStyle(color: Colors.white),),
                                subtitle:  Text(titleDegeri(list.title),style: TextStyle(color: Colors.grey.shade300),),
                                trailing: Container(
                                  width: 70,
                                  child: Icon(Icons.delete,color: Colors.red.shade800,),
                                ),
                              ),
                            ),
                          )
                      ),
                    ));
                  }
              );
            }
          },

        ),
      ),
    );

  }
  void loading() {
    if (gelenDeger < httpRequests.result.length) {
      setState(() {
        gelenDeger += 30;
      });
      print(gelenDeger);
    }
    if (gelenDeger > httpRequests.result.length) {
      setState(() {
        gelenDeger = httpRequests.result.length;
      });
    }
    if (gelenDeger == httpRequests.result.length) {
      debugPrint("Tüm kayıtlara ulaşıldı");
    }
    debugPrint("Yüklendi");
  }
String titleDegeri(String ilkDeger){
  if(httpRequests.titlee==false){
    return ilkDeger;
  }else{
    setState(() {
      httpRequests.titlee=true;
      ilkDeger="denemeeeeeeeeeeeee";
    });
    return ilkDeger;
  }
}

}

