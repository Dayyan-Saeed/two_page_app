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
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }

  // Helper methods for UI display
  String get displayName {
    // Extract name from email if available, otherwise use name field
    if (email.isNotEmpty) {
      return email.split('@')[0].replaceAll('.', ' ').split(' ')
          .map((word) => word[0].toUpperCase() + word.substring(1))
          .join(' ');
    }
    return name.split(' ').take(2).join(' ');
  }

  String get handle {
    if (email.isNotEmpty) {
      return '@${email.split('@')[0]}';
    }
    return '@user$id';
  }

  String get avatarInitials {
    if (email.isNotEmpty) {
      final nameParts = email.split('@')[0].split('.');
      if (nameParts.length >= 2) {
        return '${nameParts[0][0]}${nameParts[1][0]}'.toUpperCase();
      }
      return email[0].toUpperCase();
    }
    final nameParts = name.split(' ');
    if (nameParts.length >= 2) {
      return '${nameParts[0][0]}${nameParts[1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }
}