import 'dart:async';
import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';
import 'package:domain/models/models.dart';

abstract class WatchEmbedsUsecase {
  Stream<List<EmbeddedResourceModel>> execute(String applicationId);
}

@Injectable(as: WatchEmbedsUsecase)
class WatchEmbedsUsecaseImpl extends WatchEmbedsUsecase {
  WatchEmbedsUsecaseImpl(this._repo);

  final EmbedsRepository _repo;

  @override
  Stream<List<EmbeddedResourceModel>> execute(String applicationId) {
    return _repo.watchEmbeds(applicationId);
  }
}
