import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/constants.dart';
import '../config/palette.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Variables
  bool isLoading = true;
  bool hasError = false;
  Map<String, dynamic>? userData;

  //Skills List
  final List<Map<String, dynamic>> skills = [
    {'name': 'Flutter / Dart', 'level': 0.90, 'icon': '📱'},
    {'name': 'Firebase', 'level': 0.80, 'icon': '🔥'},
    {'name': 'REST APIs', 'level': 0.85, 'icon': '🌐'},
    {'name': 'Git & GitHub', 'level': 0.88, 'icon': '🔧'},
    {'name': 'UI/UX Design', 'level': 0.75, 'icon': '🎨'},
    {'name': 'State Management', 'level': 0.82, 'icon': '⚙️'},
  ];

  // ─── Projects List ───
  final List<Map<String, String>> projects = [
    {
      'title': 'Portfolio App',
      'description': 'Flutter portfolio app with theme switching and GitHub API.',
      'url': 'https://github.com/ars2k03/portfolio',
    },
    {
      'title': 'Weather App',
      'description': 'Real-time weather app with beautiful UI.',
      'url': 'https://github.com/ars2k03/weather-app',
    },
    {
      'title': 'Task Manager',
      'description': 'Task management app with local storage.',
      'url': 'https://github.com/ars2k03/task-manager',
    },
  ];

  // ─── API Call (তোমার existing logic) ───
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final data = await http.get(
        Uri.parse('https://api.github.com/users/${AppConstants.githubUsername}'),
      );
      if (data.statusCode == 200) {
        setState(() {
          userData = jsonDecode(data.body);
          isLoading = false;
        });
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  // ─── URL Open করার function ───
  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: const Text(
          '{ A R S }',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        centerTitle: false,
        actions: [
          // Theme Toggle Button
          Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () => themeProvider.themeMode == ThemeMode.light
                  ? themeProvider.changeTheme('Dark')
                  : themeProvider.changeTheme('Light'),
              child: Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: isDark ? Colors.indigo : Colors.orange,
                ),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  alignment:
                  isDark ? Alignment.centerLeft : Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      isDark ? Icons.nights_stay_rounded : Icons.wb_sunny_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      //Body
      body: isLoading
          ? _buildLoading(isDark)       // Loading দেখাও
          : hasError
          ? _buildError()           // Error দেখাও
          : _buildContent(isDark),  // Main content দেখাও
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // LOADING - যখন data আসছে
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildLoading(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: isDark ? Palette.accent : Palette.primary,
          ),
          const SizedBox(height: 16),
          const Text('Loading...'),
        ],
      ),
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // ERROR - যখন কিছু ভুল হয়
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 60, color: Colors.red),
          const SizedBox(height: 16),
          const Text('Something went wrong!', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                isLoading = true;
                hasError = false;
              });
              getData();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // MAIN CONTENT - সব sections
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildContent(bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),

          // ── 1. PROFILE SECTION ──
          _buildProfileSection(isDark),

          const SizedBox(height: 30),

          // ── 2. ABOUT SECTION ──
          _buildAboutSection(isDark),

          const SizedBox(height: 20),

          // ── 3. SKILLS SECTION ──
          _buildSkillsSection(isDark),

          const SizedBox(height: 20),

          // ── 4. PROJECTS SECTION ──
          _buildProjectsSection(isDark),

          const SizedBox(height: 20),

          // ── 5. CONTACT SECTION ──
          _buildContactSection(isDark),

          const SizedBox(height: 30),

          // Footer
          Text(
            'Built with 💙 in Flutter',
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.white38 : Colors.black38,
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 1. PROFILE - ছবি, নাম, bio
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildProfileSection(bool isDark) {
    return Column(
      children: [
        // Profile Picture
        CircleAvatar(
          radius: 60,
          backgroundColor: Palette.primary,
          child: CircleAvatar(
            radius: 57,
            backgroundImage: NetworkImage(userData?['avatar_url'] ?? ''),
          ),
        ),

        const SizedBox(height: 16),

        // Name
        Text(
          userData?['name'] ?? AppConstants.name,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        // Title Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Palette.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            AppConstants.title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),

        const SizedBox(height: 12),

        // Bio
        Text(
          userData?['bio'] ?? AppConstants.aboutMe,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.white60 : Colors.black54,
          ),
        ),

        const SizedBox(height: 16),

        // Followers & Repos count
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStatBox('${userData?['followers'] ?? 0}', 'Followers'),
            const SizedBox(width: 20),
            _buildStatBox('${userData?['public_repos'] ?? 0}', 'Repos'),
          ],
        ),
      ],
    );
  }

  // ছোট stat box
  Widget _buildStatBox(String count, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Palette.primary.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(count,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Palette.primary)),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 2. ABOUT - আমার সম্পর্কে
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildAboutSection(bool isDark) {
    return _buildCard(
      isDark: isDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('About Me'),
          const SizedBox(height: 12),
          Text(
            AppConstants.aboutMe,
            style: TextStyle(
              fontSize: 14,
              height: 1.6,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          // Location
          Row(
            children: [
              const Icon(Icons.location_on, size: 18, color: Palette.primary),
              const SizedBox(width: 8),
              Text(userData?['location'] ?? 'Earth 🌍'),
            ],
          ),
          const SizedBox(height: 8),

          // Company
          Row(
            children: [
              const Icon(Icons.work, size: 18, color: Palette.primary),
              const SizedBox(width: 8),
              Text(userData?['company'] ?? 'Open to opportunities'),
            ],
          ),
        ],
      ),
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 3. SKILLS - দক্ষতা
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildSkillsSection(bool isDark) {
    return _buildCard(
      isDark: isDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Skills'),
          const SizedBox(height: 12),

          // প্রতিটা skill এর জন্য একটা bar
          ...skills.map((skill) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Skill name + percentage
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${skill['icon']}  ${skill['name']}',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '${(skill['level'] * 100).toInt()}%',
                        style: const TextStyle(
                          color: Palette.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Progress bar
                  LinearProgressIndicator(
                    value: skill['level'] as double,
                    backgroundColor: isDark
                        ? Colors.white12
                        : Colors.grey.shade200,
                    color: Palette.primary,
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 4. PROJECTS - প্রজেক্টস
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildProjectsSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: _buildSectionHeader('Projects'),
        ),

        // প্রতিটা project এর জন্য একটা card
        ...projects.map((project) {
          return _buildCard(
            isDark: isDark,
            margin: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project name + open button
                Row(
                  children: [
                    const Icon(Icons.folder, color: Palette.primary),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        project['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _openUrl(project['url']!),
                      icon: const Icon(Icons.open_in_new, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  project['description']!,
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? Colors.white60 : Colors.black54,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 5. CONTACT - যোগাযোগ
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Widget _buildContactSection(bool isDark) {
    return _buildCard(
      isDark: isDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Contact'),
          const SizedBox(height: 12),

          // Email
          ListTile(
            leading: const Icon(Icons.email, color: Palette.primary),
            title: const Text('Email Me'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _openUrl('mailto:${AppConstants.email}'),
            contentPadding: EdgeInsets.zero,
          ),

          // GitHub
          ListTile(
            leading: const Icon(Icons.code, color: Palette.primary),
            title: const Text('GitHub'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _openUrl(AppConstants.githubProfile),
            contentPadding: EdgeInsets.zero,
          ),

          // LinkedIn
          ListTile(
            leading: const Icon(Icons.link, color: Palette.primary),
            title: const Text('LinkedIn'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _openUrl(AppConstants.linkedIn),
            contentPadding: EdgeInsets.zero,
          ),

          const SizedBox(height: 12),

          // Download CV Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () => _openUrl(AppConstants.cvUrl),
              icon: const Icon(Icons.download, color: Colors.white),
              label: const Text(
                'Download CV',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Palette.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // HELPER WIDGETS
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  // Section Header - যেমন "About Me", "Skills" ইত্যাদি
  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 24,
          decoration: BoxDecoration(
            color: Palette.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Simple Card - প্রতিটা section এর জন্য
  Widget _buildCard({
    required bool isDark,
    required Widget child,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      width: double.infinity,
      margin: margin,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white10 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white12 : Colors.grey.shade200,
        ),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: child,
    );
  }
}