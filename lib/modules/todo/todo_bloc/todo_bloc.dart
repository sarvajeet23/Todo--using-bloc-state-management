// lib/bloc/todo_bloc/todo_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
 
import 'package:myapp/model/todo_model.dart';
import 'package:myapp/modules/todo/todo_bloc/todo_event.dart';
import 'package:myapp/modules/todo/todo_bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState([])) {
    on<AddTodo>((event, emit) {
      emit(TodoState(List<Todo>.from(state.todos)
        ..add(Todo(
          title: event.title,
          description: event.description, 
        ))));
    });

    on<UpdateTodo>((event, emit) {
      final updatedTodos = List<Todo>.from(state.todos);
      if (event.index >= 0 && event.index < updatedTodos.length) {
        updatedTodos[event.index] = Todo(
          title: event.updatedTitle,
          description: event.updatedDescription,
          isCompleted: updatedTodos[event.index].isCompleted,
        );
        emit(TodoState(updatedTodos));
      }
    });

    on<DeleteTodo>((event, emit) {
      final updatedTodos = List<Todo>.from(state.todos)..removeAt(event.index);
      emit(TodoState(updatedTodos));
    });

    on<ToggleTodoCompletion>((event, emit) {
      final updatedTodos = List<Todo>.from(state.todos);
      if (event.index >= 0 && event.index < updatedTodos.length) {
        updatedTodos[event.index] = Todo(
          title: updatedTodos[event.index].title,
          description: updatedTodos[event.index].description,
          isCompleted: !updatedTodos[event.index].isCompleted,
        );
        emit(TodoState(updatedTodos));
      }
    });
  }
}
