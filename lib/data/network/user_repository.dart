import 'package:default_project/data/network/api_provider.dart';
import 'package:default_project/status/universal_data.dart';

class UserRepository {
  final ApiProvider apiProvider;

  UserRepository({required this.apiProvider});

  Future<UniversalData> getAllUsers() => apiProvider.getAllUsers();
}
