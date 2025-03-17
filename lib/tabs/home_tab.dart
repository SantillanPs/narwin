import 'package:flutter/material.dart';
import '../widgets/game_card.dart';
import '../theme_provider.dart';

class HomeTab extends StatelessWidget {
  final ThemeProvider themeProvider;

  const HomeTab({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Icon(
              Icons.videogame_asset,
              color:
                  themeProvider.isDarkMode
                      ? Colors.blue.shade500
                      : Colors.blue.shade700,
            ),
            const SizedBox(width: 8),
            Text(
              'PLAYHAVEN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundColor:
                  themeProvider.isDarkMode
                      ? Colors.blue.shade800
                      : Colors.blue.shade600,
              child: const Text('U'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Game
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    Image.network(
                      'https://picsum.photos/400/200',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cyber Legends',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        themeProvider.isDarkMode
                                            ? Colors.blue.shade700
                                            : Colors.blue.shade600,
                                    foregroundColor: Colors.white,
                                    minimumSize: const Size(80, 36),
                                  ),
                                  child: const Text('Play'),
                                ),
                                const SizedBox(width: 8),
                                OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.download,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    '2.1 GB',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color:
                                          themeProvider.isDarkMode
                                              ? const Color(0xFF333333)
                                              : Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // New Releases
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Releases',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color:
                          themeProvider.isDarkMode
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor:
                          themeProvider.isDarkMode
                              ? Colors.blue.shade400
                              : Colors.blue.shade700,
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text('View all'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: SizedBox(
                        width: 120,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://picsum.photos/120/120?random=${index + 1}',
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Game Title ${index + 1}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color:
                                            themeProvider.isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Action RPG',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            themeProvider.isDarkMode
                                                ? Colors.grey
                                                : Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Your Games
              Text(
                'Your Games',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.49,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GameCard(
                    title: 'Installed Game ${index + 1}',
                    subtitle: 'Last played 2h ago',
                    imageUrl: 'https://picsum.photos/60/60?random=${index + 1}',
                    themeProvider: themeProvider,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
