import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    ScreenWidget(
      color: Colors.red,
      title: 'Screen 1',
    ),
    ScreenWidget(
      color: Colors.green,
      title: 'Screen 2',
    ),
    ScreenWidget(
      color: Colors.blue,
      title: 'Screen 3',
    ),
    ScreenWidget(
      color: Colors.orange,
      title: 'Screen 4',
    ),
    ScreenWidget(
      color: Colors.purple,
      title: 'Screen 5',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Screen 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Screen 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Screen 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Screen 4',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Screen 5',
          ),
        ],
      ),
    );
  }
}

class ScreenWidget extends StatelessWidget {
  final Color color;
  final String title;

  const ScreenWidget({required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
