import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@module
abstract class NetworkModule {
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: baseUrl,
    )
  );
}


const String baseUrl = "http://192.168.0.9:3000";