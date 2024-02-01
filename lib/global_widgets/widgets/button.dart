import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  const BlueButton(this.btnText, {super.key});

  final String btnText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 300.0,
          height: 48.0,
          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 10, 76, 199),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              btnText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
