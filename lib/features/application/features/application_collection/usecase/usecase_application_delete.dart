import 'dart:async';

abstract class UsecaseApplicationDeleteTemplate {
  FutureOr<void> execute({required String applicationId});
}
