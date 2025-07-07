import 'package:flutter/material.dart';

class CropScreen extends StatefulWidget {
  @override
  _CropScreenState createState() => _CropScreenState();
}

class _CropScreenState extends State<CropScreen> {
  String? selectedPlant;
  String? selectedTier;
  String probability = '0%';
  final amountController = TextEditingController();
  bool bonoCiudad = false;
  bool premium = false;
  bool foco = false;

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Query results'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Probability: $probability %'),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Send'),
            )
          ],
        );
      },
    );
  }

  void _calculateProbability() {
    setState(() {
      probability = '65%';
    });
    _showResultDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCD1F1F),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Crop'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(12.0),
          child: Container(
            color: Colors.orange,
            height: 10.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: selectedPlant,
              decoration: InputDecoration(
                labelText: 'Type of plant:',
                border: OutlineInputBorder(),
              ),
              items: ['Flower','Vegetable']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedPlant = value;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedTier,
              decoration: InputDecoration(
                labelText: 'Tier:',
                border: OutlineInputBorder(),
              ),
              items: ['T3', 'T4', 'T5', 'T6', 'T7', 'T8']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedTier = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount:',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Text(
              'probability of seed: $probability %',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text('City bonus'),
              activeColor: Colors.green,
              value: bonoCiudad,
              onChanged: (val) {
                setState(() {
                  bonoCiudad = val;
                });
              },
            ),
            SwitchListTile(
              title: Text('Premium'),
              activeColor: Colors.green,
              value: premium,
              onChanged: (val) {
                setState(() {
                  premium = val;
                });
              },
            ),
            SwitchListTile(
              title: Text('Foco'),
              activeColor: Colors.green,
              value: foco,
              onChanged: (val) {
                setState(() {
                  foco = val;
                });
              },
            ),

            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF89461C),
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: _calculateProbability,
              child: Text('Consultar'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDisabledRadio(String label) {
    return RadioListTile<String>(
      value: label,
      groupValue: null,
      onChanged: null,
      title: Text(label),
    );
  }
}
