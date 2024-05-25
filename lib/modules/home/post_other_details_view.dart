import 'package:flutter/material.dart';
import 'package:intagramhome/classes/post.dart';
import 'package:intagramhome/widgets/app_texts.dart';

class PostOtherDetailsView extends StatelessWidget {
  Post post;

  PostOtherDetailsView({
    required this.post,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NormalText(
            text: '${post.postLikeCount} likes',
            color: Colors.black,
            style: AppTextStyle.bodySmall,
            weight: FontWeight.w700,
          ),
          RichText(
            softWrap: true,
            overflow: TextOverflow.visible,
            maxLines: 2,
            text: TextSpan(
              children: [
                TextSpan(
                  text: post.userName,
                  style: textStyle(context, AppTextStyle.bodySmall, FontWeight.w700).copyWith(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                TextSpan(
                  text: " ${post.userCaption}",
                  style: textStyle(context, AppTextStyle.bodySmall, FontWeight.w400).copyWith(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          NormalText(
            text: post.postAddedDate,
            color: Colors.black45,
            style: AppTextStyle.labelSmall,
            weight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
