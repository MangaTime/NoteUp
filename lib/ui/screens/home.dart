import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:note_up/core/models/note.dart';
import 'package:note_up/core/viewmodels/screens/home_screen_view_model.dart';
import 'package:note_up/ui/screens/note.dart';
import 'package:note_up/ui/shared/view_model_provider.dart';
import 'package:realm/realm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ViewModelProvider<HomeScreenViewModel>(
      model: HomeScreenViewModel(context: context),
      builder: (HomeScreenViewModel model) {
        return Scaffold(
            // backgroundColor: Colors.black45,
            // body: PagedAnimatedList(viewModel: model));
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
              // ElevatedButton(
              //     onPressed: () {
              //       model.addNote();
              //     },
              //     child: const Text('button')),
              // ElevatedButton(
              //     onPressed: () {
              //       model.loadMore(model.lastPageKey + 1);
              //     },
              //     child: const Text('load more')),
              Expanded(
                  child: ListView(
                children: [
                  {
                    "title": "Pinned",
                    "icon": Icons.push_pin_outlined,
                    "data": model.pinned
                  },
                  {
                    "title": "Folders",
                    "icon": Icons.folder_open,
                    "data": model.dirs
                  },
                  {"title": "Notes", "icon": Icons.list, "data": model.notes}
                ].map(
                  (e) {
                    return ExpansionTile(
                      initiallyExpanded: true,
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(e['icon'] as IconData)),
                          Text(e['title'] as String),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Badge(
                              toAnimate: false,
                              shape: BadgeShape.circle,
                              badgeColor: Colors.grey,
                              elevation: 0,
                              badgeContent: Text(
                                  (e['data'] as RealmResults<Note>)
                                      .length
                                      .toString(),
                                  style: const TextStyle(color: Colors.white)),
                            ),
                          )
                        ],
                      ),
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: (e['data'] as RealmResults<Note>).length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                  onTap: () {
                                    Navigator.pushNamed(context, "ADD_NOTE",
                                        arguments: NoteRouteArguments(
                                            id: (e['data'] as RealmResults<
                                                    Note>)[index]
                                                .id));
                                  },
                                  title: Text(
                                      (e['data'] as RealmResults<Note>)[index]
                                          .title));
                            })
                      ],
                    );
                  },
                ).toList(),
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
