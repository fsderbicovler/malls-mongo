class Malls {
  final String id;
  final String name;
  final String area;

  Malls._(this.id, this.name, this.area);

  factory Malls.fromJson(Map json) {
    final id = json['_id'];
    return Malls._(id, json['name'], json['area']);
  }
}
