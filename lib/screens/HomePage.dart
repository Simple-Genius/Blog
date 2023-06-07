import 'package:blog_app/controllers/dataController.dart';
import 'package:blog_app/screens/DetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../components/NewsSouceButton.dart';
import '../constants.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    dataController.getData();
    // TODO: implement initState
    super.initState();
  }

  final dataController = Get.put(DataController());

  final _controller = ValueNotifier<bool>(false);

  List<String> newsSource = ['Comedy', 'Adventure', 'Cosmos', 'Sports', 'Entertainment'];

  String tappedButtonName = '';

  List<NewsSourceButton> buildButtons(){
    List<NewsSourceButton> buttons = [];
    for(int i = 0; i < newsSource.length; i++){
      buttons.add(
          NewsSourceButton(
            buttonColor: tappedButtonName == newsSource[i] ? darkBlue : Colors.white,
            newsSource: newsSource[i],
            onPressed: (){
              setState(() {
                tappedButtonName = newsSource[i];
              });
            },
            buttonTextColor: tappedButtonName == newsSource[i] ? Colors.white : darkBlue,)
      );
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.add),
          onPressed: (){},
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 0,
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Elusive.home, color: Colors.black,), label: ''),
            BottomNavigationBarItem(icon: Icon(Elusive.heart_circled,color: Colors.black), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.notifications,color: Colors.black), label: ''),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.sliders,color: Colors.black), label: ''),
          ],
        ),
        body: Container(
          color: const Color(0xFFFDFDFD),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    IconButton(icon: const Icon(Icons.subject), onPressed: (){},),
                    Row(
                      children: [
                        AdvancedSwitch(
                          width: 55,
                          height: 25,
                          controller: _controller,
                          activeColor: Colors.grey,
                          activeChild: const Icon(Icons.sunny, color: darkBlue,),
                          inactiveColor: const Color(0xFF08142e),
                          inactiveChild: const FaIcon(FontAwesomeIcons.moon, color: Colors.white,),
                        ),

                        IconButton(onPressed: (){}, icon: const Icon(Icons.search_outlined,color: darkBlue),),
                        const CircleAvatar()
                      ],
                    )
                  ],
                ),
              ),
              const Text(
                  'Discover',
                style: TextStyle(
                  color: darkBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'New articles',
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: buildButtons()
                  ),
                ),
              ),
             Expanded(
               child: GridView.count(
                   crossAxisCount: 2,
                 crossAxisSpacing: 10,
                 children: [
                   InkWell(
                     onTap: (){
                       Navigator.of(context).push(
                         MaterialPageRoute(builder: (context) => const DetailsPage())
                       );
                     },
                     child: Card(
                       child:Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           children: [
                             Image.asset('images/a.jpg'),
                              Padding(
                               padding: const EdgeInsets.all(5.0),
                               child: GetBuilder<DataController>(builder: (_){
                                 return Text(
                                   dataController.newsModel!.title,
                                   overflow: TextOverflow.ellipsis,
                                 );
                               },
                               )
                             ),
                             GetBuilder<DataController>(builder: (_){
                               return  Text(
                                 "${dataController?.newsModel!.time}",
                                 style: const TextStyle(
                                     fontSize: 12
                                 ),
                               );
                             },
                             )
                           ],
                         ),
                       ),
                     ),
                   ),
                   const NewsCard(),
                   const NewsCard(),
                   const NewsCard(),
                   const NewsCard(),
                   const NewsCard()
                 ],
               ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('images/c.jpg'),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('This is a man walking'),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '24 Jun, 2021',
                  style: TextStyle(
                      fontSize: 12
                  ),
                ),
                Text(' 12 minute read',style: TextStyle(
                    fontSize: 12
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}



