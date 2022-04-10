import 'package:flutter/material.dart';

class AnimatedListItem<T> extends StatefulWidget {
  final int index;
  final T item;
  final Widget Function(int, T) itemBuilder;
  const AnimatedListItem(this.index, this.item, this.itemBuilder, {Key? key})
      : super(key: key);

  @override
  State<AnimatedListItem<T>> createState() => _AnimatedListItemState<T>();
}

class _AnimatedListItemState<T> extends State<AnimatedListItem<T>> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => {
          setState(() {
            _animate = true;
          })
        });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: _animate ? 1 : 0,
      curve: Curves.easeInOutQuart,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        padding:
            _animate ? const EdgeInsets.all(4.0) : const EdgeInsets.all(40),
        child: Container(
          color: Colors.blue[100 * (widget.index % 9 + 1)],
          constraints: const BoxConstraints.expand(height: 100),
          child: Card(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.itemBuilder.call(widget.index, widget.item)),
          ),
        ),
      ),
    );
  }
}
