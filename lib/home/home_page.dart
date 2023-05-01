import 'package:yenibisim/data_provider/data_provider.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data_provider/data_provider.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: no_leading_underscores_for_local_identifiers
    final responseProvider = ref.watch(singleUserDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod'),
        ),
        body: Center(
          child: responseProvider.when(data: (data) {
            print(data.toString());
            return Text(
              data!.network!.company![0],
            );
          }, error: (((error, stackTrace) {
            return Text(
              error.toString(),
            );
          })), loading: () {
            return const CircularProgressIndicator();
          }),
        ));
  }
}
