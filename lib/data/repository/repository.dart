import 'dart:convert';

import '/bloc/post_bloc.dart';
import '/contants/strings.dart';
import '/data/api/post_api.dart';
import '/data/models/model.dart';
import 'package:dio/dio.dart';

abstract class PostRepository {
// this stip after model
  Future<List<Data>> getAllPosts();
}

// 3mlt override Automatic
class PostRepositoryImpl extends PostRepository {
  //var dio = Dio();

  final PostApi postApi;

  PostRepositoryImpl(this.postApi);
  @override
  Future<List<Data>> getAllPosts() async {
    final posts = await postApi.getAllPosts();
    // final posts = await jsonDecode(postApigetAllPosts());

    return posts.map<Data>((s) => Data.fromJson(s)).toList();
  }

  // this is a natural way without api file
  // @override
  // Future<List<Post>> getAllPosts() async {
  //   final response =
  //       await dio.get(baseUrl);

  //   if (response.statusCode == 200) {
  //     final posts = jsonDecode(response.data).cast<Map<String, dynamic>>();
  //     return posts.map<Post>((post) => Post.fromJson(post)).toList();
  //   } else {
  //     throw Exception('sorry we have error');
  //   } // b3d kda b2a nrbot el repository b el bloc
  // }
}
