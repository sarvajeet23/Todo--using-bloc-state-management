// lib/bloc/todo_bloc/todo_event.dart
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodo extends TodoEvent {
  final String title;
  final String description;

  const AddTodo(this.title, this.description);

  @override
  List<Object> get props => [title, description];
}

class UpdateTodo extends TodoEvent {
  final int index;
  final String updatedTitle;
  final String updatedDescription;

  const UpdateTodo(this.index, this.updatedTitle, this.updatedDescription);

  @override
  List<Object> get props => [index, updatedTitle, updatedDescription];
}

class DeleteTodo extends TodoEvent {
  final int index;

  const DeleteTodo(this.index);

  @override
  List<Object> get props => [index];
}

class ToggleTodoCompletion extends TodoEvent {
  final int index;

  const ToggleTodoCompletion(this.index);

  @override
  List<Object> get props => [index];
}
