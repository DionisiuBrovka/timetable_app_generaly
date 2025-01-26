import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:timetable_app_generaly/services/group_service/group_service.dart';

class GroupListPage extends StatelessWidget {
  const GroupListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                builder: (context) => Dialog(
                      insetPadding: EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: 300,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            spacing: 16,
                            children: [
                              Text(
                                "Добавление группы",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    labelText: "Название группы",
                                    border: OutlineInputBorder(),
                                    hintText: "Например 87КР ..."),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: false,
                                    onChanged: (value) {},
                                    semanticLabel: "Активна ли группа",
                                  ),
                                  Text("Активна ли группа")
                                ],
                              ),
                              FilledButton(
                                  onPressed: () {}, child: Text("Добавить"))
                            ],
                          ),
                        ),
                      ),
                    ),
                context: context);
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text("Группы"),
          foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 600,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Поиск",
                          hintText: "начните вводить ...",
                          suffixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surface),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: GetIt.I<GroupService>().getGroupList().length,
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (context, index) => ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.group,
                          size: 40,
                        ),
                        title: Text(GetIt.I<GroupService>()
                            .getGroupList()[index]
                            .groupName),
                        subtitle: Text("data"),
                        trailing: IconButton.filledTonal(
                          onPressed: () {},
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
