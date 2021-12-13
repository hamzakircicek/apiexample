import 'package:flutter/material.dart';
import 'package:newsapp/Widgets.dart';
import 'package:newsapp/degerler.dart';
import 'package:newsapp/ApiController.dart';
import 'package:newsapp/util.dart';
class update extends StatelessWidget {
  TextEditingController title=new TextEditingController();
  TextEditingController subtitle=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("Update Page"),
      ),
        body: Container(
          child: Column(
            children: [
              wdgets.newsUpdate(title, Icons.drive_file_rename_outline, Degerler.title,1),
              SizedBox(height: 25,),
              InkWell(
                onTap: (){
                httpRequests.albumPut(Degerler.index,title.text);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(Snacbar().Snackbar(context,"Değer Güncellendi"));
                  },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.blueGrey.shade200,
                    ),

                  ),
                  child: Center(child: Text("Güncelle",style: TextStyle(color: Colors.blueGrey.shade300,letterSpacing: 3,fontWeight: FontWeight.bold),)),
                ),
              ),

            ],
          ),
        ),
    );
  }
}
