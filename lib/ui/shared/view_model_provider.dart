import 'package:flutter/material.dart';
import 'package:note_up/core/viewmodels/base_view_model.dart';
import 'package:provider/provider.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatelessWidget {
  final T model;
  final Widget Function(T model) builder;

  const ViewModelProvider(
      {Key? key, required this.builder, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context2) => model,
      child: Consumer<T>(
        builder: (BuildContext context, T value, Widget? child) =>
            builder(value),
      ),
    );
  }
}
