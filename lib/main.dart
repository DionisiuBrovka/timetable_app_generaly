import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timetable_app_generaly/page/group_list_page/group_list_page.dart';
import 'package:timetable_app_generaly/page/teacher_list_page/teacher_list_page.dart';
import 'package:timetable_app_generaly/services/group_service/group_service.dart';

void main() async {
  Hive.initFlutter();

  GetIt.I.registerSingletonAsync(
    () async {
      final GroupService service = GroupService();
      await service.init();
      return service;
    },
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blueGrey, brightness: Brightness.dark)),
      home: MainTestPage(),
    );
  }
}

class MainTestPage extends StatelessWidget {
  const MainTestPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 16.0,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FilledButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GroupListPage(),
                      )),
                  child: Text("Группы")),
              FilledButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeacherListPage(),
                      )),
                  child: Text("Преподаватели")),
              FilledButton(onPressed: () {}, child: Text("Кабинеты")),
              FilledButton(onPressed: () {}, child: Text("Предметы")),
              FilledButton(onPressed: () {}, child: Text("Типы занятий")),
            ],
          ),
        ),
      ),
    );
  }
}
