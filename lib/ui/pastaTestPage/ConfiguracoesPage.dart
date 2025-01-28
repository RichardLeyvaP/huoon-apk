import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatefulWidget {
  @override
  _ConfiguracoesPageState createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  // Variables de configuración
  bool _isDarkMode = false;
  bool _notificationsEnabled = true;
  String _language = 'Português';
  
  // Variables para el perfil de usuario
  TextEditingController _nameController = TextEditingController(text: 'Carlos Silva');
  TextEditingController _emailController = TextEditingController(text: 'carlos@exemplo.com');

  // Cambiar entre tema claro y oscuro
  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  // Cambiar estado de las notificaciones
  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
  }

  // Cambiar el idioma de la aplicación
  void _changeLanguage(String? newLanguage) {
    setState(() {
      _language = newLanguage ?? _language;
    });
  }

  // Mostrar un diálogo para cambiar la contraseña
  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String oldPassword = '';
        String newPassword = '';
        String confirmPassword = '';
        
        return AlertDialog(
          title: Text("Cambiar Contraseña"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Contraseña Actual'),
                onChanged: (value) => oldPassword = value,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Nueva Contraseña'),
                onChanged: (value) => newPassword = value,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirmar Nueva Contraseña'),
                onChanged: (value) => confirmPassword = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                if (newPassword == confirmPassword) {
                  // Lógica para cambiar la contraseña
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Contraseña cambiada con éxito.'),
                  ));
                } else {
                  // Mensaje de error
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Las contraseñas no coinciden.'),
                  ));
                }
              },
              child: Text("Cambiar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Sección de Perfil de Usuario
            ListTile(
              title: Text("Perfil"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: "Nombre"),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: "Correo Electrónico"),
                  ),
                ],
              ),
            ),
            Divider(),

            // Sección de Tema de la Aplicación
            ListTile(
              title: Text("Tema de la Aplicación"),
              subtitle: Text(_isDarkMode ? "Oscuro" : "Claro"),
              trailing: Switch(
                value: _isDarkMode,
                onChanged: _toggleTheme,
              ),
            ),
            Divider(),

            // Sección de Notificaciones
            ListTile(
              title: Text("Notificaciones"),
              subtitle: Text(_notificationsEnabled ? "Activadas" : "Desactivadas"),
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: _toggleNotifications,
              ),
            ),
            Divider(),

            // Sección de Idioma
            ListTile(
              title: Text("Idioma"),
              subtitle: Text(_language),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () async {
                String? selectedLanguage = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: Text("Seleccionar Idioma"),
                      children: [
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 'Português');
                          },
                          child: Text('Português'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 'Español');
                          },
                          child: Text('Español'),
                        ),
                      ],
                    );
                  },
                );
                if (selectedLanguage != null) {
                  _changeLanguage(selectedLanguage);
                }
              },
            ),
            Divider(),

            // Sección de Cambio de Contraseña
            ListTile(
              title: Text("Cambiar Contraseña"),
              subtitle: Text("Actualiza tu contraseña"),
              trailing: Icon(Icons.lock),
              onTap: _showChangePasswordDialog,
            ),
            Divider(),

            // Botón de guardar cambios
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  // Aquí guardamos las configuraciones
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Configuraciones guardadas con éxito.'),
                  ));
                },
                child: Text("Guardar Configuraciones"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0), backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
