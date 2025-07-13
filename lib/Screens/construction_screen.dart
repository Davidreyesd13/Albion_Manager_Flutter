import 'package:flutter/material.dart';

class ConstructionScreen extends StatelessWidget {
  const ConstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedType = 'GuildHouse';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Construction', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.red.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Type of Build:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              value: selectedType,
              items: ['GuildHouse', 'FarmBuilding', 'Workshop']
                  .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                  .toList(),
              onChanged: (_) {},
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const Text('Tier:', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButtonFormField<String>(
              items: ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII']
                  .map((tier) => DropdownMenuItem(value: tier, child: Text(tier)))
                  .toList(),
              onChanged: (_) {},
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const Text('Amount:', style: TextStyle(fontWeight: FontWeight.bold)),
            const TextField(decoration: InputDecoration(border: OutlineInputBorder())),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B4513),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
              child: const Text('Show Materials'),
            )
          ],
        ),
      ),
    );
  }
}
