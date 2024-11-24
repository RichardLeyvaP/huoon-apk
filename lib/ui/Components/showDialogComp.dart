import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context,
    {Color indicatorColor = Colors.blue, String message = 'Cargando datos...'}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: indicatorColor,
              ),
              SizedBox(height: 16),
              Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      );
    },
  );
}
