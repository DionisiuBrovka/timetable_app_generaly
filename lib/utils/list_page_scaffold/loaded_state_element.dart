import 'dart:developer';

import 'package:flutter/material.dart';

class LoadedStateElement<T> extends StatefulWidget {
  final List<T> items;
  final Widget? Function(BuildContext context, dynamic item) itemBuilder;
  final bool Function(String searchString, dynamic searchField) filterFunc;

  const LoadedStateElement(
      {super.key,
      required this.items,
      required this.itemBuilder,
      required this.filterFunc});

  @override
  State<LoadedStateElement> createState() => _LoadedStateElementState<T>();
}

class _LoadedStateElementState<T> extends State<LoadedStateElement> {
  late List<T> _items;

  void filterItems(String searchString) {
    setState(() {
      log("message");
      _items = (widget.items as List<T>)
          .where(
            (T element) => widget.filterFunc(searchString, element),
          )
          .toList();
    });
  }

  @override
  void initState() {
    filterItems("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 14.0,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterItems,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  labelText: "Поиск",
                  hintText: "Начните вводить текст ...",
                  border: UnderlineInputBorder(),
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
          _listBuilder()
        ],
      ),
    );
  }

  Widget _listBuilder() {
    if (widget.items.isEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 24,
        children: [
          Icon(
            Icons.note_add_outlined,
            size: 60,
            color: Color.fromARGB(255, 99, 99, 99),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Кажется тут ничего нет ...",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 99, 99, 99),
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Добавте новые записи с помощью кнопки +",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 99, 99, 99),
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ],
      );
    }

    if (_items.isEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 24,
        children: [
          Icon(
            Icons.sentiment_dissatisfied_sharp,
            size: 60,
            color: Color.fromARGB(255, 99, 99, 99),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Упс, кажется мы не смогли ничего найти ...",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 99, 99, 99),
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Попробуйте ввести новый поисковой запрос или поробывать еще раз",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 99, 99, 99),
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ],
      );
    }
    return Expanded(
      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) =>
            widget.itemBuilder(context, _items[index]),
      ),
    );
  }
}
