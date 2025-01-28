import 'package:flutter/material.dart';
import 'package:timetable_app_generaly/utils/list_page_scaffold/loaded_state_element.dart';
import 'package:timetable_app_generaly/utils/list_page_scaffold/loading_state_element.dart';

class ListPageScaffold extends StatelessWidget {
  final Widget? title;
  final bool isLoading;
  final List<Object>? items;
  final Widget? Function(BuildContext context, Object item)? itemBuilder;

  final Widget? addDialog;

  const ListPageScaffold(
      {super.key,
      this.title,
      required this.isLoading,
      this.items,
      this.itemBuilder,
      this.addDialog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildFloatingActionButton(context),
      body: _buildBody(),
    );
  }

  Widget? _buildFloatingActionButton(BuildContext context) {
    if (!isLoading) {
      if (addDialog != null) {
        return FloatingActionButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => Dialog(
              child: addDialog,
            ),
          ),
          child: Icon(Icons.add),
        );
      }
    }
    return null;
  }

  Widget _buildBody() {
    if (isLoading) {
      return LoadingStateElement();
    } else {
      try {
        return LoadedStateElement(
          items: items!,
          itemBuilder: itemBuilder!,
          filterFunc: (searchString, item) =>
              (item as String).contains(searchString),
        );
      } catch (e) {
        throw FieldsError;
      }
    }
  }
}

class FieldsError extends Error {}
