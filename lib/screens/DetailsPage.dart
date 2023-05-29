import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:blog_app/models/DetailsModel.dart';

import '../controllers/detailsController.dart';


class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  final _controller = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      child: Container(
          color: const Color(0xffD6D4D5),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:10.0, left: 10.0, right: 10.0, bottom: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset('images/g.jpeg'),
                      ),
                    ),
                    Positioned(
                      right: 30,
                      height: 50,
                      bottom: -3,
                      child: Row(
                        children: [
                          FloatingActionButton.small(
                            elevation: 2.0,
                            backgroundColor: Colors.white,
                            onPressed: () {  },
                            child: const Icon(Elusive.share, color: Colors.grey,),
                          ),
                          FloatingActionButton.small(
                            elevation: 2.0,
                            backgroundColor: Colors.white,
                            onPressed: () {  },
                            child: const Icon(MfgLabs.heart, color: Colors.red,),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 55 ,
                      left: 15,
                      child: SizedBox(
                        width: screenWidth * 0.93,
                        child: const Text(
                          'This is a person holding a bulb indefinitely  ',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                          overflow: TextOverflow.clip,
                          softWrap:true,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.arrow_back, color: Colors.white,)
                          ),
                          AdvancedSwitch(
                            width: 55,
                            height: 25,
                            controller: _controller,
                            activeColor: Colors.grey,
                            activeChild: const Icon(Icons.sunny, color: Colors.white,),
                            inactiveColor: const Color(0xFF08142e),
                            inactiveChild: const FaIcon(FontAwesomeIcons.moon, color: Colors.white,),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                GetX<DetailsController>(init: DetailsController(),
                builder: (_){
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RichText(
                      text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: text.toString()[0][0],
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 50,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.black
                                )
                            ),
                            TextSpan(
                                text: text.substring(1),
                                style: GoogleFonts.playfairDisplay(
                                    color: Colors.black,
                                    fontSize: 15
                                )
                            )
                          ]
                      ),
                    ),
                  );
                },)
              ],
            ),
          ),
      ),
    );
  }
}

