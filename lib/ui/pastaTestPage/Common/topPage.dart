import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class topPage extends StatefulWidget {
  const topPage({
    super.key,
    required this.panddCont,
    required this.colorCont,
    required this.borderCont,
    required this.IconnsBack,
    required this.pagesConfigC,
    required this.isPagesConfig,
    required this.IconnsP,
    required this.title,
    required this.subTitle,
    required this.colorIcon,
    required this.buttonRight,
    this.direccButton,
    this.textButton,
    this.colorButton,
    this.totalCC,
    this.coexContro,
    this.page,
  });

  final double panddCont;
  final Color colorCont;
  final double borderCont;
  final IconData IconnsBack;
  final dynamic pagesConfigC;
  final bool isPagesConfig;
  final IconData IconnsP;
  final String title;
  final String subTitle;
  final Color colorIcon;
  final bool buttonRight;
  final String? direccButton;
  final String? textButton;
  final Color? colorButton;
  final String? totalCC;
  final dynamic coexContro;
  final String? page;

  @override
  State<topPage> createState() => _TopPageState();
}

class _TopPageState extends State<topPage> {
  bool showSearchField = false;
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 5),
        child: Container(
          height: showSearchField ? 140 : 90, // Ajusta la altura según el estado de búsqueda
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            color: widget.colorCont,
            borderRadius: BorderRadius.all(Radius.circular(widget.borderCont)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          widget.IconnsBack,
                          color: const Color.fromARGB(200, 0, 0, 0),
                        ),
                        onPressed: () {
                          if ((widget.title == 'Servicios' || widget.title == 'Productos') &&
                              widget.page == 'Coordinador') {
                            widget.pagesConfigC.goToPreviousPage();
                          } else if (widget.isPagesConfig) {
                            if (widget.title == 'Carro de Compra') {
                              widget.pagesConfigC.previousPage();
                            } else {
                              widget.pagesConfigC.back();
                            }
                          } else {
                            context.pop();
                          }
                        },
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1.0),
                              color: widget.colorIcon,
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(widget.IconnsP, size: 40, color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color.fromARGB(200, 0, 0, 0)),
                              ),
                              Text(
                                widget.subTitle,
                                style: const TextStyle(
                                    fontSize: 11, color: Color.fromARGB(180, 0, 0, 0)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(showSearchField ? Icons.close : Icons.search, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        showSearchField = !showSearchField;
                        searchQuery = ""; // Reinicia la búsqueda
                      });
                    },
                  ),
                ],
              ),
              if (showSearchField)
                Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
  child: TextField(
    onChanged: (value) {
      setState(() {
        searchQuery = value;
      });
    },
    decoration: InputDecoration(
      hintText: "Buscar ingreso...",
      filled: true,
      fillColor: Colors.white,
      prefixIcon: const Icon(Icons.search),
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16), // Ajusta la altura
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}
