import 'package:flutter/material.dart';

class AdminLayout extends StatelessWidget {
  final Widget body; // Contenido principal de cada página
  final int selectedIndex; // Índice del botón seleccionado

  const AdminLayout({Key? key, required this.body, this.selectedIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Administración'),
        centerTitle: true,
      ),
      body: body, // Aquí se inyecta el contenido de la página
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  // Barra de navegación simple con 3 botones
  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        // Cambia de página dependiendo del botón seleccionado
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/settings');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/stats');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configuración',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics),
          label: 'Estadísticas',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
    );
  }
}
