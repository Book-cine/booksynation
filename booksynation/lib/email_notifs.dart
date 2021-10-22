import 'dart:convert';
import 'package:http/http.dart' as http;

Future sendEmailNotifs({
  required String name,
  required String email,
  required String vaccine,
  required String dosage,
  required String schedule,
}) async {
  final serviceId = 'service_uudw07o';
  final templateId = 'template_zryeo5q';
  final userId = 'user_tTVTjivQHURFBCECQLga4';

  final url = Uri.parse(
      'https://api.emailjs.com/api/v1.0/email/send'); //insert resource url from emailjs insidoe here
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'user_name': name,
        'user_email': email,
        'user_vaccine': vaccine,
        'user_dosage': dosage,
        'user_schedule': schedule,
      }
    }),
  );
}
