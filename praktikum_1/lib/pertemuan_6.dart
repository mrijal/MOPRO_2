import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

// Akar aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stateful Widget Demo',
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

// Bagian yang menyimpan data & logika perubahan
class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter += 40;
    });
  }

  void decraseCounter() {
    setState(() {
      if (counter <= 0) {
        counter = 0;
      } else {
        counter -= 20;
      }
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  void timesByTwo() {
    setState(() {
      counter *= 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contoh Stateful Widget'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Image(
            //   image: const AssetImage('images/tinton.jpg'),
            //   height: 100,
            //   width: 80,
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: const AssetImage('images/tinton.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Jumlah Klik:', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 10),
            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: incrementCounter,
                  icon: const Icon(Icons.add),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  label: const Text('Tambah'),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: decraseCounter,
                  icon: const Icon(Icons.remove),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  label: const Text('Kurang'),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: resetCounter,
                  icon: const Icon(Icons.refresh),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                  ),
                  label: const Text('Reset'),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: timesByTwo,
                  icon: const Icon(Icons.close),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow),
                  ),
                  label: const Text('2'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
