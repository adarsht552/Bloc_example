import 'package:bloctest/model/post.dart';

abstract class PostEvent {}

class LoadPosts extends PostEvent{}
class Refreshpost extends PostEvent{}

// State

abstract class PostSate{}
class Postinitial extends PostSate {}

class PostLoading extends PostSate{}

class PostLoaded extends PostSate {
  final List<Post> posts;
  PostLoaded(this.posts);
}

class ErrorState extends PostSate {
  final String message;
  ErrorState(this.message);
}
