// import 'dart:math';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:note_up/core/models/note.dart';
// import 'package:note_up/core/viewmodels/screens/home_screen_view_model.dart';
// import 'package:note_up/ui/screens/add_note.dart';
// import 'package:note_up/ui/shared/view_model_provider.dart';
// import 'package:note_up/ui/widgets/paged_animated_list/paged_animated_list.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) => ViewModelProvider<HomeScreenViewModel>(
//       model: HomeScreenViewModel(context: context),
//       builder: (HomeScreenViewModel model) {
//         return Scaffold(
//             // backgroundColor: Colors.black45,
//             // body: PagedAnimatedList(viewModel: model));
//             body: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   ElevatedButton(
//                       onPressed: () {
//                         model.addNote();
//                       },
//                       child: const Text('button')),
//                   ElevatedButton(
//                       onPressed: () {
//                         model.loadMore(model.lastPageKey + 1);
//                       },
//                       child: const Text('load more')),
//                   Expanded(
//                       child:
//                           // Text("alo")
//                           PagedAnimatedList<Note>(
//                     model.pagingController,
//                     (index, item) => Text(item.title),
//                     onRefresh: model.refreshView,
//                   ))
//                 ]),
//             bottomNavigationBar: BottomAppBar(
//               color: Theme.of(context).colorScheme.background,
//               child: IconTheme(
//                 data: IconThemeData(
//                     color: Theme.of(context).colorScheme.onPrimary),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     IconButton(
//                       tooltip: 'Add note',
//                       icon: const Icon(Icons.playlist_add_rounded),
//                       color: Theme.of(context).colorScheme.onBackground,
//                       onPressed: () {
//                         Navigator.pushNamed(context, "ADD_NOTE");
//                       },
//                     ),
//                     IconButton(
//                       tooltip: 'Add folder',
//                       icon: const Icon(Icons.create_new_folder_outlined),
//                       color: Theme.of(context).colorScheme.onBackground,
//                       onPressed: () {},
//                     ),
//                     IconButton(
//                       tooltip: 'Settings',
//                       icon: const Icon(Icons.settings_outlined),
//                       color: Theme.of(context).colorScheme.onBackground,
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ));
//       });
// }
