import 'package:flutter/material.dart';
import 'dart:async'; // Import untuk Timer
import 'about_page.dart';
import 'profile_page.dart';
import 'destination_detail_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  late List<Map<String, String>> destinations;
  late Timer _timer; // Tambahkan Timer

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    destinations = [
      {
        'title': 'Bali',
        'image': 'assets/images/destination1.jpg',
        'date': 'Trip Date: 2024-10-30',
        'description': 'Bali is famous for its stunning beaches, vibrant culture, and beautiful landscapes...',
      },
      {
        'title': 'Jakarta',
        'image': 'assets/images/destination2.jpg',
        'date': 'Trip Date: 2024-11-05',
        'description': 'Jakarta, the bustling capital of Indonesia, offers a mix of modernity and tradition...',
      },
      {
        'title': 'Yogyakarta',
        'image': 'assets/images/destination3.jpg',
        'date': 'Trip Date: 2024-11-15',
        'description': 'Yogyakarta is renowned for its historical sites, including the magnificent Borobudur and Prambanan temples. Immerse yourself in Javanese culture through traditional dance performances and local crafts while enjoying the stunning landscapes and rich heritage.',
      },
      {
        'title': 'Lombok',
        'image': 'assets/images/destination4.jpg',
        'date': 'Trip Date: 2024-12-01',
        'description': 'Lombok is known for its beautiful beaches and breathtaking waterfalls. Experience the natural beauty of the island, from Mount Rinjani to the stunning Gili Islands. Enjoy a relaxing getaway filled with adventure and scenic views.',
      },
      {
        'title': 'Malang',
        'image': 'assets/images/destination5.jpg',
        'date': 'Trip Date: 2024-12-10',
        'description': 'Malang, located in East Java, is famous for its cool climate, beautiful landscapes, and vibrant flower gardens. Explore the local attractions, taste the famous Malang apples, and enjoy the serene surroundings of this charming city.',
      },
      {
        'title': 'Bandung',
        'image': 'assets/images/destination6.jpg',
        'date': 'Trip Date: 2024-12-20',
        'description': 'Bandung is a popular getaway known for its culinary delights, beautiful scenery, and vibrant shopping scene. Explore the trendy cafes, visit Tangkuban Perahu volcano, and enjoy the fresh air of this mountainous city.',
      },
      {
        'title': 'Surabaya',
        'image': 'assets/images/destination4.jpg',
        'date': 'Trip Date: 2024-12-15',
        'description': 'Surabaya, the capital of East Java, is known for its rich history and vibrant culture. Explore the historic sites, enjoy local delicacies, and visit the bustling markets. Don\'t miss the iconic Tugu Pahlawan monument and the beautiful Suroboyo Carnival Park.',
      },
      {
        'title': 'Semarang',
        'image': 'assets/images/destination1.jpg',
        'date': 'Trip Date: 2024-12-25',
        'description': 'Semarang, located on the north coast of Java, offers a blend of colonial architecture and modernity. Visit the famous Lawang Sewu building, take a stroll through the vibrant Chinatown, and indulge in the local cuisine, including the famous lumpia.',
      },

      // Tambahkan destinasi lainnya...
    ];

    // Timer untuk slide otomatis setiap 3 detik
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.page!.round() < destinations.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.jumpToPage(0); // Kembali ke halaman pertama setelah terakhir
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Hentikan timer saat dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyTrip'),
        backgroundColor: const Color.fromARGB(255, 87, 90, 245),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(username: widget.username)),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 255, 255, 255), Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 4),
              _buildImageSlider(), // Menambahkan slider gambar
              const SizedBox(height: 8),
              // Menampilkan rekomendasi trip
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Rekomendasi Trip',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                padding: const EdgeInsets.all(8.0),
                itemCount: destinations.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final destination = destinations[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DestinationDetailPage(
                            title: destination['title']!,
                            imageUrl: destination['image']!,
                            date: destination['date']!,
                            description: destination['description']!,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              destination['image']!,
                              fit: BoxFit.cover,
                              height: 100,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  destination['title']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSlider() {
    return SizedBox(
      height: 200, // Tinggi slider
      child: PageView.builder(
        controller: _pageController,
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  destinations[index]['image']!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              // Teks rekomendasi
              Positioned(
                bottom: 20,
                left: 16,
                child: Container(
                  color: Colors.black54, // Background semi-transparan
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    destinations[index]['title']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
