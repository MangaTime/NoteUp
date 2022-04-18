import 'package:flutter/material.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({Key? key}) : super(key: key);

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const TextField(
            autofocus: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 16, right: 24),
                hintText: "Folder Name"),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => {Navigator.pop(context)},
          ),
        ),
        body: Row(
          children: [
            Icons.admin_panel_settings_outlined,
            Icons.favorite_border_outlined,
            Icons.bug_report_outlined,
            Icons.build_outlined,
            Icons.bookmark_add_outlined,
            Icons.assignment_turned_in_outlined,
            Icons.fingerprint_outlined,
            Icons.alarm_outlined,
            Icons.close_fullscreen_outlined,
            Icons.donut_large_outlined
          ].map(
            (e) {
              return Expanded(
                child: IconButton(
                  icon: Icon(e),
                  iconSize: 48,
                  onPressed: () {},
                ),
              );
            },
          ).toList(),
        ));
  }
}
