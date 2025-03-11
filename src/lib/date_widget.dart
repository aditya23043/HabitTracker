import 'package:flutter/material.dart';
import 'package:habbit_trackere/home_page.dart';
import 'package:habbit_trackere/node.dart';

class DateWidget extends StatefulWidget {
  final ScrollController scrollController;
  final List<Node> list_nodes;
  final double container_width;
  int focussed_node_index;
  Function(int) change_date;

  DateWidget({
    required this.scrollController,
    required this.list_nodes,
    required this.container_width,
    required this.focussed_node_index,
    required this.change_date,
  });

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
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
    return SizedBox(
      height: 100,
      child: ListView.builder(
        controller: widget.scrollController,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.list_nodes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.change_date(index);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: DateTime(
                          widget.list_nodes.elementAt(index).date.year,
                          widget.list_nodes.elementAt(index).date.month,
                          widget.list_nodes.elementAt(index).date.day) ==
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
                    "${widget.list_nodes.elementAt(index).date.day.toString()}",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "SF Pro Rounded",
                      color: Color(0xFF999999),
                    ),
                  ),
                  Text(
                    "${get_month(widget.list_nodes.elementAt(index).date.month)}",
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
        },
      ),
    );
  }
}
