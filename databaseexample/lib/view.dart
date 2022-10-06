
import 'package:databaseexample/database.dart';
import 'package:databaseexample/tasks.dart';
import 'package:flutter/material.dart';

class View extends StatefulWidget {
  const View({ Key? key }) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {

bool ? v=false;
late Dphelper helper;
 @override
 void initState() {
    // TODO: implement initState
    super.initState();

    helper=Dphelper();
  }



  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: helper.alltasks(),
      builder: (context, AsyncSnapshot snapshot)
       {

      
        if(!snapshot.hasData){
        return CircularProgressIndicator();}

        else{
          return Column(
            children:[ ListView.builder(
              itemCount: snapshot.data.length,
          
              itemBuilder: (context,index)
              {
                  Tasks tasks=Tasks.fromMap(snapshot.data[index]);
                  return CheckboxListTile(
          
                      title: Text(tasks.task),
                      secondary: Text('${tasks.date}'),
          
          
                    value: v , 
                    onChanged: ( value)
                    {
                           setState(() {
                             v=value;
                           });
                    }
                    
                    
                    
                    
                    );
              }
              
              
              ),
        ]  );

        }




      },
    
    
    );
  }
}