import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double radius;
  final String? imagePath;

  const UserAvatar({
    Key? key,
    required this.radius,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: imagePath != null ? AssetImage(imagePath!) : null,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      child: imagePath == null
          ? Icon(
              Icons.person,
              size: (radius + 10),
              color: Theme.of(context).colorScheme.primary,
            )
          : null,
    );
  }
}
