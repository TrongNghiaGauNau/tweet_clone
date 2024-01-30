import 'package:flutter/material.dart';
import 'package:twitter_clone_2/core/application/const.dart';
import 'package:twitter_clone_2/theme/pallete.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';
import 'package:twitter_clone_2/user_profile/presentation/views/profile_screen.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({super.key, required this.user});

  final User user;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfileScreen(uid: user.uid))),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            user.profilePic == '' ? defaultAvatar : user.profilePic),
        radius: 30,
      ),
      title: Text(
        user.name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '@${user.name}',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            user.bio,
            style: const TextStyle(color: Pallete.whiteColor),
          )
        ],
      ),
    );
  }
}
