


class Tasks {


  // late int id;
   late int date ;
    late String task;

  Tasks({required this.date,required this.task})
  
  {
 // this.date= details['date'];
   //this.task= details['task'];
  

  }
   Tasks.fromMap(Map <String ,dynamic> Data)
{
      //this.id=Data['id'];
      this.task=Data['task'];
      this.date=Data['date'];
}

Map<String,dynamic> toMap()
{
  return {'task':this.task ,'date':this.date};
}



  
}