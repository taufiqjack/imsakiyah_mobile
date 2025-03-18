import 'package:alice/alice.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:imsakiyah_mobile/cores/bloc/cubit/citizen_cubit/citizen_cubit.dart';
import 'package:imsakiyah_mobile/cores/bloc/cubit/imsakiyah_cubit/imsakiyah_cubit.dart';
import 'package:imsakiyah_mobile/cores/bloc/cubit/region_cubit/region_cubit.dart';
import 'package:imsakiyah_mobile/cores/constants/cons.dart';
import 'package:imsakiyah_mobile/cores/depedencies/injection.dart';
import 'package:imsakiyah_mobile/cores/routes/route.dart';
import 'package:imsakiyah_mobile/presentations/home/views/home_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ENV_PATH);
  Injection.init();

  logg = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var alice = locator<Alice>();
    alice.setNavigatorKey(Go.navigatorKey);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light, // status bar color
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<RegionCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<CitizenCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<ImsakiyahCubit>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const HomePageView(),
        navigatorKey: alice.getNavigatorKey(),
      ),
    );
  }
}
