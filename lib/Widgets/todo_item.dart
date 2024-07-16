import 'package:flutter/material.dart';

import '../Model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final onTodoChange;
  final onDeleteItem;
  const TodoItem({super.key, required this.todo, this.onTodoChange, this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
     child:  ListTile(
       onTap: (){
         onTodoChange(todo);
       },
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(20),

       ),
       contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
       tileColor: Colors.white,
       leading:Icon(todo.isDone? Icons.check_box: Icons.check_box_outline_blank,color: Colors.blue,) ,
       title:
       Text(
         todo.todoText!,
        style: TextStyle(color: Colors.black,fontSize: 16,decoration: todo.isDone ? TextDecoration.lineThrough:null,),

       ),
       trailing: Container(
         padding: EdgeInsets.all(0),
         margin: EdgeInsets.symmetric(vertical: 12),
         height: 35,
         width: 35,
         decoration: BoxDecoration(
           color: Colors.red,
               borderRadius: BorderRadius.circular(15)
         ),
         child: IconButton(
          color: Colors.white,
           icon: Icon(Icons.delete),
           iconSize: 19,
           onPressed: () {
            onDeleteItem(todo.id);
           },

         ),
       ),

     )
    );
  }
}
