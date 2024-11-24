import 'package:flutter/material.dart';

class SearchComponent extends StatefulWidget {
  @override
  _SearchComponentState createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: _isTyping ? Colors.yellow : Colors.grey,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: '¿Qué deseas hacer?',
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    border: InputBorder.none,
                  ),
                  onTap: () {
                    setState(() {
                      _isTyping = true;
                    });
                  },
                  onChanged: (text) {
                    if (text.isEmpty) {
                      setState(() {
                        _isTyping = false;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          if (!_isTyping) ...[
            SizedBox(height: 8.0),
            Text(
              'Crear una receta, chat, planificar tareas...',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
