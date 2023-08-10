import 'package:flutter/material.dart';
import 'package:todo/TitleScreen.dart';
import 'package:todo/directory/Databasehelper.dart';

class EditAddNote extends StatefulWidget {
  var updateid="";
  EditAddNote({required this.updateid});

  @override
  State<EditAddNote> createState() => _EditAddNoteState();
}
class _EditAddNoteState extends State<EditAddNote> {


  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();

  Future<List> getdata() async
  {
    Databasehelper obj = new Databasehelper();
    var data = await obj.getsingledata(widget.updateid);
    setState(() {
      _title.text = data[0]["titlename"].toString();
      _content.text = data[0]["content"].toString();
    });
    return data;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }


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
                            onPressed: ()  async{

                              var title = _title.text.toString();
                              var content = _content.text.toString();

                              Databasehelper obj = new Databasehelper();
                              var status = await obj.updatedata(title,content,widget.updateid);
                              if(status==1)
                                {
                                  Navigator.of(context).pop(); // update
                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => TitleScreen())
                                  );

                                }
                              else
                                {
                                  var snackbar = SnackBar(
                                    content: Text("Not Update"),
                                    duration: Duration(seconds: 3),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                }

                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment.centerLeft ,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Title :-",style: TextStyle(
                              fontSize: 30.0,
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
