import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluetooth_controller/features/core/presentation/blocs/bloc/bluetooth_bloc.dart';
import 'package:bluetooth_controller/features/core/presentation/pages/app_nav_page.dart';
import 'package:bluetooth_controller/features/core/presentation/widgets/bt_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BluetoothBloc()..add(InitStateEvent()),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: ResponsiveSizer(builder: (context, orientation, screentype) {
        return MaterialApp(
          title: 'Bluetooth Controller',
          themeMode: ThemeMode.light,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: BtColor.blue),
            // useMaterial3: true,
            fontFamily: "FoundersGrotesk",
          ),
          home: AppNavPage(),
        );
      }),
    );
  }
}
