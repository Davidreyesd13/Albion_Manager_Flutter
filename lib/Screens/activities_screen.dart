import 'package:flutter/material.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  String? selectedFarm;
  String? selectedWorker;
  String? selectedCrop;

  double progress = 0.0; // progreso estático por ahora

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Activities',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedFarm,
              decoration: const InputDecoration(
                labelText: 'Farm',
                border: OutlineInputBorder(),
              ),
              items: ['Animals', 'Food', 'Seeds']
                  .map((farm) => DropdownMenuItem(
                value: farm,
                child: Text(farm),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() => selectedFarm = value);
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedWorker,
              decoration: const InputDecoration(
                labelText: 'Workers',
                border: OutlineInputBorder(),
              ),
              items: ['Mercenary', 'Crafter', 'Farmer']
                  .map((worker) => DropdownMenuItem(
                value: worker,
                child: Text(worker),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() => selectedWorker = value);
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedCrop,
              decoration: const InputDecoration(
                labelText: 'Crop',
                border: OutlineInputBorder(),
              ),
              items: ['Carrot', 'Corn', 'Pumpkin']
                  .map((crop) => DropdownMenuItem(
                value: crop,
                child: Text(crop),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() => selectedCrop = value);
              },
            ),
            const SizedBox(height: 30),
            LinearProgressIndicator(
              value: progress,
              minHeight: 12,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Aquí luego colocaremos lógica de notificaciones
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tracking started')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
              ),
              child: const Text('Start Activity'),
            )
          ],
        ),
      ),
    );
  }
}
