import 'dart:io';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Entellitrade ${DateTime.now().year}.${DateTime.now().month}.${DateTime.now().day}');
    setWindowMinSize(const Size(1000, 600));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String selectedChoice = 'Categories'; // 初始选择为 element
  List<String> dataList = []; // 存储接口返回的数据列表
  List<String> elementList  = []; // element list
  List<String> productList = [];  // product list
  List<String> shippingList = []; // shipping list
  List<int> mList = [1,2 ,3];

  void selectChoice(String choice) {
    setState(() {
      selectedChoice = choice;
      // 在选择改变时调用接口获取数据
      fetchData();
    });
  }

  Future<void> fetchData() async {
    // TODO: 调用接口获取数据
    // 模拟异步获取数据，这里使用 Future.delayed 来模拟接口调用
    await Future.delayed(const Duration(seconds: 1));

    // 假设接口返回的数据是一个字符串列表
    List<String> newData = ['Item 1', 'Item 2', 'Item 3'];

    setState(() {
      dataList = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: 300,
            color: Colors.grey[200],
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        selectChoice('Categories');
                      },
                      child: Container(
                        width: 120,
                        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        decoration: BoxDecoration(
                          color: selectedChoice == 'Categories' ? Colors.blue : Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            'Categories',
                            style: TextStyle(
                              color: selectedChoice == 'Categories' ? Colors.white : Colors.grey[800],
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectChoice('Shippings');
                      },
                      child: Container(
                        width: 120,
                        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        decoration: BoxDecoration(
                          color: selectedChoice == 'Shippings' ? Colors.blue : Colors.grey[200],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            'Shippings',
                            style: TextStyle(
                              color: selectedChoice == 'Shippings' ? Colors.white : Colors.grey[800],
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ...(selectedChoice == 'Shippings' ? [
                        const ExpansionTile(
                          title: Text('shippings'),
                          leading: Icon(Icons.folder),
                          backgroundColor: Colors.white12,
                          initiallyExpanded: false,
                          children: <Widget>[
                            ListTile(title: Text('OneText')),
                            ListTile(title: Text('TwoText')),
                            ListTile(title: Text('ThreeText')),
                            ListTile(title: Text('FourText'))
                          ]
                        )
                      ] : [
                        const ExpansionTile(
                            title: Text('element'),
                            leading: Icon(Icons.folder),
                            backgroundColor: Colors.white12,
                            initiallyExpanded: false,
                            children: <Widget>[
                              ListTile(title: Text('OneText')),
                              ListTile(title: Text('TwoText')),
                              ListTile(title: Text('ThreeText')),
                              ListTile(title: Text('FourText'))
                            ]
                        ),
                        const ExpansionTile(
                          title: Text('product'),
                          leading: Icon(Icons.folder),
                          backgroundColor: Colors.white12,
                          initiallyExpanded: false,
                          children: <Widget>[
                            ListTile(title: Text('OneContent')),
                            ListTile(title: Text('TwoContent')),
                            ListTile(title: Text('ThreeContent')),
                            ListTile(title: Text('FourContent'))
                          ]
                        ),
                      ])
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              color: Colors.grey[300],
              child: const Center(
              ),
            ),
          ),
        ],
      ),
    );
  }
}
