// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:typed_data';

import '../models/signature.dart';
import '../services/post_request.dart';

class TwitterApi {
  static String createTweetUrl = 'https://api.twitter.com/2/tweets';
  static Future<TwitterApiResponse> postTweet({
    required String apiKey,
    required String apiSecretKey,
    required String oauthToken,
    required String oauthTokenSecret,
    required dynamic body,
  }) async {
    // await httpPost(
    //   'https://api.twitter.com/2/tweets',
    //   requestHeader(
    //     apiKey: 'E6LGuEE3S3TPFGxZ76FoVBMgE',
    //     oauthToken: '1430119184055246854-DAXRtk4OFbX6QXro6CvF08dWWrG5mx',
    //   ),
    //   {'text': 'Testing twitter API! This tweet is created from the postman. '},
    //   'E6LGuEE3S3TPFGxZ76FoVBMgE',
    //   'B4ORZMSmIkhnzorvtmzaJGK4iwghcI5i371kYAV0Y8J8mT3FDm',
    //   'XA7eNAJ2UvDdOZmUP14KdUHj4aqeaKhixf3UksaVNou0u',
    // );

    final response = await httpPost(
      createTweetUrl,
      requestHeader(
        apiKey: apiKey,
        oauthToken: oauthToken,
      ),
      body,
      apiKey,
      apiSecretKey,
      oauthTokenSecret,
    );

    return response;
  }

  static String uploadMediaUrl =
      'https://upload.twitter.com/1.1/media/upload.json';

  static Future<TwitterApiResponse> uploadMedia({
    required String apiKey,
    required String apiSecretKey,
    required String oauthToken,
    required String mediaType,
    required String oauthTokenSecret,
    required Uint8List body,
  }) async {
    print(uploadMediaUrl + mediaType);
    return await httpPostMedia(
      "$uploadMediaUrl?media_category=$mediaType",
      body,
      requestHeader(
        apiKey: apiKey,
        oauthToken: oauthToken,
      ),
      apiKey,
      apiSecretKey,
      oauthTokenSecret,
    );
  }
}
