import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final List tabTitle = ["TG", "Zach"];
  late TabController controller;
  late String tabHandler;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    tabHandler = tabTitle[0];
    controller.addListener(changeTitle);
  }

  void changeTitle() {
    setState(() {
      tabHandler = tabTitle[controller.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tabHandler),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(20),
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          padding: const EdgeInsets.all(5),
          controller: controller,
          tabs: [
            Tab(
              text: tabTitle[0],
              icon: const Icon(Icons.face_outlined),
            ),
            Tab(
              text: tabTitle[1],
              icon: const Icon(Icons.ac_unit),
            ),
          ],
        ),
      ),
    );
  }
}
