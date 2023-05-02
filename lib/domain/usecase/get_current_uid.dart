

import 'package:martin_michelle/domain/repositories/firebase_repository.dart';

class GetCurrentUid{
  final FireBaseRepository repository;

  GetCurrentUid({this.repository});

  Future<String> call() async => await repository.getCurrentUid();

}