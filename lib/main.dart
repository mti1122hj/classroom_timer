import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:classroom_timer/core/providers/isar_provider.dart';
import 'package:classroom_timer/data/models/class_session_type_model.dart';
import 'package:classroom_timer/data/models/classroom_timer_model.dart';
import 'package:classroom_timer/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [
      ClassroomTimerModelSchema,
      ClassSessionTypeModelSchema,
    ],
    directory: dir.path,
  );

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson Pace Maker',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', 'JP'),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5579FA),
          primary: const Color(0xFF5579FA),
          background: const Color(0xFFF5F6F8),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F6F8),
        fontFamily: GoogleFonts.notoSansJp().fontFamily,
        textTheme: GoogleFonts.notoSansJpTextTheme(),
      ),

      home: const HomePage(),
    );
  }
}
