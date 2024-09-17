import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ganjil/Genap & Kalkulator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List halaman untuk navigasi
  static List<Widget> _widgetOptions = <Widget>[
    OddEvenPage(),
    CalculatorPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ganjil/Genap & Kalkulator'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_1),
            label: 'Ganjil/Genap',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Halaman untuk cek ganjil/genap
class OddEvenPage extends StatefulWidget {
  @override
  _OddEvenPageState createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage> {
  TextEditingController numberController = TextEditingController();
  String result = '';

  void _checkOddEven() {
    int? number = int.tryParse(numberController.text);
    if (number == null) {
      setState(() {
        result = "Masukkan angka yang valid";
      });
    } else {
      setState(() {
        if (number % 2 == 0) {
          result = "Angka $number adalah Genap";
        } else {
          result = "Angka $number adalah Ganjil";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: numberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Masukkan Angka',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _checkOddEven,
            child: Text('Cek Ganjil/Genap'),
          ),
          SizedBox(height: 20),
          Text(
            result,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

// Halaman untuk kalkulator sederhana
class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();
  String result = '';

  void _addNumbers() {
    int? num1 = int.tryParse(firstNumberController.text);
    int? num2 = int.tryParse(secondNumberController.text);

    if (num1 == null || num2 == null) {
      setState(() {
        result = "Masukkan angka yang valid";
      });
    } else {
      setState(() {
        result = "Hasil Penjumlahan: ${num1 + num2}";
      });
    }
  }

  void _subtractNumbers() {
    int? num1 = int.tryParse(firstNumberController.text);
    int? num2 = int.tryParse(secondNumberController.text);

    if (num1 == null || num2 == null) {
      setState(() {
        result = "Masukkan angka yang valid";
      });
    } else {
      setState(() {
        result = "Hasil Pengurangan: ${num1 - num2}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: firstNumberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Angka Pertama',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: secondNumberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Angka Kedua',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _addNumbers,
                child: Text('Tambah'),
              ),
              ElevatedButton(
                onPressed: _subtractNumbers,
                child: Text('Kurang'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            result,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
