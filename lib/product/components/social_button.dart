import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(.2),
        ),
      ),
      child: Center(
        child: SizedBox(
          height: 35,
          width: 35,
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage(
              imagePath,
            ),
          ),
        ),
      ),
    );
  }
}
