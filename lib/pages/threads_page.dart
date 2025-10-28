import 'package:flutter/material.dart';
import '../models/post.dart';
import '../pages/post_detail_page.dart';

class ThreadsPage extends StatefulWidget {
  const ThreadsPage({super.key});

  @override
  State<ThreadsPage> createState() => _ThreadsPageState();
}

class _ThreadsPageState extends State<ThreadsPage> {
  final List<ThreadPost> _posts = [
    ThreadPost(
      name: 'Sophia Bennett',
      handle: '@sophiabennett',
      content: 'I\'m excited to share my latest project with you all! It\'s been a labor of love, and I can\'t wait to hear your thoughts. Check it out and let me know what you think!',
      timeAgo: '2d',
      avatarUrl: '',
      likes: 142,
      comments: 23,
      shares: 8,
    ),
    ThreadPost(
      name: 'Ethan Carter',
      handle: '@ethancarter',
      content: 'Just finished reading a fascinating article on the future of AI. The possibilities are both exciting and a bit daunting. What are your thoughts on the rapid advancements in this field?',
      timeAgo: '1d',
      avatarUrl: '',
      likes: 89,
      comments: 45,
      shares: 12,
    ),
    ThreadPost(
      name: 'Olivia Davis',
      handle: '@oliviadavis',
      content: 'Spent the afternoon exploring a new hiking trail. The views were breathtaking, and the fresh air was so refreshing. Nature truly has a way of rejuvenating the soul.',
      timeAgo: '3d',
      avatarUrl: '',
      likes: 67,
      comments: 32,
      shares: 5,
    ),
    ThreadPost(
      name: 'Liam Foster',
      handle: '@liamfoster',
      content: 'I\'m thrilled to announce that I\'ll be speaking at the upcoming tech conference! It\'s an honor to share my insights and connect with fellow innovators. Stay tuned for more details!',
      timeAgo: '2d',
      avatarUrl: '',
      likes: 203,
      comments: 67,
      shares: 15,
    ),
    ThreadPost(
      name: 'Ava Green',
      handle: '@avagreen',
      content: 'Just watched a thought-provoking documentary about climate change. It\'s a stark reminder of the urgent need for collective action. Let\'s all do our part to protect our planet.',
      timeAgo: '1d',
      avatarUrl: '',
      likes: 156,
      comments: 78,
      shares: 22,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Threads',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return _buildPostItem(_posts[index]);
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildPostItem(ThreadPost post) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailPage(post: post),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[200]!),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAvatar(post.name),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        post.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        post.timeAgo,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post.content,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildActionButton(Icons.favorite_border, post.likes.toString()),
                      const SizedBox(width: 20),
                      _buildActionButton(Icons.chat_bubble_outline, post.comments.toString()),
                      const SizedBox(width: 20),
                      _buildActionButton(Icons.repeat, post.shares.toString()),
                      const SizedBox(width: 20),
                      _buildActionButton(Icons.share_outlined, ''),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(String name) {
    Color avatarColor;
    switch (name) {
      case 'Sophia Bennett':
        avatarColor = Colors.pink[200]!;
        break;
      case 'Ethan Carter':
        avatarColor = Colors.blue[200]!;
        break;
      case 'Olivia Davis':
        avatarColor = Colors.green[200]!;
        break;
      case 'Liam Foster':
        avatarColor = Colors.orange[200]!;
        break;
      case 'Ava Green':
        avatarColor = Colors.purple[200]!;
        break;
      default:
        avatarColor = Colors.grey[300]!;
    }

    return CircleAvatar(
      radius: 24,
      backgroundColor: avatarColor,
      child: const Icon(
        Icons.person,
        color: Colors.white,
        size: 28,
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String count) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        if (count.isNotEmpty) ...[
          const SizedBox(width: 4),
          Text(
            count,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home, size: 28, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, size: 28, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_box_outlined, size: 28, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, size: 28, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, size: 28, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}