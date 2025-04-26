import 'package:call_api_flut/model/user_dob.dart';
import 'package:call_api_flut/model/user_location.dart';
import 'package:call_api_flut/model/user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location
  });

  factory User.fromMap(Map<String, dynamic> e){
    final name = UserName.fromMap(e['name']);
    final dob = UserDob.fromMap(e['dob']);
    final location = UserLocation.fromMap(e['location']);
    return User(
      gender: e['gender'],
      email: e['email'],
      phone: e['phone'],
      cell: e['cell'],
      nat: e['nat'],
      name: name,
      dob: dob,
      location: location,
    );
  }

  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
   }
}

