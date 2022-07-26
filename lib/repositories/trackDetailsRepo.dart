import 'dart:io';

import 'package:credicxo_music_app/models/track.dart';
import 'package:http/http.dart' as http;

class TrackDetailsRepo {
  Future<Track> getTrackDetails({required int TRACK_ID}) async {
    print('TrackDetailsREpo Runned');
    var baseUrl =
        'https://api.musixmatch.com/ws/1.1/track.get?track_id=$TRACK_ID&apikey=b3e490c16a31352ad0cfbbf52df5cdeb';

    var result = 'Something Went Wrong ';
    var track;
    try {
      var client = http.Client();

      Uri uri = Uri.parse(baseUrl);

      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        final responseString = postFromJson(json);
        track = Post(message: responseString.message).message.body.track;
        result = 'success';
        // print(result);
        // print(track);
      }
    } on HttpException catch (error) {
      result = error.toString();
      print(error);
    } catch (error) {
      print(error);
      rethrow;
    }
    return track as Track;
  }
}
