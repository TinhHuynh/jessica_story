import 'package:flutter/material.dart';

class CardYouTube extends StatelessWidget {
  final String youTubeImageUrl;
  final String youTubeTitle;
  final VoidCallback onPressed;

  const CardYouTube({
    super.key,
    required this.youTubeImageUrl,
    required this.youTubeTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Image.network(
                youTubeImageUrl,
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 20),
              Expanded(child: Text(youTubeTitle)),
            ],
          ),
        ),
      ),
    );
  }
}
