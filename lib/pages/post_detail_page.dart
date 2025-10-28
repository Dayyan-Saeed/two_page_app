import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';

class PostDetailPage extends StatefulWidget {
  final ThreadPost post;

  const PostDetailPage({super.key, required this.post});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  List<Comment> _comments = [];
  bool _isLoadingComments = true;

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  Future<void> _loadComments() async {
    try {
      // Since we don't have postId in ThreadPost, we'll use a mock postId
      // In a real app, you'd pass the actual post ID
      final comments = await ApiService.fetchComments(1);
      setState(() {
        _comments = comments;
        _isLoadingComments = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingComments = false;
      });
    }
  }

  String _getPostTitle(String content) {
    // Extract title from content (first line before \n\n)
    final parts = content.split('\n\n');
    if (parts.isNotEmpty) {
      final title = parts[0].trim();
      if (title.length > 50) {
        return '${title.substring(0, 47)}...';
      }
      return title;
    }
    return 'Post';
  }

  String _getPostBody(String content) {
    // Extract body from content (everything after \n\n)
    final parts = content.split('\n\n');
    if (parts.length > 1) {
      return parts.sublist(1).join('\n\n').trim();
    }
    return content;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Post',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Post
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getPostTitle(widget.post.content),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _getPostBody(widget.post.content),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Post stats
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.favorite_border, size: 20, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text('${widget.post.likes}', style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(width: 24),
                      Row(
                        children: [
                          const Icon(Icons.chat_bubble_outline, size: 20, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text('${widget.post.comments}', style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(width: 24),
                      Row(
                        children: [
                          const Icon(Icons.share_outlined, size: 20, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text('${widget.post.shares}', style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Sort dropdown
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'Most Relevant',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                ],
              ),
            ),
            // Comments
            _buildCommentsList(),
            // Add comment section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border(
                  top: BorderSide(color: Colors.grey[200]!),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.deepPurple[300],
                    child: const Text(
                      'Y',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Icon(Icons.image_outlined, color: Colors.grey[600]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentsList() {
    if (_isLoadingComments) {
      return const Padding(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: CircularProgressIndicator(color: Colors.grey),
        ),
      );
    }

    return Column(
      children: _comments
          .asMap()
          .entries
          .map((entry) => Column(
                children: [
                  _buildCommentItem(entry.value),
                  if (entry.key < _comments.length - 1)
                    Divider(
                      height: 1,
                      color: Colors.grey[200],
                      indent: 50,
                    ),
                ],
              ))
          .toList(),
    );
  }

  Widget _buildCommentItem(Comment comment) {
    // Generate avatar color and initials
    final hash = comment.displayName.hashCode;
    final colors = [
      Colors.pink[300]!,
      Colors.blue[300]!,
      Colors.green[300]!,
      Colors.orange[300]!,
      Colors.purple[300]!,
      Colors.teal[300]!,
      Colors.indigo[300]!,
    ];
    final avatarColor = colors[hash.abs() % colors.length];
    
    final initials = comment.avatarInitials;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: avatarColor,
            child: Text(
              initials,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment.displayName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      comment.handle,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  comment.body,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildCommentAction(Icons.thumb_up_outlined, comment.id % 20),
                    const SizedBox(width: 20),
                    _buildCommentAction(Icons.thumb_down_outlined, comment.id % 3),
                    const SizedBox(width: 20),
                    _buildCommentAction(Icons.chat_bubble_outline, 0, showCount: false),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentAction(IconData icon, int count, {bool showCount = true}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        if (showCount && count > 0) ...[
          const SizedBox(width: 4),
          Text(
            '$count',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}