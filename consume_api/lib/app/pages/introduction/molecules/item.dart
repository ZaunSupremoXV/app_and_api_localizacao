import 'package:flutter/material.dart';

class ItemPageIntroduction extends StatefulWidget {
  Color color;
  String urlImage;
  String title;
  String subtitle;
  ItemPageIntroduction({
    Key? key,
    required this.color,
    required this.urlImage,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  State<ItemPageIntroduction> createState() => _ItemPageIntroductionState();
}

class _ItemPageIntroductionState extends State<ItemPageIntroduction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: Image.asset(
              widget.urlImage,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 64),
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.teal.shade700,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Text(
              widget.subtitle,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
