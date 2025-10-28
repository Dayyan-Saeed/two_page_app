class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class ThreadPost {
  final String name;
  final String handle;
  final String content;
  final String timeAgo;
  final String avatarUrl;
  final int likes;
  final int comments;
  final int shares;

  ThreadPost({
    required this.name,
    required this.handle,
    required this.content,
    required this.timeAgo,
    required this.avatarUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}

class Comment {
  final String name;
  final String handle;
  final String content;
  final String timeAgo;
  final String avatarUrl;
  final int likes;
  final int dislikes;

  Comment({
    required this.name,
    required this.handle,
    required this.content,
    required this.timeAgo,
    required this.avatarUrl,
    required this.likes,
    required this.dislikes,
  });
}