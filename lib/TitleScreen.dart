import 'package:flutter/material.dart';
import 'package:todo/Addnote.dart';
import 'package:todo/EditAddNote.dart';
import 'package:todo/directory/Databasehelper.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {

  Future<List>? getalldata;
   Future<List> viewdata() async
  {
    Databasehelper obj = new Databasehelper();
    var data = obj.getalldata();
    return data;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getalldata = viewdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 8.0,
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.deepPurple.shade400,
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => Addnote())
          );
        },
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey.shade200,
              child: FutureBuilder(
                  future: getalldata,
                  builder: (context,snapshots)
                  {
                    if(snapshots.hasData)
                    {
                      if(snapshots.data!.length<=0)
                      {
                        return Center(
                          child: Image.asset("img/empty.png"),
                        );
                      }
                      else
                      {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshots.data!.length,
                            itemBuilder: (context,index)
                            {
                              return ListTile(
                                  title: Text(snapshots.data![index]["titlename"].toString()),
                                  subtitle: Text(snapshots.data![index]["content"].toString()),
                                  trailing:
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox.fromSize(
                                        size: Size(56, 56),
                                        child: ClipOval(
                                          child: Material(
                                            color: Colors.redAccent,
                                            child: InkWell(
                                              splashColor: Colors.green,
                                              onTap: () async{
                                                var id = snapshots.data![index]["titleid"].toString();

                                                Databasehelper obj = new Databasehelper();
                                                var status = await obj.deletedata(id);
                                                if(status==1)
                                                {
                                                  setState(() {
                                                    getalldata = viewdata();
                                                  });
                                                }
                                                else
                                                {
                                                  var snackbar = SnackBar(
                                                    content: Text("Record Not Deleted"),
                                                    duration: Duration(seconds: 3),
                                                  );
                                                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                                }
                                              }, // button pressed
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(Icons.delete,), // icon
                                                  Text("Delete"), // text
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      SizedBox.fromSize(
                                        size: Size(56, 56),
                                        child: ClipOval(
                                          child: Material(
                                            color: Colors.orange,
                                            child: InkWell(
                                              splashColor: Colors.green,
                                              onTap: () async{
                                                 var id = snapshots.data![index]["titleid"].toString();

                                                 

                                                 Navigator.push(context,
                                                 MaterialPageRoute(builder: (context) => EditAddNote(
                                                   updateid: id,
                                                 ))
                                                 );
                                              },
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(Icons.edit),
                                                  Text("Edit"),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              );
                            }
                        );
                      }
                    }
                    else
                    {
                      return Center(
                        child: Text("Data Loading"),
                      );
                    }
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
