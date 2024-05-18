import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice 5',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/screen2': (context) => const NewScreen2(),
        '/screen3': (context) => const NewScreen3(),
        '/screen4': (context) => const NewScreen4(),
        '/screen5': (context) => const NewScreen5(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ListView(
        children: [
          _buildListItem(context, 'Screen 1', '/'),
          _buildListItem(context, 'Screen 2', '/screen2'),
          _buildListItem(context, 'Screen 3', '/screen3'),
          _buildListItem(context, 'Screen 4', '/screen4'),
          _buildListItem(context, 'Screen 5', '/screen5'),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class NewScreen2 extends StatelessWidget {
  const NewScreen2({Key? key}) : super(key: key);

  // Эмуляция получения данных с использованием Future API
  Future<String> _fetchData() async {
    return Future.delayed(
      const Duration(seconds: 2),
          () => 'Data fetched from Future API',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Error fetching data');
            } else {
              return Text(snapshot.data ?? 'No data');
            }
          },
        ),
      ),
    );
  }
}

class NewScreen3 extends StatelessWidget {
  const NewScreen3({Key? key}) : super(key: key);

  // Эмуляция сохранения данных с использованием async/await
  Future<void> _saveData() async {
    await Future.delayed(const Duration(seconds: 2));
    print('Data saved with async/await');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 3'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _saveData();
            Navigator.pushNamed(context, '/screen4');
          },
          child: const Text('Save Data and Go to Screen 4'),
        ),
      ),
    );
  }
}

class NewScreen4 extends StatelessWidget {
  const NewScreen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 4'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/screen5');
          },
          child: const Text('Go to Screen 5'),
        ),
      ),
    );
  }
}

class NewScreen5 extends StatelessWidget {
  const NewScreen5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 5'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back'),
        ),
      ),
    );
  }
}



