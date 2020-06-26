class Area {
  int id;
  String aName;

  Area({this.id, this.aName});

  Area.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.aName = map['Aname'];
  }
}

class Sub {
  int id;
  String sName;
  String aName;

  Sub({this.id, this.sName, this.aName});

  Sub.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.sName = map['Sname'];
    this.aName = map['aname'];
  }
}

class Doctor {
  int id;
  String name;
  String sub;
  String area;

  Doctor({this.id, this.name, this.area, this.sub});

  Doctor.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.sub = map['suburb'];
    this.area = map['area'];
  }
}
