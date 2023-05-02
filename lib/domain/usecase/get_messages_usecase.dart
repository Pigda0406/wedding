

import 'package:martin_michelle/domain/entities/text_message_entity.dart';
import 'package:martin_michelle/domain/repositories/firebase_repository.dart';

class GetMessagesUseCase {
  final FireBaseRepository repository;

  GetMessagesUseCase({this.repository});

  Stream<List<TextMessageEntity>> call() => repository.getMessages();

}