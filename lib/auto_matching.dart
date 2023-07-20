import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'matching_complete.dart';

class AutoMatching extends StatefulWidget {
  const AutoMatching({super.key});

  @override
  State<AutoMatching> createState() => _AutoMatchingState();
}

class _AutoMatchingState extends State<AutoMatching> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(37.541, 126.986);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  var switchValue = true;
  @override
  Widget build(BuildContext context) {
    var googleMap = GoogleMap(
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    );
    var column = Column(
      children: [
        ManualBox(
          hospitalName: '서울특별시보라매병원응급의료센터',
          workingHours: '24시간 진료 | 연중무휴',
          distance: '1.5km | 서울 동작구 신대방동',
        ),
        ManualBox(
          hospitalName: '중앙대학교병원 응급의료센터',
          workingHours: '24시간 진료 | 연중무휴',
          distance: '1.9km | 서울 동작구 흑석동',
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              }),
        ],
        toolbarHeight: 100,
        title: Text(
          switchValue ? '자동 매칭 중' : '수동 매칭 중',
        ),
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
      body: switchValue ? googleMap : column,
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Align(
            alignment: Alignment.center,
            child: switchValue
                ? Text('최대 10분 거리 내 병원으로 매칭 중입니다.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))
                : ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MatchingComplete()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text('초기 화면으로 돌아가기'))),
      ),
    );
  }
}

class ManualBox extends StatelessWidget {
  final String hospitalName;
  final String workingHours;
  final String distance;

  const ManualBox({
    required this.hospitalName,
    required this.workingHours,
    required this.distance,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hospitalName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              workingHours,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 5),
            Text(
              distance,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.call),
                  label: Text('전화'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.directions),
                  label: Text('길찾기'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
