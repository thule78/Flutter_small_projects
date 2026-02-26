import 'package:flutter/material.dart';

class AppD21 extends StatelessWidget {
  const AppD21({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: true,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ZendVN'),
              Text(
                'Flutter Online Course',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
          child: Column(
            children: [
              const SizedBox(height: 25),
              // banner 
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 25),
              // categories tile
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories'),
                  TextButton(
                    onPressed: () {}, 
                    child: const Text('More...'),
                  ),
                ],
              ),
              // space
              CategoryBoxes(),
              // categories list
              // space
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('News'),
                  TextButton(
                    onPressed: () {}, 
                    child: const Text('More...'),
                  ),
                ],
              ),
              // space
              const SizedBox(height: 10),
              CategoryBoxes()
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryBoxes extends StatelessWidget {
  const CategoryBoxes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        separatorBuilder: (context, index) => 
          const SizedBox(width: 10), 
        itemBuilder: (BuildContext context, int index) { 
          return Container(
            width: 70,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }
}