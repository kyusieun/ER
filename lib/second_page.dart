import 'package:ercall/location_select.dart';
import 'package:flutter/material.dart';
import 'third_page.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('중증도 분류'),
      ),
      body: SecondBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdPage()),
            );
          },
          child: Text('다음 페이지'),
        ),
      ),
    );
  }
}

class SecondBody extends StatelessWidget {
  const SecondBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '          *필수 선택사항',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  '보행 여부',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  // textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                  width: 190,
                  child: YesOrNoCheck(
                    text1: '가능',
                    text2: '불가능',
                    kind: '보행 여부',
                  )),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  '호흡',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  // textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                  width: 190,
                  child: YesOrNoCheck(
                    text1: '정상',
                    text2: '비정상',
                    kind: '호흡',
                  )),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  '맥박',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  // textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                  width: 190,
                  child: YesOrNoCheck(
                    text1: '정상',
                    text2: '비정상',
                    kind: '맥박',
                  )),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 30),
              SizedBox(
                width: 90,
                child: Text(
                  '의식',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  // textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                  width: 250,
                  child: FourCheck(
                    text1: "A",
                    text2: 'V',
                    text3: 'P',
                    text4: 'U',
                    kind: '의식',
                  ))
            ],
          ),
          SizedBox(height: 10),
          Triage(),
          SizedBox(height: 40),
          Row(
            children: [
              Text(
                '       발견 장소  ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocationSelect()),
                    );
                  },
                  icon: Icon(Icons.gps_fixed)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Image.asset(
            'assets/주요손상명.png',
            width: 400,
            height: 170,
            fit: BoxFit.contain,
          )),
        ],
      ),
    );
  }
}

class Triage extends StatefulWidget {
  const Triage({super.key});

  @override
  State<Triage> createState() => _TriageState();
}

class _TriageState extends State<Triage> {
  bool? _checkbox1 = false;
  bool? _checkbox2 = false;
  bool? _checkbox3 = false;
  bool? _checkbox4 = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 90,
          height: 40,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.topRight,
                  child: Text('O',
                      style: TextStyle(color: Colors.white, fontSize: 30))),
              Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                value: _checkbox1,
                onChanged: (bool? value) {
                  setState(() {
                    _checkbox1 = value;
                    _checkbox2 = false;
                    _checkbox3 = false;
                    _checkbox4 = false;
                  });
                  context.read<GlobalData>().updateInt('응급도', 1);
                },
              ),
            ],
          ),
        ),
        Container(
          width: 90,
          height: 40,
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.topRight,
                  child: Text('I',
                      style: TextStyle(color: Colors.white, fontSize: 30))),
              Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                value: _checkbox2,
                onChanged: (bool? value) {
                  setState(() {
                    _checkbox1 = false;
                    _checkbox2 = value;
                    _checkbox3 = false;
                    _checkbox4 = false;
                  });
                  context.read<GlobalData>().updateInt('응급도', 2);
                },
              ),
            ],
          ),
        ),
        Container(
          width: 90,
          height: 40,
          color: Colors.yellow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.topRight,
                  child: Text('II',
                      style: TextStyle(color: Colors.black, fontSize: 30))),
              Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                value: _checkbox3,
                onChanged: (bool? value) {
                  setState(() {
                    _checkbox1 = false;
                    _checkbox2 = false;
                    _checkbox3 = value;
                    _checkbox4 = false;
                  });
                  context.read<GlobalData>().updateInt('응급도', 3);
                },
              ),
            ],
          ),
        ),
        Container(
          width: 90,
          height: 40,
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.topRight,
                  child: Text('III',
                      style: TextStyle(color: Colors.black, fontSize: 30))),
              Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                value: _checkbox4,
                onChanged: (bool? value) {
                  setState(() {
                    _checkbox1 = false;
                    _checkbox2 = false;
                    _checkbox3 = false;
                    _checkbox4 = value;
                  });
                  context.read<GlobalData>().updateInt('응급도', 4);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class YesOrNoCheck extends StatefulWidget {
  final String text1;
  final String text2;
  final String kind;

  const YesOrNoCheck(
      {Key? key, required this.text1, required this.text2, required this.kind})
      : super(key: key);

  @override
  State<YesOrNoCheck> createState() => _YesOrNoCheckState();
}

class _YesOrNoCheckState extends State<YesOrNoCheck> {
  bool? _checkbox1 = false;
  bool? _checkbox2 = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.text1,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Checkbox(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          value: _checkbox1,
          onChanged: (bool? value) {
            setState(() {
              _checkbox1 = value;
              _checkbox2 = false;
            });
            context.read<GlobalData>().updateBoolean(widget.kind, true);
          },
        ),
        Text(widget.text2,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        Checkbox(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          value: _checkbox2,
          onChanged: (bool? value) {
            setState(() {
              _checkbox2 = value;
              _checkbox1 = false;
            });
            context.read<GlobalData>().updateBoolean(widget.kind, false);
          },
        ),
      ],
    );
  }
}

class FourCheck extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String kind;

  const FourCheck({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.kind,
  }) : super(key: key);

  @override
  State<FourCheck> createState() => _FourCheckState();
}

class _FourCheckState extends State<FourCheck> {
  bool? _checkbox1 = false;
  bool? _checkbox2 = false;
  bool? _checkbox3 = false;
  bool? _checkbox4 = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.text1,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        Checkbox(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          value: _checkbox1,
          onChanged: (bool? value) {
            setState(() {
              _checkbox1 = value;
              _checkbox2 = false;
              _checkbox3 = false;
              _checkbox4 = false;
            });
            context.read<GlobalData>().updateInt(widget.kind, 1);
          },
        ),
        Text(widget.text2,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        Checkbox(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          value: _checkbox2,
          onChanged: (bool? value) {
            setState(() {
              _checkbox1 = false;
              _checkbox2 = value;
              _checkbox3 = false;
              _checkbox4 = false;
            });
            context.read<GlobalData>().updateInt(widget.kind, 2);
          },
        ),
        Text(widget.text3,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        Checkbox(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          value: _checkbox3,
          onChanged: (bool? value) {
            setState(() {
              _checkbox1 = false;
              _checkbox2 = false;
              _checkbox3 = value;
              _checkbox4 = false;
            });
            context.read<GlobalData>().updateInt(widget.kind, 3);
          },
        ),
        Text(widget.text4,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        Checkbox(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          value: _checkbox4,
          onChanged: (bool? value) {
            setState(() {
              _checkbox1 = false;
              _checkbox2 = false;
              _checkbox3 = false;
              _checkbox4 = value;
            });
            context.read<GlobalData>().updateInt(widget.kind, 4);
          },
        ),
      ],
    );
  }
}
