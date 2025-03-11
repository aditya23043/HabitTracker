import 'package:flutter/material.dart';
import 'package:habbit_trackere/date_node.dart';
import 'package:habbit_trackere/node.dart';

class DateWidget extends StatefulWidget {
  final ScrollController scrollController;
  final List<Node> list_nodes;
  final int focussed_node_index;
  final double container_width;

  DateWidget({
    required this.scrollController,
    required this.list_nodes,
    required this.focussed_node_index,
    required this.container_width,
  });

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
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
          return DateNodeWidget(
              index: index,
              focussed_node_index: widget.focussed_node_index,
              list_nodes: widget.list_nodes,
              container_width: widget.container_width);
        },
      ),
    );
  }
}
