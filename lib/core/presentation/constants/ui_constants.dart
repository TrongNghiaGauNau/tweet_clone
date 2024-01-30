import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone_2/core/presentation/constants/assets_constants.dart';
import 'package:twitter_clone_2/notifications/presentation/views/notification_view.dart';
import 'package:twitter_clone_2/search/presentation/views/search_view.dart';
import 'package:twitter_clone_2/settings/presentation/views/setting_view.dart';
import 'package:twitter_clone_2/theme/pallete.dart';
import 'package:twitter_clone_2/tweet/presentation/widgets/tweet_list.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        color: Pallete.blueColor,
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static const List<Widget> bottomTabBarPages = [
    TweetList(),
    SearchScreen(),
    NotificationView(),
    SettingView(),
  ];
}
