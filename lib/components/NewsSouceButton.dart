import 'package:flutter/material.dart';
import 'package:blog_app/constants.dart';


class NewsSourceButton extends StatefulWidget {

  final String newsSource;


  const NewsSourceButton({
    super.key, required this.newsSource
  });

  @override
  State<NewsSourceButton> createState() => _NewsSourceButtonState();
}

class _NewsSourceButtonState extends State<NewsSourceButton> {

  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
         backgroundColor: isSelected ? Colors.white : darkBlue,
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
        ),
        onPressed: (){
          setState(() {

          });
        },
        child:  Text(
         widget.newsSource,
          style:  TextStyle(
              color: isSelected ? darkBlue : Colors.white
          ),
        ),
      ),
    );
  }
}
