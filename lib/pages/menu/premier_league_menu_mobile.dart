import 'package:flutter/material.dart';
import '../../component_pages/adapter_list_team.dart';
import 'package:get/get.dart';

import '../../controller/PremierLeagueController.dart';
import '../../widget/colors.dart';

class PremierLeagueMenuMobile extends StatelessWidget {
  final PremierLeagueController postController = Get.put(PremierLeagueController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: postController.postList.length,
          itemBuilder: (context, index) {

            final post = postController.postList[index];
            if (post.strBadge.isEmpty) return SizedBox.shrink();
            return AdapterListTeam(modelTeam: post);
          },
        );
      }),
    );
  }
}
