import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Faker(),
    );
  }
}

class Faker extends StatelessWidget {
  const Faker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Goat()),
            );
          },
          child: Hero(
            tag: 'tag',
            child: ClipOval(
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/1/1a/Faker_2020_interview.jpg',
                width: 150,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Goat extends StatelessWidget {
  const Goat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(
              context
            );
          },
        child: Hero(
          tag: 'tag',
          child: ClipRRect(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmkeOSxU-ueLKalnuzkSnPPjBVmL4zT46Hvg&usqp=CAU',
              width: 300,
            ),
          ),
        ),
      ),
      ),
    );
  }
}
