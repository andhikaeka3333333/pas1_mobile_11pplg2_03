import 'package:flutter/material.dart';
import '../../component_pages/adapter_list_team_tablet.dart';
import 'package:get/get.dart';

import '../../controller/PremierLeagueController.dart';
import '../../widget/colors.dart';

class PremierLeagueMenuTablet extends StatelessWidget {
  final PremierLeagueController postController = Get.put(PremierLeagueController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: (Get.width / 1200),
            childAspectRatio: context.isLandscape ? 4 / 3 : 4 / 4,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: postController.postList.length,
          itemBuilder: (context, index) {
            final post = postController.postList[index];
            if (post.strBadge.isEmpty) return SizedBox.shrink();
            return AdapterListTablet(modelTeam: post);
          },
        );
      }),
    );
  }
}
