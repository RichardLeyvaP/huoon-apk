
import 'package:flutter/material.dart';

class ListTileRanking extends StatelessWidget {
  const ListTileRanking({
    super.key,
    required this.person,
  });

  final Map<String, dynamic> person;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(person["imagePerson"]),
      ),
      title: Text(person["namePerson"]),
      subtitle: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(person["rolePerson"]),
          Row(            
            children: List.generate(5, (i) {
              return Icon(
                i < person["ranking"] ? Icons.star : Icons.star_border,
                color: Colors.amber,
              );
            }),
          ),
        ],
      ),
    );
  }
}
