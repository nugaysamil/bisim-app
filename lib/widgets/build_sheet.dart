import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yenibisim/home/google_maps.dart';

class BuildSheet extends ConsumerStatefulWidget {
  const BuildSheet({super.key, required this.station});
  final Stations station;
  @override
  ConsumerState createState() => BuildSheetState();
}

class BuildSheetState extends ConsumerState<BuildSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.near_me_outlined),
              SizedBox(
                width: 25,
              ),
              Text(
                "Id: ",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Text(
                  widget.station.extra!.uid.toString(),
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.black, fontSize: 20)),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.abc_sharp),
              SizedBox(
                width: 20,
              ),
              Text("Name: ",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold))),
              Expanded(
                child: Text(
                  widget.station.name!,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.hourglass_empty_sharp,
              ),
              SizedBox(
                width: 20,
              ),
              Text("Empty Slots : ",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold))),
              Expanded(
                child: Text(
                  widget.station.emptySlots!.toString(),
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.black, fontSize: 20)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.pedal_bike),
              SizedBox(
                width: 20,
              ),
              Text(
                "Free Bikes : ",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  widget.station.freeBikes!.toString(),
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.black, fontSize: 20)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
