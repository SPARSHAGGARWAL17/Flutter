import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';

class FilterPage extends StatelessWidget {
  static const Route = '/filter';
  @override
  Widget build(BuildContext context) {
    void dialogue(context) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: Text('Please Select All Options'),
            title: Text('Oops!'),
            backgroundColor: Colors.grey[800],
            actions: [
              FlatButton(
                  child: Text(
                    'OK',
                    style: TextStyle(color: kPrimaryColor, fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  })
            ],
          );
        },
      );
    }

    var result = Provider.of<Mobile>(context).filterListResult;
    var filters = Provider.of<Mobile>(context).filterList;
    List keys = filters.keys.toList();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
        backgroundColor: kPrimaryColor,
        title: Text(
          "Select Filter",
          style: bodyText(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < filters.length; i++)
                FilterWidget(
                  result: result,
                  title: keys[i],
                  options: filters[keys[i]],
                ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    bool empty = false;
                    for (var i = 0; i < result.length; i++) {
                      if (result[keys[i]].isEmpty) {
                        empty = true;
                        break;
                      }
                    }
                    if (!empty)
                      Navigator.of(context).pop(result);
                    else
                      dialogue(context);
                  },
                  child: Text(
                    'Find',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ],
          ),
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
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline5,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < widget.options.length; i++)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: FilterChip(
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
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
