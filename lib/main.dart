import 'package:flutter/material.dart';

import 'package:gratefull_panda/Common/initial_data_sync.dart';
import 'package:gratefull_panda/Onboarding/onboarding_one_view.dart';
import 'package:gratefull_panda/Tabbar/start.dart';
import 'package:gratefull_panda/utils/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await syncInitialDataToDB();
  await AppPaths.init();
  final isDone = await UserPreferences.isOnboardingDone();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: isDone ? const DopamineSparkScreen() : const OnboardingOneView(),
      ),
    ),
  );
}
