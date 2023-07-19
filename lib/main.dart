import 'package:flutter/material.dart';
import 'second_page.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class GlobalData extends ChangeNotifier {
  String userName = '';
  String highPressure = '';
  String lowPressure = '';
  String detailPulse = '';
  String detailBreath = '';
  String patientName = '';
  String patientAge = '';
  String patientSex = '';
  String etc = '';
  void updateString(String kind, String value) {
    switch (kind) {
      case '분류자':
        userName = value;
        break;
      case '최고':
        highPressure = value;
        break;
      case '최저':
        lowPressure = value;
        break;
      case '맥박':
        detailPulse = value;
        break;
      case '호흡':
        detailBreath = value;
        break;
      case '이름':
        patientName = value;
        break;
      case '나이':
        patientAge = value;
        break;
      case '성별':
        patientSex = value;
        break;
      case '인적사항':
        etc = value;
        break;
    }
    print("$kind: $value");
    notifyListeners();
  }

  bool is119 = true;
  bool canWalk = false;
  bool canBreath = false;
  bool pulse = false;
  void updateBoolean(String kind, bool value) {
    switch (kind) {
      case '119':
        is119 = value;
        break;
      case '보행 여부':
        canWalk = value;
        break;
      case '호흡':
        canBreath = value;
        break;
      case '맥박':
        pulse = value;
        break;
    }
    print("$kind: $value");
    notifyListeners();
  }

  int consciousness = 0;
  int emergency = 0;
  void updateInt(String kind, int value) {
    switch (kind) {
      case '의식':
        consciousness = value;
        break;
      case '응급도':
        emergency = value;
        break;
    }
    print("$kind: $value");
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'highPressure': highPressure,
      'lowPressure': lowPressure,
      'detailPulse': detailPulse,
      'detailBreath': detailBreath,
      'patientName': patientName,
      'patientAge': patientAge,
      'patientSex': patientSex,
      'etc': etc,
    };
  }

  void sendDataToServer() {
    Map<String, dynamic> data = toJson();
    String jsonData = jsonEncode(data);

    // 여기서 jsonData를 서버에 전송하는 로직을 추가하세요
  }
}

void main() {
  runApp(
    ChangeNotifierProvider<GlobalData>(
      create: (_) => GlobalData(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            shape: Border(
              bottom: BorderSide(
                color: Colors.red, // AppBar의 테두리 아래쪽 색상 설정
                width: 2, // AppBar의 테두리 아래쪽 선의 굵기 설정
              ),
            ),
            toolbarHeight: 100,
            centerTitle: true,
            titleTextStyle: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        primaryColor: Colors.red);

    return MaterialApp(
      title: 'Flutter layout demo',
      theme: themeData,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset('assets/Logo.png'),
            SizedBox(height: 100),
            TextField(
              onChanged: (value) {
                context.read<GlobalData>().updateString('분류자', value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '분류자',
              ),
            ),
            SizedBox(height: 100),
            My119Buttons(),
          ],
        ),
      ),
      bottomNavigationBar: NextPage(),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
        child: Text('다음 페이지'),
      ),
    );
  }
}

class My119Buttons extends StatefulWidget {
  const My119Buttons({
    super.key,
  });
  @override
  _My119ButtonsState createState() => _My119ButtonsState();
}

class _My119ButtonsState extends State<My119Buttons> {
  bool isFirstButtonActive = false;
  bool isSecondButtonActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              isFirstButtonActive = true;
              isSecondButtonActive = false;
            });
            context
                .read<GlobalData>()
                .updateBoolean('119', isFirstButtonActive);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: isFirstButtonActive
                  ? Color.fromARGB(255, 255, 150, 140)
                  : null,
              fixedSize: Size(150, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: Text('119'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isFirstButtonActive = false;
              isSecondButtonActive = true;
            });
            context
                .read<GlobalData>()
                .updateBoolean('119', isFirstButtonActive);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: isSecondButtonActive
                  ? Color.fromARGB(255, 255, 150, 140)
                  : null,
              fixedSize: Size(150, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: Text('119외'),
        ),
      ],
    );
  }
}
