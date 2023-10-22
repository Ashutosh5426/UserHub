import 'package:flutter/material.dart';

class CommonErrorWidget extends StatelessWidget {
  final Function() onRetry;
  const CommonErrorWidget({required this.onRetry, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/something_went_wrong.jpeg', width: 350, fit: BoxFit.cover),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: onRetry,
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.redAccent),
            ),
            child: const SizedBox(
              width: double.maxFinite,
              height: 48,
              child: Center(
                  child: Text(
                'Retry',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}