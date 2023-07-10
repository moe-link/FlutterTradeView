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
  String selectedItem = ''; // 选中的列表项
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

  void handleItemClick(String item) {
    setState(() {
      selectedItem = item;
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
                        width: 150,
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: selectedChoice == 'Categories' ? Colors.blue : Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Categories',
                            style: TextStyle(
                              color: selectedChoice == 'Categories' ? Colors.white : Colors.black,
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
                        width: 150,
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: selectedChoice == 'Shippings' ? Colors.blue : Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Shippings',
                            style: TextStyle(
                              color: selectedChoice == 'Shippings' ? Colors.white : Colors.black,
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
                    children: const [
                      ExpansionTile(
                        title: Text('element'),
                        initiallyExpanded: false,
                        children: <Widget>[
                          ListTile(title: Text('One')),
                          ListTile(title: Text('Two')),
                          ListTile(title: Text('Free')),
                          ListTile(title: Text('Four'))
                        ]
                      ),
                      ExpansionTile(
                          title: Text('product'),
                          initiallyExpanded: false,
                          children: <Widget>[
                            ListTile(title: Text('One')),
                            ListTile(title: Text('Two')),
                            ListTile(title: Text('Free')),
                            ListTile(title: Text('Four'))
                          ]
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  selectedItem,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
