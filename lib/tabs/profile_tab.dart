import 'package:flutter/material.dart';
import '../login_screen.dart';
import '../theme_provider.dart';

class ProfileTab extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ProfileTab({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile header
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor:
                          themeProvider.isDarkMode
                              ? Colors.blue.shade800
                              : Colors.blue.shade600,
                      child: const Text(
                        'U',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Username',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color:
                            themeProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                    Text(
                      'user@example.com',
                      style: TextStyle(
                        color:
                            themeProvider.isDarkMode
                                ? Colors.grey
                                : Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildStatItem('Games', '24'),
                        _buildStatDivider(),
                        _buildStatItem('Achievements', '156'),
                        _buildStatDivider(),
                        _buildStatItem('Hours', '342'),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Theme toggle
              _buildSection(
                title: 'Appearance',
                child: SwitchListTile(
                  title: Text(
                    'Dark Mode',
                    style: TextStyle(
                      color:
                          themeProvider.isDarkMode
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                  activeColor: Colors.blue.shade700,
                ),
              ),

              const SizedBox(height: 24),

              // Recent achievements
              _buildSection(
                title: 'Recent Achievements',
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor:
                                  themeProvider.isDarkMode
                                      ? Colors.blue.shade900
                                      : Colors.blue.shade700,
                              child: Icon(
                                Icons.emoji_events,
                                color: Colors.amber.shade300,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Trophy ${index + 1}',
                              style: TextStyle(
                                fontSize: 12,
                                color:
                                    themeProvider.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Account options
              _buildSection(
                title: 'Account',
                child: Column(
                  children: [
                    _buildOptionTile(
                      icon: Icons.person,
                      title: 'Edit Profile',
                      onTap: () {},
                    ),
                    _buildOptionTile(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      onTap: () {},
                    ),
                    _buildOptionTile(
                      icon: Icons.privacy_tip,
                      title: 'Privacy Settings',
                      onTap: () {},
                    ),
                    _buildOptionTile(
                      icon: Icons.help,
                      title: 'Help & Support',
                      onTap: () {},
                    ),
                    _buildOptionTile(
                      icon: Icons.logout,
                      title: 'Logout',
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    LoginScreen(themeProvider: themeProvider),
                          ),
                        );
                      },
                      textColor: Colors.red.shade300,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color:
                  themeProvider.isDarkMode ? Colors.grey : Colors.grey.shade700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatDivider() {
    return Container(
      height: 24,
      width: 1,
      color:
          themeProvider.isDarkMode
              ? Colors.grey.withOpacity(0.5)
              : Colors.grey.shade300,
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color:
            textColor ??
            (themeProvider.isDarkMode ? Colors.white : Colors.black),
      ),
      title: Text(
        title,
        style: TextStyle(
          color:
              textColor ??
              (themeProvider.isDarkMode ? Colors.white : Colors.black),
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      onTap: onTap,
    );
  }
}
