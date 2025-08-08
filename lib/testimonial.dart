import 'package:flutter/material.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  final List<Testimonial> testimonials = const [
    Testimonial(
      name: 'Alice Johnson',
      role: 'Marketing Manager',
      review:
      'ADmyBRAND AI Suite transformed our digital campaigns. The insights are incredible!',
      imageUrl: 'assets/images/image.png',
    ),
    Testimonial(
      name: 'Michael Smith',
      role: 'CEO, TechCorp',
      review: 'The AI tools helped us optimize our marketing like never before.',
      imageUrl: 'assets/images/image.png',
    ),
    Testimonial(
      name: 'Sara Williams',
      role: 'Product Manager',
      review: 'Intuitive interface and powerful features — highly recommended.',
      imageUrl: 'assets/images/image.png',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(testimonials.length, (index) {
        bool isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: isActive ? 16 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? Colors.blueAccent : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          const Text(
            'What Our Customers Say',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 260,
            child: PageView.builder(
              controller: _pageController,
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                final testimonial = testimonials[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TestimonialCard(testimonial: testimonial),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          _buildDotsIndicator(),
        ],
      ),
    );
  }
}

class Testimonial {
  final String name;
  final String role;
  final String review;
  final String imageUrl;

  const Testimonial({
    required this.name,
    required this.role,
    required this.review,
    required this.imageUrl,
  });
}

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;

  const TestimonialCard({super.key, required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundImage: AssetImage(testimonial.imageUrl),
          ),
          const SizedBox(height: 12),
          Text(
            testimonial.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            testimonial.role,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              '"${testimonial.review}"',
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
