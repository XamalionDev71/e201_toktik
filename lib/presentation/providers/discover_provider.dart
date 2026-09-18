import 'package:e201_toktik/domain/entities/video_post.dart';
import 'package:e201_toktik/infrastructure/models/local_video_model.dart';
import 'package:e201_toktik/shared/data/local_video_post.dart';
import 'package:flutter/material.dart';

class DiscoverProvider extends ChangeNotifier {
  //TODO: Repositorios, Datasource

  bool initialLoading = true;

  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
