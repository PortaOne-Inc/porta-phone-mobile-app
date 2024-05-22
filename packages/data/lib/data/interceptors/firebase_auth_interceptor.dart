import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthInterceptor extends Interceptor {
  FirebaseAuthInterceptor(this.firebaseAuth);

  final FirebaseAuth firebaseAuth;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await firebaseAuth.currentUser?.getIdToken();
    final authToken = 'Bearer $token';
    options.headers['Authorization'] = authToken;
    handler.next(options);
  }
}
