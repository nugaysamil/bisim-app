import 'package:yenibisim/model/model.dart';
import 'package:yenibisim/services/services.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';


final singleUserDataProvider = FutureProvider<UserModel?>((ref) async {
  // ignore: non_constant_identifier_names
  final ApiService = ref.watch(userProvider);
  return ApiService.getUser();
});








/* final userDataProvider = FutureProvider<List<UserModel>?>((ref) async {
  // ignore: non_constant_identifier_names
  final ApiService = ref.watch(userProvider);
  return ApiService.getUsers();
}); */