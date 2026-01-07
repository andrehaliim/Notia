import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> appBarActions;

  const CustomAppBar({super.key, required this.appBarActions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Notia', style: Theme.of(context).textTheme.titleLarge),
      titleSpacing: MediaQuery.of(context).size.width / 20,
      actions: appBarActions,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Default AppBar height
}
