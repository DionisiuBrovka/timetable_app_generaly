import 'package:flutter/material.dart';

class LoadingStateElement extends StatelessWidget {
  const LoadingStateElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
