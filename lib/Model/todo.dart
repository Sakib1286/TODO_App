
class ToDo{

String? id;
String? todoText;
bool isDone;

ToDo({
  required this.id,
  required this.todoText,
  this.isDone= false,

});
static List<ToDo> todoList(){
return[
  ToDo(id: '01', todoText: "Morning Exercise ",isDone: true),
  ToDo(id: '02', todoText: "Breakfast  ",),
  ToDo(id: '03', todoText: "Buy Groceries ",),
  ToDo(id: '04', todoText: "Go to Office ",),
  ToDo(id: '05', todoText: "Meeting ",),
  ToDo(id: '05', todoText: "Dinner With Jenifar",),

];



}



}