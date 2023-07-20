import 'package:ercall/main.dart';
import 'package:flutter/material.dart';
import 'auto_matching.dart';

class MatchingComplete extends StatelessWidget {
  const MatchingComplete({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('매칭 완료'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ManualBox(
                hospitalName: '서울특별시보라매병원응급의료센터',
                workingHours: '24시간 진료 | 연중무휴',
                distance: '1.5km | 서울 동작구 신대방동',
              ),
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.check_circle_outline,
                size: 100,
                color: Colors.green,
              ),
              SizedBox(height: 20),
              Text(
                '수고하셨습니다!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Text('초기 화면으로 돌아가기')),
          ),
        ));
  }
}
