import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenibisim/data_provider/data_provider.dart';
import 'package:yenibisim/product/constant/index.dart';
import 'package:yenibisim/widgets/details_appbar_widget.dart';

class BicycleListDetails extends ConsumerStatefulWidget {
  const BicycleListDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BicycleListDetailsState();
}

class _BicycleListDetailsState extends ConsumerState<BicycleListDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailsAppBar(detailsText: StringConstants.bicycleText),
      body: SizedBox(
        child: ref.watch(singleUserDataProvider).when(
          data: (data) {
            var dataList = data!.network!;
            return ListView.separated(
                itemBuilder: ((context, index) {
                  return SizedBox(
                    height: 50,
                    child: ListTile(
                      title: Text(dataList.stations![index].name!),
                      leading: Text(dataList.stations![index].extra!.uid!),
                      trailing: Text(dataList.stations![index].extra!.status!),
                    ),
                  );
                }),
                separatorBuilder: ((context, index) => Divider()),
                itemCount: data.network!.stations!.length);
          },
          error: (((error, stackTrace) {
            return Text(''.toString());
          })),
          loading: () {
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
