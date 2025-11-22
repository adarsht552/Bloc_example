import 'dart:convert';

import 'package:bloctest/model/post.dart';
import 'package:http/http.dart' as http;
class PostRepository {
  final http.Client client;

  PostRepository(this.client);

// The corrected fetchpost method
Future<List<Post>> fetchpost() async {
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  final response = await client.get(uri);
  
  if (response.statusCode == 200) {
    // 1. Decode the response body into a List<dynamic>
    final List<dynamic> responseBody = jsonDecode(response.body);

    // 2. Map the list of dynamic objects to a List<Post>
    final List<Post> posts = responseBody
        .map((postJson) => Post.fromJson(postJson as Map<String, dynamic>))
        .toList();

    return posts; // 3. Return the List<Post>
  } else {
    throw Exception("Failed to load posts with status code: ${response.statusCode}");
  }
}

}