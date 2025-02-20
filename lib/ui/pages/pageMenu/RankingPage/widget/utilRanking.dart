import 'package:flutter/material.dart';

class Utilranking {

  Widget buildAvatar(String imageUrl, String username, int score, Color borderColor, int rank, {bool isFirst = false}) {
  return Column(
    children: [
      Stack(
        children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor, width: 4),
            ),
            child: ClipOval(
              child: Image.network(
                imageUrl,
                width: isFirst ? 100 : 80,  // Ajusta el tamaño dependiendo de si es el primero o no
                height: isFirst ? 100 : 80, // Mantén la proporción de círculo
                fit: BoxFit.cover,  // Asegúrate de que la imagen se cubra bien
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white,
              child: Text(
                "$rank",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 8),
     Container(
  width: 80,  // Ajusta el valor según el tamaño que necesites
  child: Center(
    child: Text(
      username,
      overflow: TextOverflow.ellipsis, // Esto corta el texto si es más largo
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  ),
)
,
      Text("$score pts", style: TextStyle(fontSize: 14, color: Colors.white)),
    ],
  );
}


  
  Widget buildRankingItem({
    required int position,
    required String avatar,
    required String name,
    String? username,
    required String points,
    bool isVerified = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[800],
                child: avatar.contains('http')
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(avatar),
                      )
                    : Text(
                        avatar,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      ),
              ),
              if (isVerified)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(Icons.verified, color: Colors.blue, size: 18),
                )
            ],
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    if (position == 1)
                      Icon(Icons.workspace_premium, 
                          color: const Color.fromARGB(255, 225, 203, 5), size: 20)
                  ],
                ),
                if (username != null)
                  Text(
                    username,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12),
                  ),
              ],
            ),
          ),
          Text(
            points,
            style: TextStyle(
              color: Colors.yellow[800],
              fontSize: 16,
              fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }



}