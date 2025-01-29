import 'package:flutter/material.dart';
import 'package:timetable_app_generaly/utils/list_page_scaffold/list_page_scaffold.dart';

class TeacherListPage extends StatelessWidget {
  const TeacherListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListPageScaffold<String>(
      title: Text("Преподаватели"),
      isLoading: false,
      items: ["a", "b", "c", "82ТП", "Бровка Дионисий Сергеевич"],
      itemBuilder: (context, item) => Card(
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          leading: Icon(Icons.person),
          title: Text(item),
          subtitle: Text("Какойто учительы"),
          onTap: () {},
        ),
      ),
      addDialog: SizedBox(
        height: 100,
        width: 200,
        child: Center(
          child: FilledButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: SizedBox(width: 1000, child: Text("data")),
                  ),
                );
              },
              child: Text("data")),
        ),
      ),
    );
  }
}
