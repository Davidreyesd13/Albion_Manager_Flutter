import 'package:flutter/material.dart';

class FarmScreen extends StatefulWidget {
  @override
  _FarmScreenState createState() => _FarmScreenState();
}

class _FarmScreenState extends State<FarmScreen> {
  String? selectedAnimal;
  String? selectedTier;
  String probability = '0%';
  bool bonoCiudad = false;
  bool premium = false;
  bool foco = false;
  
  final amountController = TextEditingController();

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
              Text('probability of breeding: $probability %'),
              Text('Favorite resource consumption: 8'),
              Text('Non-favorite resource consumption: 10'),
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
                backgroundColor: Colors.blueGrey,
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
      probability = '75%'; // Aquí luego pones tu cálculo real
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
        title: Text('Farm'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(12.0),
          child: Container(
            color: Colors.orange,
            height: 10.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: selectedAnimal,
              decoration: InputDecoration(
                labelText: 'Type of animal:',
                border: OutlineInputBorder(),
              ),
              items: ['Farm','Mount']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedAnimal = value;
                });
              },
            ),
            SizedBox(height: 30),
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
            SizedBox(height: 30),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount:',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30),
            Text(
              'probability of breeding: $probability',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
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
            SizedBox(height: 30),
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
