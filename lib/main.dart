import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice 8',
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
    // Список URL-адресов изображений
    final List<String> imageUrls = [
      'https://cdn.tripster.ru/photos/41d79b35-f2c2-48eb-97d6-d4c69e8e539d.jpg',
      'https://masterpiecer-images.s3.yandex.net/e8d93bf5884411eebe671e5d9776cfa6:upscaled',
      'https://assets.change.org/photos/9/au/lq/NQAULqXWrTgtwxH-800x450-noPad.jpg?1529671287',
      'https://cdnuploads.aa.com.tr/uploads/Contents/2022/12/10/thumbs_b_c_7e823d2d2bddb80ba76e8a4b041a1a9b.jpg?v=002153',
      'https://avatars.dzeninfra.ru/get-zen_doc/138668/pub_5ac4796f256d5c91f783fe17_5ac4b215f03173368dd63fb9/scale_1200',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 4'),
      ),
      body: ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              imageUrl: imageUrls[index],
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          );
        },
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
