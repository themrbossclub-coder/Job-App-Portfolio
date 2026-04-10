import 'package:flutter/material.dart';

class EmployerHomePage extends StatelessWidget {
  const EmployerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f6fb),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.work),
            SizedBox(width: 8),
            Text("JobStall"),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: Colors.orange, shape: BoxShape.circle),
                  child: const Text("3",
                      style: TextStyle(fontSize: 10, color: Colors.white)),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(child: Icon(Icons.person)),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔷 Title + Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jobs",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("Manage and monitor your job listings.",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                  onPressed: () {},
                  child: const Text("+ Post a New Job"),
                )
              ],
            ),

            const SizedBox(height: 15),

            // 🔍 Search + Filter
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search jobs...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                filterButton("Filter"),
                const SizedBox(width: 8),
                filterButton("All status"),
              ],
            ),

            const SizedBox(height: 20),

            // 📋 TABLE
            const Text("Active Job Listings",
                style: TextStyle(fontWeight: FontWeight.bold)),

            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  tableRow("Job Title", "Posted", "Status", isHeader: true),
                  tableRow("Software Engineer", "5 days ago", "Open"),
                  tableRow("Marketing Manager", "2 weeks ago", "Interviewing"),
                  tableRow("UX Designer", "1 month ago", "Closed"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 📊 Bottom Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT LIST
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Active Job Listings",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text("Software Engineer"),
                        Text("San Francisco, CA"),
                        SizedBox(height: 10),
                        Text("Marketing Manager"),
                        Text("New York, NY"),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                // RIGHT STATS
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Quick Stats",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text("Open Jobs: 3"),
                            Text("New Applicants: 12"),
                            Text("Interviews Scheduled"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(child: Text("Hiring Tips")),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Jobs"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: "Candidates"),
          BottomNavigationBarItem(
              icon: Icon(Icons.message), label: "Messages"),
        ],
      ),
    );
  }

  Widget filterButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Text(text),
    );
  }

  Widget tableRow(String title, String posted, String status,
      {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontWeight:
                      isHeader ? FontWeight.bold : FontWeight.normal)),
          Text(posted),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: status == "Open"
                  ? Colors.green
                  : status == "Closed"
                      ? Colors.red
                      : Colors.orange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(status,
                style: const TextStyle(color: Colors.white, fontSize: 12)),
          )
        ],
      ),
    );
  }
}