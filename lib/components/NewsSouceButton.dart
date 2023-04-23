import 'package:flutter/material.dart';


class NewsSourceButton extends StatefulWidget {

  final String newsSource;
  final void Function() onPressed;
  final Color buttonTextColor;
  final Color buttonColor;


  const NewsSourceButton({
    super.key, required this.newsSource, required this.onPressed, required this.buttonTextColor, required this.buttonColor,
  });

  @override
  State<NewsSourceButton> createState() => _NewsSourceButtonState();
}

class _NewsSourceButtonState extends State<NewsSourceButton> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
        backgroundColor: widget.buttonColor,
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
        ),
        onPressed: widget.onPressed,
        child:  Text(
         widget.newsSource,
          style: TextStyle(
              color: widget.buttonTextColor
          ),
        ),
      ),
    );
  }
}
