part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final  List<Data> posts;

  PostLoaded(this.posts);
}

class PostError extends PostState {
  final String message;
  PostError({required this.message});
}
