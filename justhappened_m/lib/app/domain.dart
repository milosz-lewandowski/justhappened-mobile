

class Patient{
  final int id;
  final String name;
  final Therapist therapist;

  Patient({this.id, this.name, this.therapist});

  factory Patient.fromJson(Map<String, dynamic> json){
    return Patient(
    id: json['id'],
    name: json['name'],
    therapist: json['therapist']
    );
  }
}

class Therapist{
  final int id;
  final List<Patient> patients;
  final String name;
  final String specialization;

  Therapist({this.id, this.patients, this.name, this.specialization});

  factory Therapist.fromJson(Map<String, dynamic> json){
    return Therapist(
        id: json['id'],
        patients: json['patients'],
        name: json['name'],
        specialization: json['specialization']
    );
  }
}