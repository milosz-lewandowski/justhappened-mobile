//funkcje do pobierania

import 'package:justhappened_m/app/domain.dart';
import 'package:justhappened_m/utils/api.dart';

Future<List<Therapist>> fetchTherapist() async {
  Map<String, dynamic> json = await fetchFromApi("therapists");
  return List<Therapist>.from(
      json["therapists"].map((entryJson) => Therapist.fromJson(entryJson)));
}