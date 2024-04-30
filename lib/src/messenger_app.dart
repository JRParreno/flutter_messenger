import 'package:flutter/material.dart';
import 'package:flutter_messenger/src/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final routes = routeConfig();

class MessengerApp extends StatefulWidget {
  const MessengerApp({super.key});

  @override
  State<MessengerApp> createState() => _MessengerAppState();
}

class _MessengerAppState extends State<MessengerApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      child: MaterialApp.router(
        routerConfig: routes,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
