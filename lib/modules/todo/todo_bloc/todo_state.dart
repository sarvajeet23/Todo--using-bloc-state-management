// lib/bloc/todo_bloc/todo_state.dart
import 'package:equatable/equatable.dart';
import 'package:myapp/model/todo_model.dart';

class TodoState extends Equatable {
  final List<Todo> todos;

  const TodoState(this.todos);

  @override
  List<Object> get props => [todos];
}
