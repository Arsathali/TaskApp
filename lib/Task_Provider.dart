import 'package:flutter/material.dart';

 class MyProvider extends ChangeNotifier
 {
    List<Map<String,dynamic>> tasks=[];


     int donecount=0;
     int totalcount=0;
     int inprogresscount=0;

      int progress(){
        return inprogresscount=totalcount-donecount;
      }

    // Add task
    void addtask(Map<String,dynamic> task){
       tasks.add(task);
       totalcount=totalcount+1;
       notifyListeners();
    }

    //remove task
    void removetask(Map<String,dynamic> task){
      tasks.remove(task);
      donecount =donecount+1;
      notifyListeners();
    }






 }