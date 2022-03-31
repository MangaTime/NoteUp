import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:note_up/core/models/note.dart';
import 'package:note_up/core/viewmodels/screens/home_screen_view_model.dart';
import 'package:note_up/ui/screens/add_note.dart';
import 'package:note_up/ui/shared/view_model_provider.dart';
import 'package:note_up/ui/widgets/paged_animated_list/paged_animated_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PagingController<int, Note> _pagingController;
  @override
  void initState() {
    _pagingController = PagingController(firstPageKey: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ViewModelProvider<HomeScreenViewModel>(
      model: HomeScreenViewModel(context: context),
      builder: (HomeScreenViewModel model) {
        return Scaffold(
            // backgroundColor: Colors.black45,
            // body: PagedAnimatedList(viewModel: model));
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        model.hello();
                        model.addNote();
                      },
                      child: const Text('button')),
                  ElevatedButton(
                      onPressed: () {
                        model.loadMore(model.lastPageKey + 1);
                      },
                      child: const Text('load more')),
                  Expanded(
                      child:
                          // Text("alo")
                          PagedAnimatedList<Note>(
                    model.pagingController,
                    (index, item) => Text(item.content),
                    onRefresh: model.refreshView,
                  ))
                ]),
            bottomNavigationBar: BottomAppBar(
              color: Theme.of(context).colorScheme.background,
              child: IconTheme(
                data: IconThemeData(
                    color: Theme.of(context).colorScheme.onPrimary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      tooltip: 'Add note',
                      icon: const Icon(Icons.playlist_add_rounded),
                      color: Theme.of(context).colorScheme.onBackground,
                      onPressed: () {
                        Navigator.pushNamed(context, "ADD_NOTE");
                      },
                    ),
                    IconButton(
                      tooltip: 'Add folder',
                      icon: const Icon(Icons.create_new_folder_outlined),
                      color: Theme.of(context).colorScheme.onBackground,
                      onPressed: () {},
                    ),
                    IconButton(
                      tooltip: 'Settings',
                      icon: const Icon(Icons.settings_outlined),
                      color: Theme.of(context).colorScheme.onBackground,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ));
      });
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late PagingController<int, Note> _pagingController;
//   @override
//   void initState() {
//     _pagingController = PagingController(firstPageKey: 0);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) => ViewModelProvider<HomeScreenViewModel>(
//       model: HomeScreenViewModel(context: context),
//       builder: (HomeScreenViewModel model) {
//         return Scaffold(
//             backgroundColor: Colors.black45,
//             body: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   ElevatedButton(
//                       onPressed: () {
//                         model.hello();
//                         model.addNote();
//                       },
//                       child: const Text('button')),
//                   Expanded(
//                       child: RefreshIndicator(
//                           onRefresh: () => Future.sync(
//                                 () => {model.refreshView()},
//                               ),
//                           child: ScrollConfiguration(
//                               behavior:
//                                   ScrollConfiguration.of(context).copyWith(
//                                 dragDevices: {
//                                   PointerDeviceKind.touch,
//                                   PointerDeviceKind.mouse,
//                                 },
//                               ),
//                               child: PagedListView<int, Note>(
//                                   pagingController: _pagingController
//                                     ..value = model.pagingState,
//                                   builderDelegate:
//                                       PagedChildBuilderDelegate<Note>(
//                                     // animateTransitions: true,
//                                     // noItemsFoundIndicatorBuilder:
//                                     //     (BuildContext context) =>
//                                     //         const Text("No note here"),
//                                     // transitionDuration:
//                                     //     const Duration(milliseconds: 100),
//                                     itemBuilder: (context, item, index) => Card(
//                                       child: ListTileTheme(
//                                         child: ListTile(
//                                           leading: const FlutterLogo(),
//                                           title: Text(item.content),
//                                         ),
//                                       ),
//                                     ),
//                                   )))))
//                 ]));
//       });
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   static const _pageSize = 20;

//   final PagingController<int, String> _pagingController =
//       PagingController(firstPageKey: 0);

//   @override
//   void initState() {
//     _pagingController.addPageRequestListener((pageKey) {
//       _fetchPage(pageKey);
//     });
//     super.initState();
//   }

//   Future<void> _fetchPage(int pageKey) async {
//     await Future.delayed(const Duration(seconds: 1));
//     try {
//       final newItems = [Random().nextInt(1000).toString()];
//       // final isLastPage = newItems.length < _pageSize;
//       // if (isLastPage) {
//       // _pagingController.appendLastPage(newItems);
//       // } else {
//       final nextPageKey = pageKey + newItems.length;
//       _pagingController.appendPage(newItems, nextPageKey);
//       // }
//     } catch (error) {
//       _pagingController.error = error;
//     }
//   }

//   @override
//   Widget build(BuildContext context) =>
//       // Don't worry about displaying progress or error indicators on screen; the
//       // package takes care of that. If you want to customize them, use the
//       // [PagedChildBuilderDelegate] properties.
//       RefreshIndicator(
//           onRefresh: () => Future.sync(
//                 () => {_pagingController.refresh()},
//               ),
//           child: ScrollConfiguration(
//               behavior: ScrollConfiguration.of(context).copyWith(
//                 dragDevices: {
//                   PointerDeviceKind.touch,
//                   PointerDeviceKind.mouse,
//                 },
//               ),
//               child: PagedListView<int, String>(
//                 pagingController: _pagingController,
//                 builderDelegate: PagedChildBuilderDelegate<String>(
//                   animateTransitions: true,
//                   transitionDuration: const Duration(milliseconds: 1000),
//                   itemBuilder: (context, item, index) => Container(
//                     color: Colors.indigo,
//                     child: Text(item),
//                   ),
//                 ),
//               )));

//   @override
//   void dispose() {
//     _pagingController.dispose();
//     super.dispose();
//   }
// }
