import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'login_page.dart'; // Make sure to import your LoginPage here

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final int _currentPage = 0;

  final List<String> _images = [
    'assets/images/trip1.jpg',
    'assets/images/trip2.jpg',
    'assets/images/trip3.jpg',
  ];

  final List<Map<String, String>> _featuredPackages = [
    {
      'image': 'assets/images/trip1.jpg',
      'title': 'Petualangan Gunung',
      'description': 'Hiking menakjubkan di pegunungan.'
    },
    {
      'image': 'assets/images/trip2.jpg',
      'title': 'Penjelajahan',
      'description': 'Temukan tempat-tempat tersembunyi.'
    },
    {
      'image': 'assets/images/trip3.jpg',
      'title': 'Liburan Pantai',
      'description': 'Nikmati keindahan pantai.'
    },
    {
      'image': 'assets/images/trip1.jpg',
      'title': 'Jalan Lintas Selatan',
      'description': 'Nikmati keindahan jalan seperti di bali.'
    },
  ];

  int _currentCarouselPage = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Center(
          child: Text(
            'MyTrip',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const DecoratedBox(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 87, 90, 245),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                CarouselSlider.builder(
                  itemCount: _images.length,
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            _images[index],
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 300,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentCarouselPage = index; // Update current page
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the LoginPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 36.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text(
                    'Mulai Perjalanan Anda',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Paket Unggulan',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: _featuredPackages.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 6,
                      shadowColor: Colors.black.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              _featuredPackages[index]['image']!,
                              fit: BoxFit.cover,
                              height: 100,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _featuredPackages[index]['title']!,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              _featuredPackages[index]['description']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
