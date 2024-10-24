import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: const Color.fromARGB(255, 87, 90, 245),
      ),
      body: FutureBuilder<Map<String, String>>(
        future: _fetchUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingIndicator();
          } else if (snapshot.hasError) {
            return _buildErrorWidget();
          } else {
            final profileData = snapshot.data!;
            return _buildProfileContent(profileData);
          }
        },
      ),
    );
  }

  Future<Map<String, String>> _fetchUserProfile() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    return {
      'email': 'user@example.com',
      'phone': '+62 812-3456-7890',
      'joined': '1 Januari 2022',
    };
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: Color.fromARGB(255, 87, 90, 245),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return const Center(
      child: Text(
        'Terjadi kesalahan saat memuat data profil.',
        style: TextStyle(fontSize: 16, color: Colors.red),
      ),
    );
  }

  Widget _buildProfileContent(Map<String, String> profileData) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildInfoCard(profileData),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to edit profile can be added here
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                shape: const StadiumBorder(),
                backgroundColor: const Color.fromARGB(255, 87, 90, 245), // Button color
              ),
              child: const Text(
                'Edit Profil',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(Map<String, String> profileData) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile.jpg'), // Update path to profile image
            ),
            const SizedBox(height: 16),
            Text(
              username,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 87, 90, 245),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Email: ${profileData['email']}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Nomor Telepon: ${profileData['phone']}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tanggal Bergabung: ${profileData['joined']}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}