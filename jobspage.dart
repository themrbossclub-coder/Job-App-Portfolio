import 'package:flutter/material.dart';
import 'homepage.dart'; // 👈 import homepage (for BottomNavBar)
import 'applicationpage.dart';
import 'profilepage.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      body: Column(
        children: [
          // Top Header
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2F80ED), Color(0xFF56CCF2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Jobs",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.notifications, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 20),

                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "UI designer",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.tune),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Job List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                JobCard(
                  title: "UI/UX Designer",
                  company: "Apex Digital",
                  location: "Los Angeles, CA",
                  salary: "\$75K - \$90K",
                ),
                JobCard(
                  title: "Product Designer",
                  company: "BrightApps",
                  location: "San Francisco, CA",
                  salary: "\$85K - \$100K",
                ),
                JobCard(
                  title: "UI Designer",
                  company: "Creative Labs",
                  location: "Remote",
                  salary: "\$70K - \$85K",
                ),
              ],
            ),
          ),
        ],
      ),

      /// ✅ SAME NAVBAR AS HOMEPAGE
      bottomNavigationBar: const BottomNavBar(initialIndex: 1),
    );
  }
}

class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String salary;

  const JobCard({
    super.key,
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.favorite_border),
            ],
          ),
          const SizedBox(height: 5),
          Text(company, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 5),
          Text(location, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),
          Text(
            salary,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}