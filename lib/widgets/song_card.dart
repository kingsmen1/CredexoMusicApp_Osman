import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  final trackName;
  final authorName;
  final albumName;
  final onClick;
  const SongCard(
      {required this.trackName,
      required this.authorName,
      required this.albumName,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClick,
      leading: const Icon(Icons.my_library_music_sharp),
      title: Text(trackName),
      contentPadding: const EdgeInsets.all(12),
      subtitle: Padding(
          padding: const EdgeInsets.only(top: 8), child: Text(albumName)),
      trailing: SizedBox(
          width: 100,
          child: Text(
            authorName,
            textAlign: TextAlign.center,
          )),
    );
  }
}
