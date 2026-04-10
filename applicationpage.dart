import 'package:flutter/material.dart';
import 'homepage.dart'; // ✅ import for BottomNavBar
import 'jobspage.dart';
import 'profilepage.dart';

class ApplicationsPage extends StatefulWidget {
  const ApplicationsPage({super.key});

  @override
  State<ApplicationsPage> createState() => _ApplicationsPageState();
}

class _ApplicationsPageState extends State<ApplicationsPage> {
  String selectedTab = "All";

  final List<Map<String, String>> jobs = [
    {"title": "UI Designer", "company": "Creative Labs", "location": "Remote", "status": "In Review"},
    {"title": "Product Designer", "company": "BrightApps", "location": "San Francisco", "status": "Interview"},
    {"title": "UI/UX Designer", "company": "Apex Digital", "location": "Remote", "status": "In Review"},
    {"title": "Frontend Developer", "company": "TechNova", "location": "Hybrid", "status": "In Review"},
    {"title": "Frontend Developer", "company": "TechNova", "location": "Remote", "status": "Rejected"},
  ];

  List<Map<String, String>> get filteredJobs {
    if (selectedTab == "All") return jobs;
    return jobs.where((job) => job["status"] == selectedTab).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0ECFF),

      appBar: AppBar(
        title: const Text("Applications"),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          /// 🔹 Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                tab("All"),
                tab("In Review"),
                tab("Interview"),
                tab("Rejected"),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// 🔢 Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Found ${filteredJobs.length} Jobs",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),

          const SizedBox(height: 10),

          /// 📄 Job List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredJobs.length,
              itemBuilder: (context, index) {
                final job = filteredJobs[index];
                return JobCard(
                  job["title"]!,
                  job["company"]!,
                  job["location"]!,
                  job["status"]!,
                );
              },
            ),
          )
        ],
      ),

      /// ✅ NAVBAR WITH APPLICATIONS ACTIVE
      bottomNavigationBar: const BottomNavBar(initialIndex: 2),
    );
  }

  /// 🔥 Tab Widget
  Widget tab(String title) {
    bool isActive = selectedTab == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = title;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue.shade100 : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.black,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String title, company, location, status;

  const JobCard(this.title, this.company, this.location, this.status, {super.key});

  Color getColor() {
    if (status == "Rejected") return Colors.red.shade100;
    if (status == "Interview") return Colors.orange.shade100;
    return Colors.green.shade100;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// LEFT SIDE
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              Text(company),
              Text(location, style: const TextStyle(color: Colors.grey)),
            ],
          ),

          /// STATUS TAG
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: getColor(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(status),
          )
        ],
      ),
    );
  }
}