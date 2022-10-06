// ignore_for_file: deprecated_member_use

import 'package:databaseexample/database.dart';

import 'package:databaseexample/tasks.dart';
import 'package:databaseexample/view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      home: home(),
    );
  }
}
class home extends StatefulWidget {
  const home({ Key? key }) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late String tasks;
  late int dates;
  late Dphelper help;
  bool ? v=false;
   @override
   void initState() {
    // TODO: implement initState
    help=Dphelper();
  }
  
  
  
  @override
  

  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Tasker',
        
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        
        
        
        
        
        )
         
          ,

          
       
      ),

      body: FutureBuilder(
      future: help.alltasks(),
      builder: (context, AsyncSnapshot snapshot)
       

      {
        if(!snapshot.hasData){
        return CircularProgressIndicator();}

        else{
         
         return ListView.builder(
              itemCount: snapshot.data.length,
          
              itemBuilder: (context,index)
              {
                  Tasks tasks=Tasks.fromMap(snapshot.data[index]);
                  return Container(
                      height: 100,
                      width: 100,
                    child: ListTile(
          
                        title: Text(tasks.task,
                        style: TextStyle(
       
        fontWeight: FontWeight.bold,
        fontSize: 20,)
                        
                        ),
                        subtitle: Text('${tasks.date}',
                        
                        style: TextStyle(
     
        fontWeight: FontWeight.bold,
        fontSize: 20,
                        
                        ),)
          
          
                     
                      
                      
                      
                      ),
                  );
              }
              
              
              );
          

        }


      },
    
    
    ),
     
   
          
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: ()
            {
              showModalBottomSheet(
                context: context,
                 builder: (BuildContext context)  {
                    return Form(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
                  TextFormField(
                                maxLines: null,
                                decoration: InputDecoration(
                                  hintText: 'Task',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                           
                           onChanged: (value)
                           {
                                 tasks=value;
                           },
                                
                               //   controller:textController

                              ),
                               TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'No due date',
                                   hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                     onChanged: (value){
                                 dates= int.parse(value);
                     },
                     
                              // controller: datecontroller,
                                
                              ),
                     
                        RaisedButton(
                          child: Text('save',
                          style: TextStyle(
              
                            color: Colors.blue
                          ),
                          ),
                          onPressed:()
                           async{
                          
                          setState(() {
                            
                          Tasks  task_s = Tasks(date: dates,task: tasks);
                            
                          help.CreateTasks(task_s).then((value) =>  Navigator.of(context).pop());
                         // task_s.id=d;

                           
                          });
                          
                        }  )
                        ]
              
                        ),
                        ),
                       );
                       }  );
        
                     },
            
            
             ),
       
 );
                              
         
        
    
  }
}
