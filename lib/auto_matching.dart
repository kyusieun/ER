import 'package:flutter/material.dart';

class AutoMatching extends StatefulWidget {
  const AutoMatching({super.key});

  @override
  State<AutoMatching> createState() => _AutoMatchingState();
}

class _AutoMatchingState extends State<AutoMatching> {
  var switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Switch(
                value: switchValue,
                onChanged: (value) {
                  setState(() {
                    print(value);
                    switchValue = value;
                  });
                }),
          ],
          toolbarHeight: 100,
          title: Text('자동 매칭 중',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(4.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Container(
                color: Colors.red,
                height: 2.0,
              ),
            ),
          ),
        ),
        body: Placeholder(),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '최대 10분 거리 내 병원으로 매칭 중입니다.',
            ),
          ),
        ));
  }
}
