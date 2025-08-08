import 'package:flutter/material.dart';
import 'package:saaslanding/theame.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  final List<BlogPost> blogPosts = const [
    BlogPost(
      title: "Harnessing AI for Smarter Marketing",
      excerpt:
      "Discover how AI transforms marketing strategies, boosts ROI, and automates workflows effortlessly.",
      author: "Jane Doe",
      date: "Aug 1, 2025",
      imageUrl: "assets/images/blog.png",
    ),
    BlogPost(
      title: "5 Tips to Optimize Your Digital Campaigns",
      excerpt:
      "Maximize engagement with these actionable tips to refine your targeting and creative content.",
      author: "John Smith",
      date: "Jul 25, 2025",
      imageUrl: "assets/images/blog.png",
    ),
    BlogPost(
      title: "Understanding Customer Behavior with AI",
      excerpt:
      "Learn how AI analytics uncovers hidden patterns in customer data for better decision-making.",
      author: "Emily Clark",
      date: "Jul 10, 2025",
      imageUrl: "assets/images/blog.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "From Our Blog",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Insights and tips to elevate your marketing game",
            style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 700;
            return Wrap(
              spacing: 24,
              runSpacing: 24,
              children: blogPosts.map((post) {
                return SizedBox(
                  width: isMobile ? constraints.maxWidth : 320,
                  child: BlogCard(post: post),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}

class BlogPost {
  final String title;
  final String excerpt;
  final String author;
  final String date;
  final String imageUrl;

  const BlogPost({
    required this.title,
    required this.excerpt,
    required this.author,
    required this.date,
    required this.imageUrl,
  });
}

class BlogCard extends StatelessWidget {
  final BlogPost post;

  const BlogCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with fixed aspect ratio and rounded corners
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              post.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  post.excerpt,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade800,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage('assets/images/blog.png'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "${post.author} • ${post.date}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: AppTheme.primaryColor,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
