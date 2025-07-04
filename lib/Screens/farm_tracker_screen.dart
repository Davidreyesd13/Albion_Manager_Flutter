import 'package:flutter/material.dart';

class FarmTrackerScreen extends StatefulWidget {
  @override
  _FarmTrackerScreenState createState() => _FarmTrackerScreenState();
}

class _FarmTrackerScreenState extends State<FarmTrackerScreen> {
  final List<String> _records = [];
  final TextEditingController _quantityController = TextEditingController();
  String? _selectedAnimal;

  final List<String> _animalTypes = [
    'T3 Pig',
    'T4 Pig',
    'T5 Pig',
    'T6 Pig',
    'T7 Pig',
    'T8 Pig',
  ];

  void _addRecord() {
    if (_selectedAnimal != null && _quantityController.text.isNotEmpty) {
      setState(() {
        _records.add('${_quantityController.text} ${_selectedAnimal!}');
        _quantityController.clear();
        _selectedAnimal = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farm Tracker'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _quantityController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Qty',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedAnimal,
                        items: _animalTypes
                            .map((animal) => DropdownMenuItem(
                          value: animal,
                          child: Text(animal),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedAnimal = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Type',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _addRecord,
                      child: Text('Add'),
                      style: ElevatedButton.styleFrom(
                        padding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: _records.isEmpty
                  ? Center(child: Text('No records yet.'))
                  : ListView.builder(
                itemCount: _records.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_records[index]),
                    ),
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
