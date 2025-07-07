import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar rojo con franja naranja inferior
      appBar: AppBar(
        backgroundColor: Color(0xFFCD1F1F), // Color del AppBar
        foregroundColor: Colors.white, // Color del texto
        centerTitle: true,
        title: Text('Albion Manager'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(12),
          child: Container(
            color: Colors.orange, // Franja naranja
            height: 10,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(64), // Espaciado general

        child: Column(
          children: [
            _buildNavButton(context, 'Farm', '/farm'),
            SizedBox(height: 25),
            _buildNavButton(context, 'Crop', '/crop'),
            SizedBox(height: 25),
            _buildNavButton(context, 'Workers', '/workers'),
            SizedBox(height: 25),
            _buildNavButton(context, 'Construction', '/construction'),
            SizedBox(height: 25),
            _buildNavButton(context, 'Activities', '/activities'),
            SizedBox(height:25),
            _buildNavButton(context, 'Refine', '/refine'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String label, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Espacio entre botones
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange, // Color del botón
          foregroundColor: Colors.white,//color de letras
          minimumSize: Size(double.infinity, 50), // Botón ancho completo, altura 50
          textStyle: TextStyle(fontSize: 18), // Tamaño del texto
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Bordes redondeados
            // Color del texto
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, route); // Navega al route indicado
        },
        child: Text(label),
      ),
    );
  }
}
