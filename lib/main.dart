import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:saaslanding/aboutUs.dart';
import 'package:saaslanding/price.dart';
import 'package:saaslanding/testimonial.dart';
import 'package:saaslanding/theame.dart';
import 'FAQ.dart';
import 'blog.dart';
import 'contactUs.dart';
import 'fadein.dart';
import 'feature.dart';
import 'hero.dart';
import 'leaderboard.dart';
import 'footer.dart';

void main() {
  runApp(const SaaSLandingPage());
}

class SaaSLandingPage extends StatefulWidget {
  const SaaSLandingPage({Key? key}) : super(key: key);

  @override
  State<SaaSLandingPage> createState() => _SaaSLandingPageState();
}

class _SaaSLandingPageState extends State<SaaSLandingPage> {
  bool isDarkMode = false;

  void toggleTheme() => setState(() => isDarkMode = !isDarkMode);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ADmyBRAND AI Suite',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: AppBar(
                elevation: 8,
                backgroundColor: isDarkMode
                    ? Colors.black.withOpacity(0.7)
                    : Colors.white.withOpacity(0.7),
                titleSpacing: 16,
                title: Row(
                  children: [
                    Icon(Icons.ad_units, color: isDarkMode ? Colors.tealAccent : Colors.blueAccent),
                    const SizedBox(width: 12),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth < 360) return const SizedBox.shrink();
                        return Text(
                          'ADmyBRAND AI Suite',
                          style: TextStyle(
                            color: isDarkMode ? Colors.tealAccent : Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    tooltip: isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder: (child, anim) => RotationTransition(turns: anim, child: child),
                      child: Icon(
                        isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                        key: ValueKey<bool>(isDarkMode),
                        color: isDarkMode ? Colors.tealAccent : Colors.blueAccent,
                      ),
                    ),
                    onPressed: toggleTheme,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
        ),

        body: Column(
          children: [
            // Medium-width Search Bar



            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    FadeInWidget(child: HeroSection()),
                    FadeInWidget(child: FeaturesSection()),
                    FadeInWidget(child: WhatWeOfferSection()),
                    FadeInWidget(child: TestimonialsSection()),
                    FadeInWidget(child: FAQSection()),
                    FadeInWidget(child: PricingSection()),
                    FadeInWidget(child: BlogSection()),
                    FadeInWidget(child: AboutSection()),
                    FadeInWidget(child: ContactUsSection()),
                    FadeInWidget(child: FooterSection()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
