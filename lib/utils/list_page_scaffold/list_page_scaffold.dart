import 'package:flutter/material.dart';

class ListPageScaffold extends StatelessWidget {
  final Widget? title;
  final Widget? addDialog;
  final bool isLoading = false;

  const ListPageScaffold({super.key, this.title, this.addDialog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: title,
          foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: !isLoading
            ? FloatingActionButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: addDialog,
                  ),
                ),
                child: Icon(Icons.add),
              )
            : null);
  }
}
