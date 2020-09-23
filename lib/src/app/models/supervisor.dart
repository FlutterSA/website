import 'package:flutter/foundation.dart';

class Supervisor {
  final String id;
  final String firstName;
  final String lastName;
  final String photoUrl;
  final String description;

  const Supervisor({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.photoUrl,
    @required this.description,
  });
}
