import 'package:flutter/material.dart';

import '../Model/todo.dart';
import '../Widgets/todo_item.dart';


class HomePage extends StatefulWidget {
 HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todosList= ToDo.todoList();
  final todoController= TextEditingController();
  List<ToDo> _foundTodo=[];

  @override
  void initState() {
    _foundTodo=todosList;
    super.initState();
  }

  void _handleTodoChange(ToDo todo){
    setState(() {
      todo.isDone=! todo.isDone;
    });
  }


  void _deleteTodoItem(String id){
    setState(() {
      todosList.removeWhere((item)=>item.id==id);
    });
  }


  void addTodoItem(String toDo){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(), todoText: toDo));
    });
todoController.clear();
  }

void runFilter(String enteredKeyword){
    List<ToDo> result= [];
    if(enteredKeyword.isEmpty){
      result =todosList;
    }else{
      result = todosList.where((item)=>item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
setState(() {
  _foundTodo=result;
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
     appBar: AppBar(
       backgroundColor: Colors.white,
       title: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Icon(Icons.menu,color: Colors.black,size: 30,),
           Container(
             height: 40,
            width: 40,

             decoration: BoxDecoration(

               borderRadius: BorderRadius.circular(60),

             ),
             child: Image.asset('assets/images/index1.jpeg'),
             ),

         ],
       ),
     ),

      body:Stack(
        children: [
          Container

            (
            padding: EdgeInsets.all(15),
            child: Column(
                // Search Box
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(15),

                   ),
                  child: TextField(
                    onChanged: (value)=>{
                      runFilter(value)

                    },
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.all(0),
                   prefixIcon: Icon(
                     Icons.search,
                     color: Colors.black,
                     size: 20,
                   ),
                   prefixIconConstraints: BoxConstraints(
                     maxHeight: 20,
                     minWidth: 20,
                   ),
                   border: InputBorder.none,
                   hintText: "Search",
                   hintStyle: TextStyle(color: Colors.grey,)

                 ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                          bottom: 20,

                        ),
                        child: Text("All TODOS ",
                        style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w700),
                        ),

                      ),
                      for(ToDo todo in _foundTodo.reversed)
                        TodoItem(todo: todo,onTodoChange: _handleTodoChange,
                        onDeleteItem: _deleteTodoItem,
                        ),



                    ],
                  ),

                ),
              ],

            ),

          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
          children: [
            Expanded(child: Container(
              margin: EdgeInsets.only(top: 20,
              bottom: 20,left: 20),
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0,0.0),
                   blurRadius: 10.0,
                  spreadRadius: 0.0
                ),],
                borderRadius: BorderRadius.circular(10.0)


              ),
              child: TextField(
                controller: todoController,
                decoration: InputDecoration(
                  hintText: "Add a new TODO",
                  border: InputBorder.none,
                ),
              ),

            )),
            Container(
              margin: EdgeInsets.only(
                 top: 20,
                bottom: 20,
                right: 20,
              ),
              padding: EdgeInsets.all(10),
              child: ElevatedButton(

                child: Text('+',style: TextStyle(fontSize: 40),),

                onPressed: () {
                  addTodoItem(todoController.text);
                },

                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.indigoAccent,
                  foregroundColor: Colors.white,
                  minimumSize: Size(60, 60),
                ),

              ),
            )
          ],

            ),

          )
        ],
      )


    );
  }
}



