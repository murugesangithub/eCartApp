import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdCarousel extends StatefulWidget {
  final List<String> imageUrls;
  AdCarousel({this.imageUrls});
  @override
  _AdCarouselState createState() => _AdCarouselState();
}

class _AdCarouselState extends State<AdCarousel> {
  var pageIndex = 0;
  String reason = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          CarouselSlider(
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 2.0,
                autoPlay: true,
                //autoPlayInterval: 2.0,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    pageIndex = index;
                  });
                },
              ),
              items: widget.imageUrls.map((i) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                      child: FadeInImage(
                    image: NetworkImage(i),
                    fit: BoxFit.cover,
                    placeholder: AssetImage('lib/assets/loading.gif'),
                  ));
                });
              }).toList()),
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              height: 12,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.imageUrls.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: 5,
                            width: index == pageIndex ? 15 : 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.blue,
                            )));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
