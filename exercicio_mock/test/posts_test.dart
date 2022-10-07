import 'package:flutter_application_1/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'posts_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('retornar um post com sucesso', ()async{
    final client = MockClient();

    when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')))
    .thenAnswer((_) async => 
    http.Response('{"userId": 1, "id": 1, "title": "mock", "body": "mock"}', 200));
    expect(await fetchPosts(), isA<Posts>());
  });
}