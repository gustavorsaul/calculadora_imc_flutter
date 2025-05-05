import 'package:flutter/material.dart';

class BotaoCalcularImc extends StatelessWidget {
  BotaoCalcularImc({required this.onPressed});

  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () => onPressed(),

        child: Text("Calcular", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
