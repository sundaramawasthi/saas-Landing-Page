import 'package:flutter/material.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> pricingTiers = const [
    {
      "title": "Basic",
      "price": "\$19/mo",
      "features": [
        "Access to core AI tools",
        "Basic analytics dashboard",
        "Email support",
      ],
      "color": Colors.blueAccent,
    },
    {
      "title": "Pro",
      "price": "\$49/mo",
      "features": [
        "Everything in Basic",
        "Advanced analytics & reports",
        "Priority email & chat support",
        "Custom integrations",
      ],
      "color": Colors.teal,
    },
    {
      "title": "Enterprise",
      "price": "Contact Us",
      "features": [
        "Custom solutions & setup",
        "Dedicated account manager",
        "24/7 support",
        "API access & SLAs",
      ],
      "color": Colors.deepPurpleAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: Colors.grey.shade50,
      child: Column(
        children: [
          const Text(
            'Pricing Plans',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          isMobile
              ? Column(
            children: pricingTiers
                .map((tier) => PricingCard(
              title: tier['title'],
              price: tier['price'],
              features: tier['features'],
              color: tier['color'],
            ))
                .toList(),
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: pricingTiers
                .map((tier) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PricingCard(
                  title: tier['title'],
                  price: tier['price'],
                  features: tier['features'],
                  color: tier['color'],
                ),
              ),
            ))
                .toList(),
          )
        ],
      ),
    );
  }
}

class PricingCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> features;
  final Color color;

  const PricingCard({
    Key? key,
    required this.title,
    required this.price,
    required this.features,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: color,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features
                  .map((feature) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: color, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        feature,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ))
                  .toList(),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                title == "Enterprise" ? "Contact Us" : "Choose Plan",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
