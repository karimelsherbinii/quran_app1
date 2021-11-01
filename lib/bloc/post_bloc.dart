import 'package:bloc/bloc.dart';
import '../data/models/model.dart';
import '../data/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;
  //List<Post> posts = [];
  PostBloc(this.repository) : super(PostInitial()) {
    // ignore: void_checks
    on<PostEvent>((event, emit) async {
      if (event is PostEvent) {
        emit(PostLoading());
        try {
          final posts = await repository.getAllPosts();
          // print(posts.toString());
          emit(PostLoaded(posts));
        } catch (e) {
          emit(PostError(message: e.toString()));
        }
      }
    });
  }
}
