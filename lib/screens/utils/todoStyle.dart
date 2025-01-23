import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todolist extends StatelessWidget {

  const  Todolist ({super.key, required this.taskName, required this.taskcompleted, required this.onChanged, required this.deleteFunction});
final String taskName;
final bool taskcompleted;
final Function(bool?)?onChanged;
final Function(BuildContext)?deleteFunction;

  @override
  Widget build(BuildContext context) {
    return   Padding(
    padding: const EdgeInsets.only(
    top: 10,right: 10,left: 10,bottom: 0,
    ),
    child: Slidable(
      endActionPane:ActionPane(motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction,
              icon: Icons.delete,
            borderRadius: BorderRadius.circular(15),
            backgroundColor: Colors.red,),
          ]) ,
      child: Container(
      decoration: BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.circular(20),
      
      ),
      padding: EdgeInsets.all(16),
      
      
      child: Row(
      
        children: [
          Checkbox(value: taskcompleted, onChanged: onChanged,
          checkColor: Colors.black,
           activeColor: Colors.white,
            side: BorderSide(color: Colors.white),
      
          ),
          Text(taskName,style: TextStyle(color: Colors.white,
          decoration:taskcompleted?TextDecoration.lineThrough :TextDecoration.none,decorationColor: Colors.red,
          decorationThickness:2 ,
          fontSize: 20),),
        ],
      ),
      
      ),
    ),
    );
  }
}
