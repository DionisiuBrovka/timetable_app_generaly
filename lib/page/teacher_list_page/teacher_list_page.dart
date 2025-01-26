import 'package:flutter/material.dart';
import 'package:timetable_app_generaly/utils/list_page_scaffold/list_page_scaffold.dart';

class TeacherListPage extends StatelessWidget {
  const TeacherListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListPageScaffold(
      title: Text("Преподаватели"),
    );
  }
}
