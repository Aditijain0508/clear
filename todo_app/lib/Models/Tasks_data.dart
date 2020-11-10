import 'package:flutter/foundation.dart';
import 'package:todo_app/Models/TodoTasks.dart';

class TaskData extends ChangeNotifier {
  List<ToDoTasks> listItems = [
    ToDoTasks(name: 'Buy milk'),
    ToDoTasks(name: 'Buy eggs'),
    ToDoTasks(name: 'Buy bread'),
  ]; //dummy list of items

  void addToDoTasks(String newTittle) {
    final task = ToDoTasks(name: newTittle);
    listItems.removeAt(0);
    listItems.insert(0, task);
    notifyListeners();
  }

  Future<void> refreshList() async {
    listItems.insert(0, ToDoTasks(name: 'item to be done', isDone: false));
    notifyListeners();
  }

  void updateTaskList(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final item = listItems.removeAt(oldIndex);
    listItems.insert(newIndex, item);
    notifyListeners();
  }

  void deleteItem(ToDoTasks tasks) {
    /*
    By implementing this method, it ensures that upon being dismissed from our widget tree,
    the item is removed from our list of items and our list is updated, hence
    preventing the "Dismissed widget still in widget tree error" when we reload.
    */
    listItems.removeAt(listItems.indexOf(tasks));
    notifyListeners();
  }

  void taskCompleted(ToDoTasks tasks) {
    /*
    This method accepts the parameters index and item and re-inserts the {item} at
    index {index}
    */
    int index = listItems.indexOf(tasks);
    var toDoToInsert = ToDoTasks(name: listItems[index].name, isDone: true);
    listItems.removeAt(index);
    listItems.insert(listItems.length, toDoToInsert);
    notifyListeners();
  }
}
