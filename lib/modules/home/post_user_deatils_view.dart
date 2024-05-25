import 'package:flutter/material.dart';
import 'package:intagramhome/classes/post.dart';
import 'package:intagramhome/widgets/app_texts.dart';
import 'package:intagramhome/widgets/image_widget.dart';

class PostUserDetailsView extends StatelessWidget {
  Post post;

  PostUserDetailsView({
    required this.post,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const SizedBox(
          width: 16,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: SizedBox(
            height: 36,
            width: 36,
            child: ImageWidget(
              path: post.userImage,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NormalText(
                text: post.userName,
                style: AppTextStyle.labelLarge,
                align: TextAlign.center,
                color: Colors.black,
                weight: FontWeight.w600,
              ),
              NormalText(
                text: post.userAddedSong.isNotEmpty ? post.userAddedSong : post.userLocation,
                style: AppTextStyle.bodySmall,
                align: TextAlign.center,
                color: Colors.black,
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Icon(
            Icons.more_horiz_outlined,
          ),
        )
      ],
    );
  }
}
