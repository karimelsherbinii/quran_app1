import '/bloc/post_bloc.dart';
import '/data/api/post_api.dart';
import '/data/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
  // Bloc.observer = BlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (context) =>
          PostBloc(PostRepositoryImpl(PostApi()))..add(FeatchPosts()),
      child: const Home(),
    ));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade100,
        title: Center(
            child: const Text(
          'القرأن الكريم',
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: Center(
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const CircularProgressIndicator();
            } else if (state is PostLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, i) {
                  bool haver = false;
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.all(9),
                      color: Colors.green,
                      child: ListTile(
                        title: Text(state.posts[i].name),
                        subtitle: Text(state.posts[i].englishNameTranslation),
                      ),
                    ),
                  );
                },
              );
            } else if (state is PostError) {
              return Text(state.message);
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
