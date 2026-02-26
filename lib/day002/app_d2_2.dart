import 'package:flutter/material.dart';

class AppD22 extends StatelessWidget {
  const AppD22({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Hello ZendVN'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Text(
                  'A',
                  style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              // horizontal boxes
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'List of Article',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              // vertical article list
              ArticleRow(),
              ArticleRow(),
              ArticleRow(),
              ArticleRow(),
              ArticleRow(),
              ArticleRow(),
              ArticleRow(),
              ArticleRow(),

            ],
          ),
        ),
      ),
    );
  }
}

class ArticleRow extends StatelessWidget {
  const ArticleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 70,
          child: Text('08:AM'),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 70,
            color: Colors.amberAccent,
          ),
        )
      ],
    );
  }
}