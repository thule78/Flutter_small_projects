import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/local_storage.dart';
import '../models/name_repository.dart';
import '../providers/name_list_provider.dart';
import '../screens/list_screen.dart';

class Day005App extends StatelessWidget {
  const Day005App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NameListProvider>(
          create: (_) => NameListProvider(
            NameRepository(LocalStorage()),
          )..load(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Day005 - Provider JSON List',
        home: const ListScreen(),
      ),
    );
  }
}