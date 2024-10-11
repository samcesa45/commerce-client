import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gx_tutorial/app_routes.dart';
import 'package:gx_tutorial/controllers/count.dart';
import 'package:gx_tutorial/users/authentication/signup.dart';
import 'package:gx_tutorial/services/helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const Login(),
      initialRoute: AppRoutes.REGISTER_SCREEN,
      getPages: AppRoutes.routes,
      navigatorObservers: [NavigatorObserver()],
      debugShowCheckedModeBanner: false,
      home: const Signup(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  final CountController c = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'You have clicked ${c.count} Number of Times',
                )),
            Obx(() => Text(
                  '${c.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: c.increment,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
          FloatingActionButton(
            onPressed: c.decrement,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
