import 'package:http/http.dart' as http;

import '../models/track_list.dart';

class GetTracksRepo {
  Stream<List<TrackList>?> getTrackList() async* {
    const baseUrl =
        'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=b3e490c16a31352ad0cfbbf52df5cdeb';

    var trackList;
    try {
      var client = http.Client();

      Uri uri = Uri.parse(baseUrl);

      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        final responseString = postFromJson(json);
        trackList =
            Post(message: responseString.message).message.body.trackList;
      }

      yield trackList as List<TrackList>?;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
