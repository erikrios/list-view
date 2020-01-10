import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Demo Flutter',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: ListViewBuilderHomePage(),
      );
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> createItems(int count) {
    List<Widget> items = List<Widget>();
    for (var i = 0; i < count; i++) {
      items.add(ListTile(
        title: Text('Item ${i + 1}'),
        leading: Icon(Icons.person),
        trailing: Icon(Icons.delete),
      ));
      items.add(Divider(
        color: Colors.black,
      ));
      return items;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Demo ListView'),
        ),
        body: ListView(
          padding: EdgeInsets.all(30.0),
          children: createItems(20),
        ),
      );
}

class ListViewBuilderHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListViewBuilderHomePageState();
}

class _ListViewBuilderHomePageState extends State<ListViewBuilderHomePage> {
  final int count = 20;
  List<bool> items = List<bool>();

  @override
  void initState() {
    setState(() {
      for (var i = 0; i < this.count; i++) {
        items.add(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Demo ListView'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Item ${index + 1}'),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.delete),
              onTap: () {
                print('Anda memilih item ${index + 1}');
              },
            );
          },
        ),
      );
}
