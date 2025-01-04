import 'package:flutter/material.dart';
import '../../layouts/admin_layout.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminLayout(
      selectedIndex: 1, // Seleccionamos la pestaña de "Configuración"
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sección Afiliados
              _buildSectionContainer(
                context,
                title: 'Afiliados',
                rows: [
                  ['Juan Pérez', '01/01/2023', '01/01/2024'],
                  ['María López', '15/03/2023', '15/03/2024'],
                ],
              ),
              const SizedBox(height: 30),

              // Sección Menú
              _buildSectionContainer(
                context,
                title: 'Menú',
                rows: [
                  ['Hamburguesa', 'Comida rápida'],
                  ['Ensalada César', 'Saludable'],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Contenedor con borde para cada sección
  Widget _buildSectionContainer(BuildContext context, {
    required String title,
    required List<List<String>> rows,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),  // Bordes más sutiles
        border: Border.all(color: Colors.grey.shade300),  // Borde sutil
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título con el ícono de + en la esquina superior derecha
          _buildSectionTitleWithAddButton(context, title),
          const SizedBox(height: 10),
          Column(
            children: rows.map((row) {
              return _buildTableRow(context, row);
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Título con el ícono de agregar en la esquina superior derecha
  Widget _buildSectionTitleWithAddButton(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,  // Color por defecto
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add, color: Colors.black54),
          onPressed: () {
            _showAddItemDialog(context, title); // Abre el formulario
          },
        ),
      ],
    );
  }

  // Fila de la tabla sin bordes
  Widget _buildTableRow(BuildContext context, List<String> row) {
    return GestureDetector(
      onTap: () {
        // Acción al hacer clic en la fila
        _showRowDetails(context, row);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,  // Fondo suave por defecto
          borderRadius: BorderRadius.circular(4),  // Bordes más sutiles
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Mostrar los valores de la fila
            Row(
              children: row.map((cell) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    cell,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),  // Color por defecto
                  ),
                );
              }).toList(),
            ),
            // Flecha para indicar que se puede seleccionar
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
          ],
        ),
      ),
    );
  }

  // Mostrar detalles de la fila
  void _showRowDetails(BuildContext context, List<String> row) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Detalles de ${row[0]}'),
        content: Text(
          'Nombre: ${row[0]}\nFecha de Inscripción: ${row[1]}\nFecha de Expiración: ${row.length > 2 ? row[2] : 'N/A'}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  // Mostrar el formulario para agregar un nuevo elemento
  void _showAddItemDialog(BuildContext context, String sectionTitle) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Agregar nuevo elemento'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(labelText: 'Fecha'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              // Aquí puedes agregar la lógica para guardar el nuevo elemento
              Navigator.pop(context);
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }
}
