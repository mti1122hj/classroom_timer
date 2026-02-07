import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          letterSpacing: -0.4,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      centerTitle: centerTitle,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: showBackButton,
      iconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
