// Modelo de categoría
import 'package:flutter/material.dart';

class Category {
  final String title;
  final IconData icon;
  final int id;

  Category({required this.title, required this.icon, required this.id});
}

class Status {
  final String title;
  final IconData icon;
  final int id;

  Status({required this.title, required this.icon, required this.id});
}

class Priority {
  final String title;
  final String description;
  final int id;

  Priority({required this.title, required this.description, required this.id});
}

class Frequency {
  final String title;
  final String description;
  final int id;

  Frequency({required this.title, required this.description, required this.id});
}

class Roles {
  final int id;
  final String nameRol;
  final String descriptionRol;

  Roles({required this.id, required this.nameRol, required this.descriptionRol});
}

class Taskperson {
  final int id;
  final String? namePerson;
  final String? imagePerson;
  final int? rolId;
  final String? nameRole;

  Taskperson({required this.id, this.namePerson, this.imagePerson, this.rolId, this.nameRole});
}

class Taskfamily {
  final int person_id;
  final int? role_id;
  final int? home_id;

  Taskfamily(
    this.person_id,
    this.role_id,
    this.home_id,
  );
}
