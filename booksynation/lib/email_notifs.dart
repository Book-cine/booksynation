import 'dart:convert';
import 'package:http/http.dart' as http;

Future sendEmailNotifs({
  required String name,
  required String email,
  required String subject,
  required String message,
}) async {
  final serviceId = '';
  final templateId = '';
  final userId = '';

  final url = Uri.parse(); //insert resource url from emailjs insidoe here
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
        'user_subject': subject,
        'user_message': message,
      }
    }),
  );
}
