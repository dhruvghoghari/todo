import 'package:flutter/material.dart';
import 'package:todo/TitleScreen.dart';
import 'package:todo/directory/Databasehelper.dart';

class Addnote extends StatefulWidget {
  const Addnote({Key? key}) : super(key: key);

  @override
  State<Addnote> createState() => _AddnoteState();
}

class _AddnoteState extends State<Addnote> {

  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios_sharp,),
                            onPressed: () {
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => TitleScreen())
                              );
                            },
                          ),
                          SizedBox(width: 40.0),
                          Text("Add Note",style: TextStyle(
                            fontSize: 30.0,
                          ),),
                          SizedBox(width: 30.0),
                          IconButton(
                            icon: Icon(Icons.access_alarm),
                            onPressed: () {},
                          ),
                          SizedBox(width: 5.0),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: (){

                              _title.text="";
                              _content.text = "";
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () async {

                              var title = _title.text.toString();
                              var content = _content.text.toString();


                              if(title.length<=0)
                              {
                                var snackbar = SnackBar(
                                  content: Text("Enter Title  ",style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  backgroundColor: Colors.redAccent,
                                  duration: Duration(seconds: 4),
                                  padding: EdgeInsets.all(10.0),
                                  action: SnackBarAction(textColor: Colors.white,label: "Close",onPressed: (){},),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              }
                              else if(content.length<=0)
                              {
                                var snackbar = SnackBar(
                                  content: Text("Enter content "),
                                  backgroundColor: Colors.redAccent,
                                  duration: Duration(seconds: 4),
                                  elevation: 5.0,
                                  action: SnackBarAction(textColor: Colors.white,label: "Close",onPressed: (){},),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              }
                              else
                                {
                                  Databasehelper obj = new Databasehelper();
                                  var id = await obj.insertable(title,content);


                                  var snackbar = SnackBar(
                                    content: Text("Record add :"+id.toString()),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                  Navigator.of(context).pop(); //add pop
                                  Navigator.of(context).pop(); //view pop
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => TitleScreen())
                                  );
                                }
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment.centerLeft ,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Title :-",style: TextStyle(
                              fontSize: 30.0,
                          ),),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                              )
                          ),
                          controller: _title,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft ,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Content :-",style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey
                          ),),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                              )
                          ),
                          controller: _content,
                          minLines: 5,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




