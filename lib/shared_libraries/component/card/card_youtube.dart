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
        borderOnForeground: true,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                Image.network(
                  youTubeImageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                  width: MediaQuery.sizeOf(context).width,
            
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 16),
                  child: Expanded(child: Text(youTubeTitle)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
