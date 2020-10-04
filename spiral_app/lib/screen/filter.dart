import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';

class FilterPage extends StatelessWidget {
  static const Route = '/filter';
  @override
  Widget build(BuildContext context) {
    var result = Provider.of<Mobile>(context).filterListResult;
    var filters = Provider.of<Mobile>(context).filterList;
    List keys = filters.keys.toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          "Select Filter",
          style: bodyText(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < filters.length; i++)
              FilterWidget(
                result: result,
                title: keys[i],
                options: filters[keys[i]],
              ),
          ],
        ),
      ),
    );
  }
}

class FilterWidget extends StatefulWidget {
  const FilterWidget({
    @required this.result,
    @required this.options,
    @required this.title,
  });
  final String title;
  final List options;
  final Map<String, List> result;

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    List values = widget.result[widget.title];
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 10),
          LimitedBox(
            maxWidth: 200,
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (var i = 0; i < widget.options.length; i++)
                    Row(
                      children: [
                        FilterChip(
                          tooltip: widget.title,
                          backgroundColor: kAccentColor,
                          selectedColor: kPrimaryColor,
                          labelStyle: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(
                                  color: widget.result[widget.title]
                                          .contains(widget.options[i])
                                      ? Colors.white
                                      : Colors.black),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          selected: values.contains(widget.options[i]),
                          label: Text(widget.options[i]),
                          onSelected: (value) {
                            if (value && widget.options.isNotEmpty) {
                              setState(() {
                                values.clear();
                                values.add(widget.options[i]);
                              });
                            } else {
                              setState(() {
                                values.clear();
                              });
                            }
                          },
                        ),
                        SizedBox(width: 10)
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
