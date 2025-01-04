import 'package:flutter/material.dart';

class UserLayout extends StatelessWidget {
  final Widget body;
  final String title;

  const UserLayout({Key? key, required this.body, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Text(
                'Menú',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Perfil'),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text('Pedidos'),
              leading: Icon(Icons.shopping_cart),
            ),
            ListTile(
              title: Text('Cerrar sesión'),
              leading: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Cambia este valor según el índice seleccionado
        type: BottomNavigationBarType.fixed, // Barra de navegación con un diseño fijo
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.storefront,
              size: 28,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: 28,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 28,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
