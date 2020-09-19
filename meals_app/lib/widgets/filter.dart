import 'package:flutter/material.dart';
import 'package:meals_app/export.dart';

class FilterPage extends StatefulWidget {
  final Map<String, bool> filters;
  FilterPage({this.filters});
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  Map<String, bool> newFilters;
  @override
  void didChangeDependencies() {
    newFilters = widget.filters;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List keys = newFilters.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Page"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            Navigator.of(context).pop(newFilters);
          },
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(20),
          itemBuilder: (context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select for food if it is ${keys[index]}",
                    style: Theme.of(context).textTheme.headline5),
                SizedBox(height: 20),
                FilterChip(
                  backgroundColor: kAccentColor,
                  selectedColor:
                      newFilters[keys[index]] ? kTextColor : kAccentColor,
                  checkmarkColor:
                      newFilters[keys[index]] ? kAccentColor : kPrimaryColor,
                  label: Text(
                    keys[index],
                    style: TextStyle(
                      color: newFilters[keys[index]]
                          ? kAccentColor
                          : kPrimaryColor,
                    ),
                  ),
                  selected: newFilters[keys[index]],
                  onSelected: (value) {
                    setState(() {
                      newFilters[keys[index]] = !newFilters[keys[index]];
                    });
                  },
                ),
                SizedBox(height: 20),
              ],
            );
          },
          itemCount: newFilters.length,
        ),
      ),
    );
  }
}
