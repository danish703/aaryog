import 'package:better_uuid/uuid.dart';

int generateId() {
  var id = Uuid.v1();

  return int.parse(id.time.toString().substring(11));
}
