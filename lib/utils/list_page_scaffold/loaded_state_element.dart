import 'dart:developer';

import 'package:flutter/material.dart';

class LoadedStateElement extends StatefulWidget {
  final List<Object> items;
  final Widget? Function(BuildContext context, Object item) itemBuilder;
  final bool Function(String searchString, Object item) filterFunc;

  const LoadedStateElement(
      {super.key,
      required this.items,
      required this.itemBuilder,
      required this.filterFunc});

  @override
  State<LoadedStateElement> createState() => _LoadedStateElementState();
}

class _LoadedStateElementState extends State<LoadedStateElement> {
  late List<Object> _items;

  void filterItems(String searchString) {
    setState(() {
      log("message");
      _items = widget.items
          .where(
            (element) => widget.filterFunc(searchString, element),
          )
          .toList();
    });
  }

  @override
  void initState() {
    _items = widget.items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 24.0,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            onChanged: filterItems,
            decoration: InputDecoration(
                labelText: "Поиск",
                hintText: "Начните вводить текст ...",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search)),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) =>
                widget.itemBuilder(context, _items[index]),
          ))
        ],
      ),
    );
  }
}
