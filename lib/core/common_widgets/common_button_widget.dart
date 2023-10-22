import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  const CustomButtonWidget({required this.onPressed, required this.buttonText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          width: double.maxFinite,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFFB0101),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
              ),
            ),
          )
      ),
    );
  }
}
