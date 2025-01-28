import 'package:flutter/material.dart';
import 'package:huoon/ui/pastaTestPage/Common/topPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AjudaPage extends StatelessWidget {
  /**VARIABLES NECESARIAS PARA EL CAR DE ARRIBA */
  final IconnsBack = Icons.arrow_back;
  final IconnsP = MdiIcons.help;

  String title = 'Ajuda';
  String subTitle = 'Evacua todas tus dudas';
  final colorCont = Colors.white;
  double panddCont = 8;
  double borderCont = 12;
  final colorIcon = Colors.redAccent;
  /**VARIABLES NECESARIAS PARA EL CAR DE ARRIBA */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: topPage(
              panddCont: panddCont,
              colorCont: colorCont,
              borderCont: borderCont,
              IconnsBack: IconnsBack,
              pagesConfigC: '/aqui-una-ruta',
              isPagesConfig: false,
              IconnsP: IconnsP,
              title: title,
              subTitle: subTitle,
              colorIcon: colorIcon,
              buttonRight: false,
            ),
          ),
          Expanded(
            flex: 18,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      "Perguntas Frequentes (FAQ)",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      "Encontre respostas para as perguntas mais comuns.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FaqPage()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Tutoriales",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      "Aprenda a usar a aplicação com nossos tutoriais.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TutorialPage()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Contato com Suporte",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      "Fale conosco caso precise de ajuda.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactPage()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Política de Privacidade",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      "Leia nossa política de privacidade.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Sobre a Aplicação",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      "Saiba mais sobre a aplicação e sua versão.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutAppPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Las otras páginas se mantienen igual
class FaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perguntas Frequentes"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Como fazer um pedido?"),
            subtitle: Text("Para fazer um pedido, vá até a página de pedidos e selecione os itens."),
          ),
          ListTile(
            title: Text("Como alterar meu perfil?"),
            subtitle: Text("Acesse a página de configurações para alterar seu perfil."),
          ),
          ListTile(
            title: Text("Posso cancelar um pedido?"),
            subtitle: Text("Sim, você pode cancelar seu pedido até a confirmação de envio."),
          ),
        ],
      ),
    );
  }
}

class TutorialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tutoriais"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Como usar a aplicação"),
            subtitle: Text("Passo a passo para usar as funcionalidades principais."),
          ),
          ListTile(
            title: Text("Como configurar suas preferências"),
            subtitle: Text("Saiba como configurar sua conta e preferências."),
          ),
        ],
      ),
    );
  }
}

// Otras páginas (ContactPage, PrivacyPolicyPage y AboutAppPage) permanecen sin cambios.





class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contato com Suporte"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Seu nome"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Seu email"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Mensagem"),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para enviar el mensaje
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Mensagem enviada com sucesso!'),
                ));
              },
              child: Text("Enviar Mensagem"),
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Política de Privacidade"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Política de Privacidade...",
                style: TextStyle(fontSize: 16),
              ),
              // Aquí agregar el texto completo de la política
            ],
          ),
        ),
      ),
    );
  }
}

class AboutAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre a Aplicação"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Esta aplicação foi desenvolvida para gerenciar pedidos de comida e promoções para empresas alimentícias como pizzarias, padarias, e restaurantes.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Versão: 1.0.0",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
