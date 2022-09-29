import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Color brandColor = const Color(0XFF171A9E);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? dark) {
      ColorScheme lightColorScheme;

      if (lightDynamic != null && dark != null) {
        lightColorScheme = lightDynamic;
        //lightColorScheme = lightColorScheme;
      } else {
        lightColorScheme = ColorScheme.fromSeed(seedColor: brandColor);
      }

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material You App',
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Material You App",
                style: TextStyle(color: Colors.white)),
            backgroundColor: lightColorScheme.primary,
          ),
          backgroundColor: lightColorScheme.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                children: [
                  /// FIRST NAME
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'First Name',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),

                  /// LAST NAME
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Last Name',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),

                  ///MALE
                  const SizedBox(height: 20),

                  Row(children: [
                    Text("Remember Name"),
                    Switch(
                      // This bool value toggles the switch.
                      value: true,
                      activeColor: lightColorScheme.primary,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                      },
                    ),
                  ]),

                  /// NEXT BUTTON
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.chevron_right),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
