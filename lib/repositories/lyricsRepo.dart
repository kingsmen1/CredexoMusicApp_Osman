import '../models/track_lyrics.dart';
import 'package:http/http.dart' as http;

class LyricsRepo {
  Stream<Lyrics?> getTrackList({required int trackId}) async* {
    String baseUrl =
        'https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackId&apikey=b3e490c16a31352ad0cfbbf52df5cdeb';
    // 'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=b3e490c16a31352ad0cfbbf52df5cdeb';

    var trackList;
    try {
      var client = http.Client();

      Uri uri = Uri.parse(baseUrl);

      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        final responseString = postFromJson(json);
        trackList = Post(message: responseString.message).message.body.lyrics;
      }

      yield trackList as Lyrics?;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
