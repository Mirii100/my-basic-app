import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybasicapp/screens/utils/todoStyle.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _controller=TextEditingController();
List todolist=[
  ['learn react',false],
  ['learn django',false],
  ['trade  online ',false ],
  ['trade   ',false ],
  ['e  online ',false ],
];

void checkboxChanged(int index ){
setState(() {
  todolist[index][1]=!todolist[index][1];
});

}
void saveNewTask(){
  setState(() {
    todolist.add([_controller.text,false]);
    _controller.clear();
  });
}

void deleteTask(int index ){
  setState(() {
    todolist.removeAt(index);
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
appBar: AppBar(
  title: Text("this is the to do list "),
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,

),
      body: ListView.builder(itemCount: todolist.length,itemBuilder: (BuildContext context, index){
        return Todolist(
          taskName: todolist[index][0],
          taskcompleted: todolist[index][1],
          onChanged: (value)=>checkboxChanged(index),
          deleteFunction:(context)=>deleteTask(index) ,
        );

      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
        controller: _controller,
                decoration:InputDecoration(
                  hintText:'add more todo items ' ,
                  filled: true,
                  fillColor: Colors.green.shade200,

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,

                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(14),
                  ),
                ) ,
              ),
            )),
            FloatingActionButton(onPressed: saveNewTask,
            child:Icon(Icons.add)),
          ],
        ),
      ),

    );
  }
}
