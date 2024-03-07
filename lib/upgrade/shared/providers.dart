import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/upgrade/infratruscture/upgrade_account_repo.dart';

final upgradeAccountProvider = Provider((ref) => UpgradeAccountRepository());
