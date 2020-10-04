import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';

class BannerList extends StatefulWidget {
  @override
  _BannerListState createState() => _BannerListState();
}

class _BannerListState extends State<BannerList> {
  List<Mobile> mobileBanner = mobiles.sublist(3, 7);
  bool init = true;

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    PageController _page = PageController();
    return Container(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Buy The Best',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 20, fontFamily: 'Segoe UI'),
          ),
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              controller: _page,
              children: List.generate(
                mobileBanner.length,
                (index) => InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Image.asset(mobileBanner[index].imageUrl)),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.white),
                              children: [
                                TextSpan(text: 'Buy The Latest\n'),
                                TextSpan(
                                  text: mobileBanner[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: mobileBanner[index].color,
                    ),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < mobileBanner.length; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: currentPage == i
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).accentColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
