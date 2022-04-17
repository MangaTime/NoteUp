import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:note_up/core/models/note.dart';
import 'package:note_up/ui/routes/app_routes.dart';
import 'package:note_up/ui/screens/note.dart';
import 'package:realm/realm.dart';

class HomeNoteSection extends StatelessWidget {
  const HomeNoteSection({
    required this.section,
    Key? key,
  }) : super(key: key);
//TODO: help me define a class for this pls
  final section;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(section['icon'] as IconData)),
          Text(section['title'] as String),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Badge(
              toAnimate: false,
              shape: BadgeShape.circle,
              badgeColor: Colors.grey,
              elevation: 0,
              badgeContent: Text(
                  (section['data'] as RealmResults<Note>).length.toString(),
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
            itemCount: (section['data'] as RealmResults<Note>).length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.addNote.route,
                        arguments: NoteRouteArguments(
                            id: (section['data'] as RealmResults<Note>)[index]
                                .id));
                  },
                  title: Text(
                      (section['data'] as RealmResults<Note>)[index].title));
            })
      ],
    );
  }
}
