import 'package:flutter/material.dart';
import 'package:blog_app/constants.dart';
class NewsSourceButton extends StatelessWidget {

  final String newsSource;

  const NewsSourceButton({
    super.key, required this.newsSource,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
        ),
        onPressed: (){},
        child:  Text(
          newsSource,
          style: const TextStyle(
              color: darkBlue
          ),
        ),
      ),
    );
  }
}
