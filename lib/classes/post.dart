import 'package:video_player/video_player.dart';

class Post {
  final String userImage;
  final String userName;
  final String userLocation;
  final String userAddedSong;
  final String userPost;
  final String userCaption;
  final String postAddedDate;
  final String postLikeCount;
  final ContentType contentType;
  VideoPlayerController? videoPlayerController;

  Post({
    required this.userImage,
    required this.userName,
    required this.userLocation,
    required this.userAddedSong,
    required this.userPost,
    required this.userCaption,
    required this.postAddedDate,
    required this.postLikeCount,
    required this.contentType,
  });

  static List<Post> getPostData() {
    return [
      Post(
        userName: "Raj",
        userImage: "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250",
        userPost: "https://farm2.staticflickr.com/1533/26541536141_41abe98db3_z_d.jpg",
        userLocation: "Ahmedabad",
        userAddedSong: "",
        userCaption: "Flutter is a cross-platform UI toolkit that is designed to allow code reuse across operating systems such as iOS and Android, while also allowing applications to interface directly with underlying platform services.",
        postAddedDate: "22 May",
        postLikeCount: "532",
        contentType: ContentType.image
      ),
      Post(
        userName: "Mayur",
        userImage: "https://i.pravatar.cc/250?u=mail@ashallendesign.co.uk",
        userPost: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        userLocation: "Delhi",
        userAddedSong: "",
        userCaption: "The layer model: The pieces from which Flutter is constructed.",
        postAddedDate: "28 September 2021",
        postLikeCount: "5624",
        contentType: ContentType.video,
      ),
      Post(
        userName: "Virat Kohli",
        userImage: "https://baconmockup.com/250/250/",
        userPost: "https://farm9.staticflickr.com/8505/8441256181_4e98d8bff5_z_d.jpg",
        userLocation: "Mumbai",
        userAddedSong: "",
        userCaption: "A core concept for Flutter user interface development.",
        postAddedDate: "12 March 2023",
        postLikeCount: "9852",
        contentType: ContentType.image,
      ),
      Post(
        userName: "Bhawna",
        userImage: "http://placebear.com/250/250",
        userPost: "https://farm3.staticflickr.com/2220/1572613671_7311098b76_z_d.jpg",
        userLocation: "Surat",
        userAddedSong: "",
        userCaption: "The fundamental building blocks of Flutter user interfaces.",
        postAddedDate: "10 August 2018",
        postLikeCount: "10",
        contentType: ContentType.image,
      ),
      Post(
        userName: "Rahul",
        userImage: "https://robohash.org/mail@ashallendesign.co.uk",
        userPost: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        userLocation: "Bangalore",
        userAddedSong: "",
        userCaption: "How Flutter turns UI code into pixels.",
        postAddedDate: "15 May",
        postLikeCount: "5468",
        contentType: ContentType.video,
      ),
      Post(
        userName: "Suresh Raina",
        userImage: "http://placebear.com/250/250",
        userPost: "https://farm7.staticflickr.com/6089/6115759179_86316c08ff_z_d.jpg",
        userLocation: "Pune",
        userAddedSong: "",
        userCaption: "The code that lets mobile and desktop OSes execute Flutter apps.",
        postAddedDate: "26 December 2023",
        postLikeCount: "78",
        contentType: ContentType.image,
      ),
      Post(
        userName: "Rohit Sharma",
        userImage: "http://placebear.com/250/250",
        userPost: "https://farm4.staticflickr.com/3075/3168662394_7d7103de7d_z_d.jpg",
        userLocation: "Rajkot",
        userAddedSong: "",
        userCaption: "Information about different techniques available to Flutter apps.",
        postAddedDate: "10 June 2021",
        postLikeCount: "123",
        contentType: ContentType.image,
      ),
      Post(
        userName: "Suryakumar Yadav",
        userImage: "http://placekitten.com/250/250",
        userPost: "https://farm9.staticflickr.com/8295/8007075227_dc958c1fe6_z_d.jpg",
        userLocation: "Taj Mahal",
        userAddedSong: "",
        userCaption: "Concluding remarks about the characteristics of Flutter in a browser environment.",
        postAddedDate: "13 June 1996",
        postLikeCount: "654",
        contentType: ContentType.image,
      ),
    ];
  }
}

enum ContentType { image, video }
