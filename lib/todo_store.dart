import 'package:mobx/mobx.dart';

// Include generated file
part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  @observable
  ObservableList<String> todos = ObservableList<String>();

  @action
  void addTodo(String todo) {
    todos.add(todo);
  }

  @action
  void removeTodoAt(int index) {
    todos.removeAt(index);
  }
}
