import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gfcg_movies_app/config/config.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  
  await dotenv.load(fileName: ".env");

  runApp(
    ProviderScope(
      child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  //animate_do, card_swiper, dio, flutter_dotenv, flutter_riverpod, go_router, youtube_player_flutter

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
