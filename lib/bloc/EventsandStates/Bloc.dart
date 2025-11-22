import 'package:bloctest/api/api_calls.dart';
import 'package:bloctest/bloc/EventsandStates/Event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Postbloc extends Bloc<PostEvent,PostSate>{
final PostRepository repository;
Postbloc(this.repository) : super(Postinitial()) {
  on<LoadPosts>(_onLoadPosts);
  on<Refreshpost>(_onLoadPosts);
}
Future<void>_onLoadPosts(PostEvent event, Emitter<PostSate>emit) async {
  emit(PostLoading());
  try{
    final posts = await repository.fetchpost();
    emit(PostLoaded(posts));
  }
  catch(e){
    emit(ErrorState("Failed to load post $e"));
  }

}
}