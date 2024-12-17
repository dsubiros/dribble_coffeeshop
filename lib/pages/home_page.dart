import 'package:dribble_coffeeshop/widgets/coffee_tile.dart';
import 'package:dribble_coffeeshop/widgets/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// List of coffee types

  final List coffeeTypes = [
    ['Cappuccino', true],
    ['Black', false],
    ['Latte', false],
    ['Tea', false],
  ];

  // User tapped on coffee types
  void handleSelectCoffeeType(int newIndex) {
    for (var i = 0; i < coffeeTypes.length; i++) {
      setState(() => coffeeTypes[i][1] = i == newIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 20.0), child: Icon(Icons.person))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
        ],
      ),
      body: Column(
        children: [
          // Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(fontSize: 56),
            ),
          ),

          const SizedBox(height: 25),

          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_rounded),
                hintText: 'Find your coffee...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
              ),
            ),
          ),
          const SizedBox(height: 25),

          // Horizontal tabs
          SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeTypes.length,
                  itemBuilder: (ctx, index) {
                    var item = coffeeTypes[index];

                    return CoffeeType(
                        text: item[0],
                        isSelected: item[1],
                        onTap: () => handleSelectCoffeeType(index));
                  })),

          // Coffee tiles
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CoffeeTile(),
              CoffeeTile(),
              CoffeeTile(),
            ],
          ))
        ],
      ),
    );
  }
}
