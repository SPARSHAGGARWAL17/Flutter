import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';

class SearchPage extends StatefulWidget {
  static const Route = '/search';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();
  String _compare = '';
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    var compare = Provider.of<Mobile>(context).compareList;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: kPrimaryColor,
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
        automaticallyImplyLeading: false,
        leading: Icon(Icons.search),
        title: TextField(
          onChanged: (val) {
            setState(() {
              _compare = val;
            });
          },
          controller: search,
          decoration: InputDecoration(
            labelText: 'Search',
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: mobiles.length + 1,
            itemBuilder: (context, int index) {
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Select Phone ${_selected <= 1 ? _selected + 1 : 2}',
                    style: bodyText(context),
                  ),
                );
              } else {
                if (mobiles[index - 1].name.toLowerCase().contains(_compare)) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        _selected++;
                        compare.add(mobiles[index - 1]);
                        print(compare.length);
                      });
                      if (_selected == 2) {
                        print('All done!');
                      }
                    },
                    title: Text(mobiles[index - 1].name,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  );
                } else {
                  return Container();
                }
              }
            }),
      ),
    );
  }
}
