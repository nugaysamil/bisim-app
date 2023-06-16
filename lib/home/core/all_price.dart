import 'package:flutter/material.dart';
import 'package:yenibisim/product/constant/string_constant.dart';
import 'package:yenibisim/widgets/details_appbar_widget.dart';

import '../../model/all_list.dart';

class AllPrice extends StatefulWidget {
  const AllPrice({super.key});

  @override
  State<AllPrice> createState() => _AllPriceState();
}

class _AllPriceState extends State<AllPrice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: DetailsAppBar(
        detailsText: StringConstants.priceText,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue.shade900,
            width: 500,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Standart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  Text(
                    '₺ 0.01',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: listAll.itemList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  Container(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    child: ListTile(
                      title: Text(
                        'Standart',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      leading: Text(
                        listAll.itemPrice[index],
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: Text(
                        listAll.itemPrice[index],
                        style: TextStyle(fontSize: 14),
                      ),
                      onTap: () {},
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

  

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
    );
  }
}
