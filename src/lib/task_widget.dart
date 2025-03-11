import 'package:flutter/material.dart';
import 'package:habbit_trackere/home_page.dart';
import 'package:habbit_trackere/node.dart';

class TaskWidget extends StatefulWidget {
  List<Node> list_nodes;
  int focussed_node_index;

  TaskWidget({
    required this.list_nodes,
    required this.focussed_node_index,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.list_nodes.elementAt(widget.focussed_node_index).gym =
              !widget.list_nodes.elementAt(widget.focussed_node_index).gym;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: widget.list_nodes.elementAt(widget.focussed_node_index).gym
              ? Border.all(
                  color: Color(0xFFcd0245),
                  width: 2,
                )
              : Border.all(
                  color: Color(0x00cd0245),
                ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2),
              blurRadius: 4,
            ),
            BoxShadow(
              color: Color(0xFF232323),
              offset: Offset(-2, -2),
              blurRadius: 4,
            ),
          ],
          color: Color(0xFF121212),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.fitness_center,
                  color: Color(0xFF999999),
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                SizedBox(width: 15),
                Text(
                  "Gym".toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF999999),
                  ),
                ),
              ],
            ),
            Icon(
              widget.list_nodes.elementAt(widget.focussed_node_index).gym
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank_outlined,
              color: Color(0xFF999999),
            ),
          ],
        ),
      ),
    );
  }
}
