import 'package:flutter/material.dart';

class PopularItemsHome extends StatefulWidget {
  const PopularItemsHome({super.key});

  @override
  State<PopularItemsHome> createState() => _PopularItemsHomeState();
}

class _PopularItemsHomeState extends State<PopularItemsHome> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 1,
        ),
        shrinkWrap: true,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.network(
              'https://images.unsplash.com/photo-1575932444877-5106bee2a599?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxrb3JlYW4lMjBjaGlja2VufGVufDB8fHx8MTY5NjQyMzk4N3ww&ixlib=rb-4.0.3&q=80&w=1080',
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.network(
              'https://images.unsplash.com/photo-1639321905636-c1c0e71fb467?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxiaWJpbWJhcHxlbnwwfHx8fDE2OTY0MjQwMTZ8MA&ixlib=rb-4.0.3&q=80&w=1080',
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.network(
              'https://images.unsplash.com/photo-1679581083578-94eae6e8d7a4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHx0dGVva2Jva2tpfGVufDB8fHx8MTY5NjQyNDA0NXww&ixlib=rb-4.0.3&q=80&w=1080',
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.network(
              'https://images.unsplash.com/photo-1562749606-0a9eb5a8a0f3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxzYW1neWV0YW5nfGVufDB8fHx8MTY5NjQyNDA4MXww&ixlib=rb-4.0.3&q=80&w=1080',
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
