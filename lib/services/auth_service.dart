// auth_service.dart
import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio();

  // URL de l'API Strapi
  final String apiUrl = "https://your-api-url.com/auth"; // Modifiez avec votre URL

  Future<void> signIn(String username, String password) async {
    try {
      final response = await _dio.post('$apiUrl/local', data: {
        'identifier': username,
        'password': password,
      });
      // Gérer le stockage du token ou d'autres informations de l'utilisateur ici
    } catch (e) {
      // Gérer les erreurs ici
      throw Exception("Erreur de connexion : $e");
    }
  }

  Future<void> createAccount(String username, String email, String password) async {
    try {
      final response = await _dio.post('$apiUrl/register', data: {
        'username': username,
        'email': email,
        'password': password,
      });
      // Vous pouvez également gérer la connexion automatique ici
    } catch (e) {
      // Gérer les erreurs ici
      throw Exception("Erreur lors de la création du compte : $e");
    }
  }

  // Autres méthodes comme déconnexion, récupération de mot de passe, etc.
}
