import 'package:flutter/material.dart';
import 'package:huoon/data/models/tasks/tasks_model.dart';
import 'package:huoon/domain/blocs/ranking_signal/ranking_service.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void showRatingBottomSheet(BuildContext context, List<Person> participants, Function(List<Map<String, dynamic>>) onSave) {
  List<Map<String, dynamic>> ratings = participants.map((person) {
    return {
      "id": person.id,
      "person_id": person.id,
      "namePerson": person.name,
      "imagePerson": person.image,
      "points": 0,
      "description": "",
    };
  }).toList();

  showModalBottomSheet(
    isDismissible: false,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.5, // La mitad de la pantalla al abrir
        minChildSize: 0.3,
        maxChildSize: 0.8,
        expand: false,
        builder: (context, scrollController) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12,right: 4),
                          child: const Text(
                            "Dar por completada la tarea",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(MdiIcons.check,color: StyleGlobalApk.colorPrimary,)
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: ratings.length,
                        itemBuilder: (context, index) {
                          final person = ratings[index];
                          return Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(person["imagePerson"]),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(person["namePerson"], style: const TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                 
                                  Row(
                                    children: List.generate(5, (i) {
                                      return IconButton(
                                        icon: Icon(
                                          i < person["points"] ? Icons.star : Icons.star_border,
                                          color: Colors.amber,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            ratings[index]["points"] = i + 1;
                                          });
                                        },
                                      );
                                    }),
                                  ),
                                  const SizedBox(height: 2),
                                      TextField(
                                          maxLines: 2,
                                          decoration: const InputDecoration(
                                            hintText: "Escribe un comentario...",
                                            border: OutlineInputBorder(),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              ratings[index]["description"] = value;
                                            });
                                          },
                                         
                                        )
                                     
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                    ElevatedButton(
                      onPressed: () {
                       
                        Navigator.pop(context);
                      },
                      child: const Text("Cancelar"),
                    ),
                        ElevatedButton(
                          onPressed: () async {
                            onSave(ratings);
                            int taskId = 99999;
                         await  submitRanking(taskId,ratings);
                            Navigator.pop(context);
                          },
                          child: const Text("Guardar"),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    },
  );
}
