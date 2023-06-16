import 'package:yenibisim/model/model.dart';
import 'package:yenibisim/services/services.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';


final singleUserDataProvider = FutureProvider<UserModel?>((ref) async {
  final ApiService = ref.watch(userProvider);
  return ApiService.getUser();
});






