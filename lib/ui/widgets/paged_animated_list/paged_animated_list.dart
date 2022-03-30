import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:note_up/core/models/note.dart';
import 'package:note_up/core/viewmodels/screens/home_screen_view_model.dart';
import 'package:note_up/ui/widgets/paged_animated_list/animated_list_item.dart';

class PagedAnimatedList<T> extends StatefulWidget {
  final PagingController<int, T> pagingController;
  final Function? onRefresh;
  final Widget Function(int, T) itemBuilder;

  const PagedAnimatedList(this.pagingController, this.itemBuilder,
      {Key? key, this.onRefresh})
      : super(key: key);

  @override
  State<PagedAnimatedList<T>> createState() => _PagedAnimatedListState<T>();
}

class _PagedAnimatedListState<T> extends State<PagedAnimatedList<T>>
    with SingleTickerProviderStateMixin {
  late PagingController<int, Note> _pagingController;

  @override
  void initState() {
    _pagingController = PagingController(firstPageKey: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _builder(context, itemBuilder, itemCount, lastItemText) => SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (index == itemCount) return Text(lastItemText);
              return itemBuilder(context, index);
            },
            childCount: itemCount + 1,
          ),
        );
    return RefreshIndicator(
        onRefresh: () => Future.sync(
              () => {widget.onRefresh?.call()},
            ),
        child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: CustomScrollView(slivers: <Widget>[
              const SliverToBoxAdapter(
                child: SizedBox(),
              ),
              // const SliverAppBar(
              //   pinned: true,
              //   expandedHeight: 250.0,
              //   flexibleSpace: FlexibleSpaceBar(
              //     title: Text('Demo'),
              //   ),
              // ),
              PagedSliverBuilder<int, T>(
                pagingController: widget.pagingController,
                builderDelegate: PagedChildBuilderDelegate<T>(
                  animateTransitions: false,
                  itemBuilder: (context, item, index) {
                    // (BuildContext context, int index) {
                    return AnimatedListItem(index, item, widget.itemBuilder);
                    // return Card(
                    //   margin: const EdgeInsets.all(15),
                    //   child: Container(
                    //     color: Colors.blue[100 * (index % 9 + 1)],
                    //     height: 80,
                    //     alignment: Alignment.center,
                    //     child: Text(
                    //       "Item $index",
                    //       style: const TextStyle(fontSize: 30),
                    //     ),
                    //   ),
                    // );
                    // },
                    // return _invoiceItem(
                    //   invoiceItem: invoiceItem,
                    //   invoiceItemTileSelectState: null,
                    // );
                    // return const SliverToBoxAdapter(child: Text('example'));
                  },
                  // firstPageErrorIndicatorBuilder: (context) => const SliverToBoxAdapter(
                  //     child: Text('firstPageErrorIndicatorBuilder')),
                  // // ew.ErrorWidget(
                  // //   showImage: true,
                  // //   error: _invoicesViewModel.getPagingController().error as ApiResponse,
                  // //   onTryAgain: () => _invoicesViewModel.getPagingController().refresh(),
                  // // ),
                  // noItemsFoundIndicatorBuilder: (context) => const SliverToBoxAdapter(
                  //     child: Text('noItemsFoundIndicatorBuilder')),
                  // newPageErrorIndicatorBuilder: (context) => const SliverToBoxAdapter(
                  //     child: Text('newPageErrorIndicatorBuilder')),
                  // // _errorListItemWidget(
                  // //     onTryAgain: _invoicesViewModel.retryLastRequest),
                  // firstPageProgressIndicatorBuilder: (context) =>
                  //     const SliverToBoxAdapter(
                  //         child: Text('firstPageProgressIndicatorBuilder')),
                  // // const Center(
                  // //   child: LoadingWidget(),
                  // // ),
                  // newPageProgressIndicatorBuilder: (context) =>
                  //     const SliverToBoxAdapter(
                  //         child: Text('newPageProgressIndicatorBuilder')),
                  // // _loadingListItemWidget(),
                ),
                completedListingBuilder: (
                  context,
                  itemBuilder,
                  itemCount,
                  noMoreItemsIndicatorBuilder,
                ) {
                  return _builder(context, itemBuilder, itemCount,
                      "completedListingBuilder");
                  // return const SliverToBoxAdapter(
                  //     child: DecoratedBox(
                  //         decoration: BoxDecoration(color: Colors.amber),
                  //         child: Text(
                  //           "completedListingBuilder",
                  //         )));
                  // return SliverAnimatedList(
                  //   initialItemCount: itemCount,
                  //   itemBuilder: (
                  //     context,
                  //     index,
                  //     animation,
                  //   ) {
                  //     // final finished = itemCount == index;
                  //     AnimationController _controller = AnimationController(
                  //       duration: const Duration(seconds: 2),
                  //       vsync: this,
                  //     );
                  //     return SlideTransition(
                  //       position: Tween<Offset>(
                  //         begin: Offset.zero,
                  //         end: const Offset(1.5, 0.0),
                  //       ).animate(CurvedAnimation(
                  //         parent: _controller,
                  //         curve: Curves.elasticIn,
                  //       )),
                  //       child: itemBuilder.call(
                  //         context,
                  //         index,
                  //       ),
                  //     );
                  //   },
                  // );
                },
                loadingListingBuilder: (
                  context,
                  itemBuilder,
                  itemCount,
                  progressIndicatorBuilder,
                ) =>
                    _builder(context, itemBuilder, itemCount,
                        "loadingListingBuilder"),
                // const SliverToBoxAdapter(child: Text('loadingListingBuilder')),
                // _loadingListItemWidget(),
                errorListingBuilder: (
                  context,
                  itemBuilder,
                  itemCount,
                  errorIndicatorBuilder,
                ) =>
                    _builder(
                        context, itemBuilder, itemCount, "errorListingBuilder"),
                // const SliverToBoxAdapter(child: Text('errorListingBuilder')),
                //     ew.ErrorWidget(
                //   showImage: true,
                //   error: _invoicesViewModel.getPagingController().error as ApiResponse,
                //   onTryAgain: () => _invoicesViewModel.getPagingController().refresh(),
                // ),
              )
            ])));
  }
}
