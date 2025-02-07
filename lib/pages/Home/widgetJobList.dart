import 'package:black_network/theme/theme.dart';
import 'package:flutter/material.dart';
// Widget for each job card

Widget jobCard({
  required IconData companyLogo,
  required String companyName,
  required String jobTitle,
  required String location,
  required String jobType,
  required String timePosted,
  required double rating,
  required String salary,
  required double width,
}) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 8),
    color: Colors.white,
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),

    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company logo
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(companyLogo, size: 40),
          ),
          const SizedBox(width: 12),
          // Job details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  companyName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: lightColorScheme.surface,
                    fontSize: 16,
                  ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                ),
                Text(
                  jobTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: lightColorScheme.surface,
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    SizedBox(
                      width: width,
                      child: Text(
                        location,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),

                Column(
                  spacing: 4,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule, size: 14, color: Colors.grey),
                        Text(
                          jobType,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 14, color: Colors.grey),
                        Text(
                          timePosted,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  spacing: 8,
                  children: [
                    // Rating and salary
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      salary,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Apply now button
          Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 60,
              direction: Axis.vertical,
              children: [
                const Icon(Icons.bookmark_border, color: Colors.grey),
                ElevatedButton(
                  onPressed: () {
                    // Action à réaliser sur le clic
                    print("Apply Now");
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                        vertical: 2), // Réduire le padding intérieur
                    maximumSize: const Size(90, 40),
                    backgroundColor: lightColorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Apply Now"),
                ),
              ],
            ),

        ],
      ),
    ),
  );
}
