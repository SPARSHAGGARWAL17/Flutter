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
  bool init = true;
  List<Mobile> _mobile;
  int _index = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('did change ');
    final Map args = ModalRoute.of(context).settings.arguments;
    if (init) {
      _mobile = [...args['mobiles']];
      _index = args['selected'];
      init = false;
    }
    _selected = _index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: kPrimaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
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
                    'Select ${_selected + 1 == 1 ? 'First' : 'Second'} Phone',
                    style: bodyText(context),
                  ),
                );
              } else {
                if (mobiles[index - 1].name.toLowerCase().contains(_compare)) {
                  return ListTile(
                    onTap: () {
                      _mobile.removeAt(_selected);
                      _mobile.insert(_selected, mobiles[index - 1]);
                      setState(() {
                        _index++;
                        if (_selected < 1) {
                          print('here');
                          _selected++;
                          print(_selected);
                        }
                        if (_index > 1) {
                          Navigator.of(context).pushReplacementNamed(
                              CompareScreen.Route,
                              arguments: {'mobiles': _mobile});
                        }
                      });
                    },
                    title: Text(
                      mobiles[index - 1].name,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
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
