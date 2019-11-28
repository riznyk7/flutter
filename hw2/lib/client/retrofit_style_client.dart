import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/user.dart';

part 'retrofit_style_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/users")
  Future<List<User>> getUsers();


}
