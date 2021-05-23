import 'package:flutter/material.dart';
import 'package:plant_ui_522/imageClassify.dart';
import 'package:plant_ui_522/plantslist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.camera),
      backgroundColor: Colors.green[300],
      onPressed: (){
         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Classifier()),
            );

        },),

        body: ListView(
      children: <Widget>[
        SizedBox(height: 15.0),
        Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(right: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.grey.withOpacity(0.3),
                      mini: true,
                      elevation: 0.0,
                      child: Icon(Icons.shopping_cart,
                          color: Colors.black, size: 17.0))
                ])),
        Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text('Tropical plants',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 40.0,
                    fontWeight: FontWeight.w500))),
        Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                    child: Text(
                  'Plants',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ))
              ],
            )),
        Container(
          height: MediaQuery.of(context).size.height - 200.0,
          child: TabBarView(
              controller: tabController, children: <Widget>[PlantList()]),
        )
      ],
    ));
  }
}
