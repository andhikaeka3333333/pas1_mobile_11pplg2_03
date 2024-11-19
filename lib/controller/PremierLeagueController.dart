// controllers/post_controller.dart

import 'package:get/get.dart';
import '../api/PremierLeagueService.dart';
import '../model/ModelTeam.dart';

class PremierLeagueController extends GetxController {
  var isLoading = true.obs;
  var postList = <TeamModel>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await PremierLeagueService().fetchPosts();
      postList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }
}
