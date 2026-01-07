import 'package:flutter/material.dart';
import 'package:notia/customs/custom_appbar.dart';
import 'package:notia/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
        appBarActions: [
          IconButton(
            onPressed: () {
              final provider = Provider.of<ThemeProvider>(context, listen: false);
              provider.toggleTheme(!provider.isDarkMode);
            },
            icon: Icon(themeProvider.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
          ),
        ],
      ),
      body: Container(
        child: Center(child: Text('Hello Andre!!!', style: Theme.of(context).textTheme.bodyLarge)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('gege');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
