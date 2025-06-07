import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  // Placeholder data for portfolio items.
  // Replace these with your wife's actual work.
  final List<Map<String, String>> portfolioItems = const [
    {'image': 'https://placehold.co/400x600/E6E6FA/333333?text=Kebaya+Modern', 'title': 'Kebaya Modern'},
    {'image': 'https://placehold.co/400x600/FFE4E1/333333?text=Gamis+Pesta', 'title': 'Gamis Pesta'},
    {'image': 'https://placehold.co/400x600/B0C4DE/333333?text=Kemeja+Batik', 'title': 'Kemeja Batik Pria'},
    {'image': 'https://placehold.co/400x600/D3D3D3/333333?text=Dress+Anak', 'title': 'Dress Anak'},
    {'image': 'https://placehold.co/400x600/F5F5DC/333333?text=Blouse+Kerja', 'title': 'Blouse Kerja'},
    {'image': 'https://placehold.co/400x600/ADD8E6/333333?text=Celana+Formal', 'title': 'Celana Formal'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75, // Adjust aspect ratio for image shape
        ),
        itemCount: portfolioItems.length,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black45,
                title: Text(portfolioItems[index]['title']!),
              ),
              child: Image.network(
                portfolioItems[index]['image']!,
                fit: BoxFit.cover,
                 errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
              ),
            ),
          );
        },
      ),
    );
  }
}
