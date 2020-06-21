import 'package:flutter/material.dart';

class OfflineActivityItem extends StatelessWidget {
  final String bgImage;
  final String title;
  final String date;
  final String location;
  final bool isOutDate;
  final Function onTap;

  const OfflineActivityItem(
      {Key key,
      this.bgImage,
      this.title,
      this.date,
      this.location,
      this.isOutDate,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _button = Container(
      padding: EdgeInsets.symmetric(
          horizontal: 30, vertical: 6),
      decoration: BoxDecoration(
          color: !isOutDate ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        !isOutDate ? "报名参加" : "活动详情",
        style: TextStyle(color: Colors.white),
      ),
    );

    // TODO: implement build
    return Material(
      child: Ink(
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(bgImage), fit: BoxFit.cover)),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: Color(0xff777777),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          date,
                          style: TextStyle(color: Color(0xff777777)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.add_location,
                              color: Color(0xff777777),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              location,
                              style: TextStyle(color: Color(0xff777777)),
                            )
                          ],
                        ),
                        _button
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
