
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/screen/profile.dart';
import 'package:myapp/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/palette.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Variables
  bool isLoading = true;

  //Skills List
  final List<Map<String, dynamic>> skillCategories = [
    {
      'category': '🧠 Programming Languages',
      'skills': [
        {'name': 'C', 'logo': 'assets/images/letter-c.png'},
        {'name': 'C++', 'logo': 'assets/images/c-.png'},
        {'name': 'Java', 'logo': 'assets/images/java.png'},
        {'name': 'JavaScript', 'logo': 'assets/images/js.png'},
        {'name': 'Dart', 'logo': 'assets/images/dart.png'},
        {'name': 'Kotlin', 'logo': 'assets/images/kotlin.jpeg'},
        {'name': 'Python', 'logo': 'assets/images/python.png'},
      ],
    },
    {
      'category': '📱 App Development',
      'skills': [
        {'name': 'Flutter', 'logo': 'assets/images/flutter.jpg'},
        {'name': 'Dart', 'logo': 'assets/images/dart.png'},
        {'name': 'Android Studio', 'logo': 'assets/images/android.png'},
        {'name': 'Kotlin', 'logo': 'assets/images/kotlin.jpeg'},
        {'name': 'Jetpack Compose', 'logo': 'assets/images/Jetpack compose.png'},
      ],
    },
    {
      'category': '🌐 Web Development',
      'skills': [
        {'name': 'HTML5', 'logo': 'assets/images/html-5.png'},
        {'name': 'CSS3', 'logo': 'assets/images/css.png'},
        {'name': 'JavaScript', 'logo': 'assets/images/js.png'},
        {'name': 'Node.js', 'logo': 'assets/images/nodejs.png'},
      ],
    },
    {
      'category': '🛠 Tools & Platforms',
      'skills': [
        {'name': 'Git', 'logo': 'assets/images/social.png'},
        {'name': 'GitHub', 'logo': 'assets/images/social(1).png'},
        {'name': 'Linux', 'logo': 'assets/images/linux.png'},
        {'name': 'AI Dev', 'logo': 'assets/images/bot.png'},
      ],
    },
    {
      'category': '🎨 Design & Editing',
      'skills': [
        {'name': 'Canva', 'logo': 'assets/images/canva.jpeg'},
        {'name': 'Filmora', 'logo': 'assets/images/fil ora.png'},
      ],
    },
    {
      'category': '📂 Office & Productivity',
      'skills': [
        {'name': 'Word', 'logo': 'assets/images/word.png'},
        {'name': 'PowerPoint', 'logo': 'assets/images/powerpoint.png'},
      ],
    },
    {
      'category': '⚡ Extra Skills',
      'skills': [
        {'name': 'Gaming', 'logo': 'assets/images/social(2).png'},
      ],
    },
  ];

  //Projects List
  final List<Map<String, String>> projects = [
    {
      'title': 'Portfolio App',
      'description':
      'A modern Flutter portfolio app with dynamic theme switching, smooth animations, and real-time GitHub API integration.',
      'url': 'https://github.com/ars2k03/MyApp',
    },
    {
      'title': 'WhatsApp Clone',
      'description':
      'A feature-rich WhatsApp UI clone built with Flutter, featuring local real-time chat, Hive persistence, QR scanner, and dark mode support.',
      'url': 'https://github.com/ars2k03/WhatsApp',
    },
    {
      'title': 'YouTube Clone',
      'description':
      'A sleek Flutter YouTube search app with Lottie splash screen, dark theme UI, and in-app WebView browsing.',
      'url': 'https://github.com/ars2k03/YouTube',
    },
  ];

  //API Call
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2000),(){
      setState(() {
        isLoading = false;
      });
    });
  }

  //URL Open
  Future<void> _openUrl(String url, String? label) async {
    final name = label ?? 'Link';

    try {
      final link = Uri.parse(url);
      final open = await launchUrl(link, mode: LaunchMode.externalApplication);

      if (open) {
        _showSnackBar('✅ Opening $name...', false);
      } else {
        _showSnackBar('❌ Could not open $name', true);
      }
    } catch (e) {
      _showSnackBar('❌ Error opening $name', true);
    }
  }

  // SnackBar
  void _showSnackBar(String message, bool isError) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          backgroundColor: isDark ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 1500),
          margin: const EdgeInsets.all(20),
          content: Text(
            message,
            style: TextStyle(
              color: isDark ? Colors.black : Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
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
              onTap: () {
                if (themeProvider.themeMode == ThemeMode.light) {
                  themeProvider.changeTheme('Dark');
                } else {
                  themeProvider.changeTheme('Light');
                }
              },
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
      body: isLoading ? _buildLoading(isDark) : _buildContent(isDark),
    );
  }

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


  Widget _buildContent(bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),

          //PROFILE SECTION
          _buildProfileSection(isDark),

          const SizedBox(height: 30),

          //ABOUT SECTION
          _buildAboutSection(isDark),

          const SizedBox(height: 20),

          // Location card
          _buildInfoCard(
            isDark: isDark,
            icon: Icons.location_on,
            label: 'Location',
            value: 'Rajshahi',
          ),

          const SizedBox(height: 12),

          // University card
          _buildInfoCard(
            isDark: isDark,
            icon: Icons.school,
            label: 'University',
            value: 'Rajshahi University of Engineering\n& Technology (RUET)',
          ),

          const SizedBox(height: 20),

          //SKILLS SECTION
          _buildSkillsSection(isDark),

          const SizedBox(height: 20),

          //PROJECTS SECTION
          _buildProjectsSection(isDark),

          const SizedBox(height: 20),

          //CONTACT SECTION
          _buildContactSection(isDark),

          const SizedBox(height: 30),

          // Footer
          Text(
            'Built with Flutter 💙 © 2026 ars2k03. All rights reserved.',
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildProfileSection(bool isDark) {
    return Column(
      children: [
        // Profile Picture
        CircleAvatar(
          radius: 60,
          backgroundColor: Palette.primary,
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  )
              );
            },
            child: CircleAvatar(
              radius: 57,
              backgroundImage: AssetImage("assets/images/1000001204.png"),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Name
        Text(
          'Md. Arafat Rahman Sohan',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        // Title Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Palette.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Flutter Developer',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),

        const SizedBox(height: 12),

        // Bio
        Text(
          '💫 Hi 👋, I\'m A R S Arafat',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.white70 : Colors.black54,
          ),
        ),

        const SizedBox(height: 16),

        // Followers & Repos count
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _showSnackBar('👥 2.5K Followers', false),
              child: _buildStatBox('2.5K', 'Followers'),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () => _showSnackBar('📂 4 Public Repos', false),
              child: _buildStatBox('4', 'Repos'),
            ),
          ],
        ),
      ],
    );
  }

  //stat box
  Widget _buildStatBox(String count, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
              count,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Palette.accent
              )
          ),
          Text(
              label,
              style: const TextStyle(
                  fontSize: 12
              )
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(bool isDark) {
    return _buildCard(
      isDark: isDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('About Me'),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 14,
                height: 1.6,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
              children: [
                const TextSpan(text: 'I love building, I love breaking, and I love learning ��🔐\n\n'),
                const TextSpan(text: 'Email Me 👉 ✉️ '),
                TextSpan(
                  text: 'arafatsohan2003@gmail.com',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _openUrl('mailto:arafatsohan2003@gmail.com', 'Email');
                    },
                ),
                const TextSpan(text: ' For Collaboration/Project or Anything Else. 😊😊\n\n'),
                const TextSpan(text: '• 🔭 I\'m currently working on: Flutter mobile app development\n'),
                const TextSpan(text: '• 🌱 I\'m currently learning: Backend development with JavaScript (Node.js) to become a Full-Stack Flutter Developer\n'),
                const TextSpan(text: '• 👯 I\'m looking to collaborate on: Open-source Flutter & Full-Stack projects\n'),
                const TextSpan(text: '• 🤔 I\'m looking for help with: Real-world projects to sharpen my development skills\n'),
                const TextSpan(text: '• 💬 Ask me about: Flutter, Dart, Mobile UI/UX & Backend fundamentals\n'),
                const TextSpan(text: '• 📫 How to reach me: '),
                TextSpan(
                  text: 'arafatsohan2003@gmail.com',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _openUrl('mailto:arafatsohan2003@gmail.com', 'Email');
                    },
                ),
                const TextSpan(text: '\n'),
                const TextSpan(text: '• 😄 Pronouns: He/Him\n'),
                const TextSpan(text: '• ⚡ Fun fact: I love tech, and I enjoy turning ideas into real-world apps 🚀'),
              ],
            ),
          ),
          const SizedBox(height: 16),

        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required bool isDark,
    required IconData icon,
    required String label,
    required String value,
  }) {
    return GestureDetector(
      onTap: () => _showSnackBar('📌 $label: $value', false),
      child: Container(
        width: double.infinity,
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
        child: Column(
          children: [
            //Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Palette.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 28, color: Palette.primary),
            ),

            const SizedBox(height: 10),

            // Label
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: isDark ? Colors.white54 : Colors.black38,
              ),
            ),

            const SizedBox(height: 4),

            //Data
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection(bool isDark) {
    return _buildCard(
      isDark: isDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Skills'),
          const SizedBox(height: 12),

          ...skillCategories.map((category) {
            final List<Map<String, dynamic>> skills =
            (category['skills'] as List).cast<Map<String, dynamic>>();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                // Category Header
                Text(
                  category['category'] as String,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Palette.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Divider(
                  color: isDark ? Colors.white12 : Colors.grey.shade200,
                  height: 1,
                ),
                const SizedBox(height: 12),

                // Skill Cards Grid
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: skills.map((skill) {
                    return _buildSkillCard(
                      isDark: isDark,
                      name: skill['name'] as String,
                      logoUrl: skill['logo'] as String,
                    );
                  }).toList(),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSkillCard({
    required bool isDark,
    required String name,
    required String logoUrl,
  }) {
    return GestureDetector(
      onTap: () => _showSnackBar('🛠 $name', false),
      child: Container(
        width: 110,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? Colors.white12 : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              logoUrl,
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.code, size: 40);
              },
            ),
            const SizedBox(height: 8),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: _buildSectionHeader('Projects'),
        ),

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
                      onPressed: () => _openUrl(
                        project['url']!,
                        project['title']!,
                      ),
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
            leading: const Icon(Icons.email, color: Palette.error),
            title: Text('Email Me',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () => _openUrl(
              'mailto:arafatsohan2003@gmail.com',
              'Email',
            ),
            contentPadding: EdgeInsets.zero,
          ),

          //X
          ListTile(
            leading: const Icon(FontAwesomeIcons.xTwitter, color: Palette.error),
            title: Text('X (Twitter)',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () => _openUrl(
              'https://x.com/ars_2k03',
              'X (Twitter)',
            ),
            contentPadding: EdgeInsets.zero,
          ),

          // LinkedIn
          ListTile(
            leading: const Icon(FontAwesomeIcons.linkedinIn, color: Palette.error),
            title: Text('LinkedIn',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () => _openUrl(
              'https://www.linkedin.com/',
              'LinkedIn',
            ),
            contentPadding: EdgeInsets.zero,
          ),

          // GitHub
          ListTile(
            leading: const Icon(FontAwesomeIcons.github, color: Palette.error),
            title: Text('GitHub',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () => _openUrl(
              'https://github.com/ars2k03',
              'GitHub',
            ),
            contentPadding: EdgeInsets.zero,
          ),

          const SizedBox(height: 12),

          // Download CV Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () => _openUrl(
                '',
                'CV Download',
              ),
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

  //About Me, Skills
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

  // Simple Card
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