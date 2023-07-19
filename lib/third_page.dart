import 'package:coding_apple/auto_matching.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text('중증도 분류'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '          *추가 선택사항',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    '혈압',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Row(
                    children: [
                      SizedBox(
                          width: 85,
                          height: 40,
                          child: TextField(
                            onChanged: (value) {
                              context
                                  .read<GlobalData>()
                                  .updateString('최고', value);
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(), labelText: "최고"),
                          )),
                      Text(
                        ' / ',
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                          width: 85,
                          height: 40,
                          child: TextField(
                            onChanged: (value) {
                              context
                                  .read<GlobalData>()
                                  .updateString('최저', value);
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(), labelText: "최저"),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    '맥박',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                    width: 200,
                    height: 40,
                    child: TextField(
                      onChanged: (value) {
                        context.read<GlobalData>().updateString('맥박', value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    '호흡',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                    width: 200,
                    height: 40,
                    child: TextField(
                      onChanged: (value) {
                        context.read<GlobalData>().updateString('호흡', value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              // width: 407,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 100,
                      height: 40,
                      child: TextField(
                        onChanged: (value) {
                          context.read<GlobalData>().updateString('이름', value);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "이름"),
                      )),
                  Text(
                    ' / ',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                      width: 100,
                      height: 40,
                      child: TextField(
                        onChanged: (value) {
                          context.read<GlobalData>().updateString('나이', value);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "나이"),
                      )),
                  Text(
                    ' / ',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                      width: 100,
                      height: 40,
                      child: TextField(
                        onChanged: (value) {
                          context.read<GlobalData>().updateString('성별', value);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "성별"),
                      )),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text('    인적사항',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            TextFormField(
              onChanged: (value) {
                context.read<GlobalData>().updateString('인적사항', value);
              },
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                // hintText: '인적사항',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('    첨부파일',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.0)),
                  child: Icon(Icons.file_present),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.0)),
                  child: Icon(Icons.file_present),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AutoMatching()),
            );
          },
          child: Text('응급실 찾기'),
        ),
      ),
    );
  }
}
