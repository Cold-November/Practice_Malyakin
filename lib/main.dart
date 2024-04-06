import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice 4'),
      ),
      body: ListView(
        children: [
          _buildListItem(context, 'Column', () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => _ColumnScreen()));
          }),
          _buildListItem(context, 'ListView', () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => _ListViewScreen()));
          }),
          _buildListItem(context, 'Separated ListView', () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => _SeparatedListViewScreen()));
          }),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}

class _ColumnScreen extends StatefulWidget {
  const _ColumnScreen({Key? key}) : super(key: key);

  @override
  _ColumnScreenState createState() => _ColumnScreenState();
}

class _ColumnScreenState extends State<_ColumnScreen> {
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column Screen'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _items.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Item'),
                content: TextField(
                  controller: _controller,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _items.add(_controller.text);
                        _controller.clear();
                        Navigator.of(context).pop();
                      });
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _ListViewScreen extends StatefulWidget {
  const _ListViewScreen({Key? key}) : super(key: key);

  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<_ListViewScreen> {
  final List<String> _items = ['Item A', 'Item B', 'Item C'];
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Screen'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _items.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Item'),
                content: TextField(
                  controller: _controller,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _items.add(_controller.text);
                        _controller.clear();
                        Navigator.of(context).pop();
                      });
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _SeparatedListViewScreen extends StatefulWidget {
  const _SeparatedListViewScreen({Key? key}) : super(key: key);

  @override
  _SeparatedListViewScreenState createState() => _SeparatedListViewScreenState();
}

class _SeparatedListViewScreenState extends State<_SeparatedListViewScreen> {
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Separated ListView Screen'),
      ),
      body: ListView.separated(
        itemCount: _items.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_items[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _items.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Item'),
                content: TextField(
                  controller: _controller,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _items.add(_controller.text);
                        _controller.clear();
                        Navigator.of(context).pop();
                      });
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
