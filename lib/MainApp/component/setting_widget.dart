// // ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

// ignore: must_be_immutable
class ListTileWidget extends StatelessWidget {
  String title;
  IconData icon;
  VoidCallback onTap;

  Color color;
  ListTileWidget(
      {Key key,
      this.title,
      this.color,
      this.icon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Column(
        children: [
          ListTile(
            title: Text(title),
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(5)),
              child: Icon(icon, size: 20, color: Colors.white),
            ),
            trailing: const Icon(
              FeatherIcons.chevronRight,
              size: 20,
            ),
            onTap: onTap,
          ),
          const Divider(
            height: 3,
          )
        ],
      ),
    );
  }
}
