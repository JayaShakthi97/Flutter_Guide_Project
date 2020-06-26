import 'package:flutter/material.dart';
import 'package:flutter_guide_project/_api/api.dart';
import 'package:flutter_guide_project/_models/Area.dart';

class SelectPage extends StatefulWidget {
  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  Future<Map<String, dynamic>> data;
  List<Area> areas = [];
  List<Sub> allSuburbs = [];
  List<Sub> suburbs = [];
  List<Doctor> allDoctors = [];
  List<Doctor> doctors = [];
  Area _selectedArea;
  Sub _selectedSub;
  Doctor _selectedDoc;
  String _areaDisabledText = 'Select District first';
  String _doctorDisabledText = 'Select Area first';

  void _getData() async {
    try {
      data = API.getSelectionDataDumy();
    } catch (e) {
      print(e);
    }
  }

  _onAreaSelected(Area area) {
    setState(() {
      _selectedArea = area;
      _selectedSub = null;
      _selectedDoc = null;
      suburbs =
          allSuburbs.where((i) => i.aName == _selectedArea.aName).toList();
      if (suburbs.isEmpty) _areaDisabledText = 'No Areas Available';
      _doctorDisabledText = 'Select Area first';
      doctors.clear();
    });
  }

  _onSelectSub(Sub sub) {
    setState(() {
      _selectedSub = sub;
      _selectedDoc = null;
      doctors = allDoctors.where((i) => i.sub == _selectedSub.sName).toList();
      if (doctors.isEmpty) _doctorDisabledText = 'No Doctors Available';
    });
  }

  _onSelectDoc(Doctor doctor) {
    setState(() {
      _selectedDoc = doctor;
    });
  }

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selection Page')),
      body: Container(
        child: FutureBuilder<Map<String, dynamic>>(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                this.areas = snapshot.data['areas'];
                this.allSuburbs = snapshot.data['suburbs'];
                this.allDoctors = snapshot.data['doctors'];
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text('District: '),
                          SizedBox(width: 25),
                          DropdownButton<Area>(
                            hint: Text('Select District'),
                            disabledHint: Text('No Districts Available'),
                            value: _selectedArea,
                            items: areas
                                .map((e) => DropdownMenuItem<Area>(
                                    value: e,
                                    child: Text(e.aName.toUpperCase())))
                                .toList(),
                            onChanged: _onAreaSelected,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text('Area: '),
                          SizedBox(width: 25),
                          DropdownButton<Sub>(
                            hint: Text('Select Area'),
                            disabledHint: Text(_areaDisabledText),
                            value: _selectedSub,
                            items: suburbs
                                .map((e) => DropdownMenuItem<Sub>(
                                    value: e,
                                    child: Text(e.sName.toUpperCase())))
                                .toList(),
                            onChanged: _onSelectSub,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text('Doctor: '),
                          SizedBox(width: 25),
                          DropdownButton<Doctor>(
                            hint: Text('Select Doctor'),
                            disabledHint: Text(_doctorDisabledText),
                            value: _selectedDoc,
                            items: doctors
                                .map((e) => DropdownMenuItem<Doctor>(
                                    value: e,
                                    child: Text(e.name.toUpperCase())))
                                .toList(),
                            onChanged: _onSelectDoc,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
