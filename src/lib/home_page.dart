import 'package:flutter/material.dart';
import 'package:habbit_trackere/date_widget.dart';
import 'package:habbit_trackere/node.dart';
import 'package:habbit_trackere/task_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  int focussed_node_index = DateTime.now().day - 1;

  final double container_width = 80;

  List<Node> list_nodes = <Node>[];

  @override
  initState() {
    super.initState();
    for (DateTime date = DateTime(DateTime.now().year, DateTime.now().month, 1);
        date.compareTo(
                DateTime(DateTime.now().year, DateTime.now().month + 1, 0)) <=
            0;
        date = date.add(Duration(days: 1))) {
      list_nodes.add(new Node(date, false));
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        container_width * (DateTime.now().day + 1),
        duration: Duration(seconds: 1),
        curve: Curves.easeInOutQuart,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        foregroundColor: Color(0xFFcccccc),
        title: Text(
          "Habit Tracker",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "SF Pro Rounded",
            fontWeight: FontWeight.w300,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DateWidget(
                scrollController: scrollController,
                list_nodes: list_nodes,
                focussed_node_index: focussed_node_index,
                container_width: container_width,
              ),
              SizedBox(height: 50),
              TaskWidget(
                list_nodes: list_nodes,
                focussed_node_index: focussed_node_index,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
