import 'package:flutter/material.dart';

class WorkersScreen extends StatelessWidget {
  const WorkersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedWorker = 'Mercenary';
    String? selectedTier = 'I';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workers', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.red.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('WorkerType:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              value: selectedWorker,
              items: ['Mercenary', 'Blacksmith', 'Cook']
                  .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                  .toList(),
              onChanged: (_) {},
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const Text('Tier:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              value: selectedTier,
              items: ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII']
                  .map((tier) => DropdownMenuItem(value: tier, child: Text(tier)))
                  .toList(),
              onChanged: (_) {},
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const Text('Amount:', style: TextStyle(fontWeight: FontWeight.bold)),
            const TextField(decoration: InputDecoration(border: OutlineInputBorder())),
            const SizedBox(height: 16),
            const Text('Time to Start:', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    items: List.generate(12, (index) => (index + 1).toString())
                        .map((h) => DropdownMenuItem(value: h, child: Text(h)))
                        .toList(),
                    onChanged: (_) {},
                    decoration: const InputDecoration(labelText: "Hour"),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    items: List.generate(60, (index) => index.toString().padLeft(2, '0'))
                        .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                        .toList(),
                    onChanged: (_) {},
                    decoration: const InputDecoration(labelText: "Mins"),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    items: ['AM', 'PM']
                        .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                        .toList(),
                    onChanged: (_) {},
                    decoration: const InputDecoration(labelText: "AM/PM"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B4513),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: const Text('ADD'),
            )
          ],
        ),
      ),
    );
  }
}
