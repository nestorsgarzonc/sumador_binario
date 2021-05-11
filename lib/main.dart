import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool a = false;
  bool b = false;

  //Getters para obtener el valor del carry y suma
  bool get carry => a & b;
  bool get sum => a ^ b;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sumador binario'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('A'),
                Switch(value: a, onChanged: (val) => setState(() => a = val)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('B'),
                Switch(value: b, onChanged: (val) => setState(() => b = val)),
              ],
            ),
            Divider(),
            Text('RESULTADO'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('SUMA'), ResultBox(res: sum)],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('CARRY'), ResultBox(res: carry)],
            ),
            Spacer(),
            Text('By: Sebastian Garzon')
          ],
        ),
      ),
    );
  }
}

class ResultBox extends StatelessWidget {
  const ResultBox({Key key, @required this.res}) : super(key: key);

  final bool res;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: res ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
