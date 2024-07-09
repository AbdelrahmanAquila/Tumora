import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListSwitcher(),
    );
  }
}

class ListSwitcher extends StatefulWidget {
  const ListSwitcher({super.key});

  @override
  ListSwitcherState createState() => ListSwitcherState();
}

class ListSwitcherState extends State<ListSwitcher> {
  String _selectedValue = 'List 1';

  final Map<String, List<Map<String, dynamic>>> _items = {
    'List 1': [
      {'name': 'Alice', 'age': 25},
      {'name': 'Bob', 'age': 30},
      {'name': 'Charlie', 'age': 35}
    ],
    'List 2': [
      {'name': 'David', 'age': 40},
      {'name': 'Eve', 'age': 45},
      {'name': 'Frank', 'age': 50}
    ],
    'List 3': [
      {'name': 'Grace', 'age': 55},
      {'name': 'Heidi', 'age': 60},
      {'name': 'Ivan', 'age': 65}
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown List Switcher'),
      ),
      body: Column(
        children: <Widget>[
          DropdownButton<String>(
            value: _selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                _selectedValue = newValue!;
              });
            },
            items: _items.keys.map<DropdownMenuItem<String>>((String key) {
              return DropdownMenuItem<String>(
                value: key,
                child: Text(key),
              );
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items[_selectedValue]!.length,
              itemBuilder: (context, index) {
                final item = _items[_selectedValue]![index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text('Age: ${item['age']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
