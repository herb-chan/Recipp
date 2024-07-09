import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final List<String> steps;

  const RecipeDetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.steps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.reply), // Change the icon here
          onPressed: () {
            Navigator.of(context)
                .pop(); // Navigate back when close icon is tapped
          },
        ),
        title: Text(
          title,
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath),
            const SizedBox(height: 16.0),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Steps:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(steps[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
