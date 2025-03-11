import 'package:flutter/material.dart';
import 'package:habbit_trackere/node.dart';

class DateNodeWidget extends StatefulWidget {
  int index;
  int focussed_node_index;
  List<Node> list_nodes;
  final double container_width;

  DateNodeWidget({
    required this.index,
    required this.focussed_node_index,
    required this.list_nodes,
    required this.container_width,
  });

  @override
  State<DateNodeWidget> createState() => _DateNodeWidgetState();
}

class _DateNodeWidgetState extends State<DateNodeWidget> {
  String get_month(int mon_num) {
    if (mon_num == 1) return "January";
    if (mon_num == 2) return "February";
    if (mon_num == 3) return "March";
    if (mon_num == 4) return "April";
    if (mon_num == 5) return "May";
    if (mon_num == 6) return "June";
    if (mon_num == 7) return "July";
    if (mon_num == 8) return "August";
    if (mon_num == 9) return "September";
    if (mon_num == 10) return "October";
    if (mon_num == 11) return "November";
    if (mon_num == 12)
      return "December";
    else
      return "NULL";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.focussed_node_index =
              widget.list_nodes.elementAt(widget.index).date.day - 1;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: DateTime(
                    widget.list_nodes.elementAt(widget.index).date.year,
                    widget.list_nodes.elementAt(widget.index).date.month,
                    widget.list_nodes.elementAt(widget.index).date.day) ==
                DateTime(
                    widget.list_nodes
                        .elementAt(widget.focussed_node_index)
                        .date
                        .year,
                    widget.list_nodes
                        .elementAt(widget.focussed_node_index)
                        .date
                        .month,
                    widget.list_nodes
                        .elementAt(widget.focussed_node_index)
                        .date
                        .day)
            ? BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Color(0xFFcd0245),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF000000),
                    offset: Offset(4, 4),
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: Color(0xFF232323),
                    offset: Offset(-4, -4),
                    blurRadius: 4,
                  ),
                ],
                color: Color(0xFF121212),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
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
        width: widget.container_width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${widget.list_nodes.elementAt(widget.index).date.day.toString()}",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "SF Pro Rounded",
                color: Color(0xFF999999),
              ),
            ),
            Text(
              "${get_month(widget.list_nodes.elementAt(widget.index).date.month)}",
              style: TextStyle(
                fontSize: 12,
                fontFamily: "SF Pro Rounded",
                color: Color(0xFF666666),
              ),
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
