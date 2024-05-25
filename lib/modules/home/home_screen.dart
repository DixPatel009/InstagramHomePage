import 'package:flutter/material.dart';
import 'package:intagramhome/classes/post.dart';
import 'package:intagramhome/classes/story.dart';
import 'package:intagramhome/modules/home/post_action_view.dart';
import 'package:intagramhome/modules/home/post_other_details_view.dart';
import 'package:intagramhome/modules/home/post_user_deatils_view.dart';
import 'package:intagramhome/modules/home/video_player.dart';
import 'package:intagramhome/widgets/app_texts.dart';
import 'package:intagramhome/widgets/image_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<Story> _stories = Story.getData();
  final List<Post> _posts = Post.getPostData();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _createStoryView(context),
            _createPostView(context),
          ],
        ),
      ),
    );
  }

  // Generate Top Story View
  Widget _createStoryView(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _addStoryView(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            height: 110,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 8, right: 8),
              itemCount: _stories.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 96,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(
                            width: 3,
                            color: Colors.transparent,
                          ),
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.purple,
                              Colors.pink,
                              Colors.orange,
                            ],
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(
                            2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: ImageWidget(
                              path: _stories[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 96,
                            ),
                            child: NormalText(
                              text: _stories[index].name,
                              style: AppTextStyle.labelSmall,
                              align: TextAlign.center,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Add(Create) New Story View
  Widget _addStoryView() {
    return InkWell(
      onTap: () {
        //Here Code For Open Add Story View
      },
      child: SizedBox(
        height: 110,
        width: 110,
        child: SizedBox(
          width: 96,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: const SizedBox(
                        width: 70,
                        height: 70,
                        child: ImageWidget(
                          path: 'https://farm4.staticflickr.com/3075/3168662394_7d7103de7d_z_d.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(
                      4,
                    ),
                    margin: const EdgeInsets.only(top: 48.0, right: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        width: 4,
                        color: Colors.white,
                      ),
                      color: Colors.black,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: const Icon(
                        Icons.add,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 96,
                    ),
                    child: const NormalText(
                      text: 'Your Story',
                      style: AppTextStyle.labelSmall,
                      align: TextAlign.center,
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Create Post View Based On Condition
  Widget _createPostView(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _posts.length,
        itemBuilder: (ctx, i) {
          if (_posts[i].contentType == ContentType.video) {
            return createVideoContentLoadView(_posts[i], context, i);
          } else {
            return createImageContentLoadView(_posts[i], context);
          }
        },
      ),
    );
  }

  //Create Image View
  Widget createImageContentLoadView(
    Post post,
    BuildContext context,
  ) {
    return Column(
      children: <Widget>[
        PostUserDetailsView(post: post),
        IntrinsicHeight(
          child: ImageWidget(
            path: post.userPost,
            fit: BoxFit.fitWidth,
          ),
        ),
        const PostActionView(),
        PostOtherDetailsView(post: post),
      ],
    );
  }

  //Create Video View
  Widget createVideoContentLoadView(
    Post post,
    BuildContext context,
    int index,
  ) {
    return Column(
      children: [
        PostUserDetailsView(post: post),
        CustomVideoPlayer(
          post: post,
        ),
        const PostActionView(),
        PostOtherDetailsView(post: post),
      ],
    );
  }

  //Create App Bar
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Image.asset(
            "assets/icons/png/ic_instagram_text.png",
            height: 32,
          ),
          const Spacer(),
          Image.asset(
            "assets/icons/png/ic_like.png",
            height: 24,
          ),
          const SizedBox(
            width: 24,
          ),
          Image.asset(
            "assets/icons/png/ic_chat.png",
            height: 24,
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
