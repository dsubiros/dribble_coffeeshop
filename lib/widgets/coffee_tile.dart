import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;
  final double price;

  const CoffeeTile({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(18.0)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Coffee image
              ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Image.asset(imagePath),
              ),

              // Coffee name
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0)),
                    Text(description,
                        style: TextStyle(color: Colors.grey[700])),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Price tag
                        RichText(
                          text: TextSpan(
                            text: '\$',
                            style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                            children: [
                              TextSpan(
                                  text: price.toString(),
                                  style: const TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))
                            ],
                          ),
                        ),

                        // Plus button
                        Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(6.0)),
                            child: const Icon(Icons.add))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
