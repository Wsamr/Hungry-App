import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/service/service_locator.dart';
import 'package:restaurant_app_sonic/splash_view.dart';

void main() {
  setUpServiceLocator();
  runApp(const ReataurnantApp());
}

class ReataurnantApp extends StatelessWidget {
  const ReataurnantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashView());
  }
}

class TestAssetsView extends StatelessWidget {
  const TestAssetsView({super.key});

  @override
  Widget build(BuildContext context) {
    // هنا حطي أسماء الصور اللي عايزة تتأكدي منها
    final List<String> imagePaths = [
      'assets/splash/burager.png',

      // ضيفي باقي الصور هنا
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Test Assets')),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عمودين
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          final path = imagePaths[index];
          return Card(
            elevation: 2,
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    path,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      // لو الصورة فيها مشكلة، هتظهر رسالة حمراء بدل الصورة
                      return Container(
                        color: Colors.red.shade100,
                        child: Center(
                          child: Text(
                            'Error loading\n$path',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    path.split('/').last,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
