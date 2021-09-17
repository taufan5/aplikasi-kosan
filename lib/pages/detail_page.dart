import 'package:cozy/Wighet/facilities_item.dart';
import 'package:cozy/Wighet/rating_item.dart';
import 'package:cozy/models/space.dart';
import 'package:cozy/pages/error_page.dart';
import 'package:cozy/thema.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Space space;
  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        //throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: whiteC,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(
                space.imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
              ListView(
                children: [
                  SizedBox(
                    height: 328,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: whiteC,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        // NOTE: TITLE
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: edge,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    space.name,
                                    style: blackTextStyle.copyWith(
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: '\$${space.price}',
                                      style: purpleTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '/ month',
                                          style: greyTextStyle.copyWith(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [1, 2, 3, 4, 5].map((index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                      left: 2,
                                    ),
                                    child: RatingItem(
                                        index: index, rating: space.rating),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // NOTE: MAIN FACILITIES
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Main Facilities',
                            style: regulerTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: edge,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacelityItem(
                                name: 'kitchen',
                                imageUrl: 'assets/images/bar1.png',
                                total: space.numberOfKitchens,
                              ),
                              FacelityItem(
                                name: 'bedroom',
                                imageUrl: 'assets/images/bed.png',
                                total: space.numberOfBedrooms,
                              ),
                              FacelityItem(
                                name: 'big lemari',
                                imageUrl: 'assets/images/cupboard1.png',
                                total: space.numberOfCupboards,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // NOTE: PHOTO
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Photos',
                            style: regulerTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 88,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: space.photos.map((item) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: 24,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      item,
                                      width: 110,
                                      height: 88,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList()
                              // [
                              //   SizedBox(
                              //     width: edge,
                              //   ),
                              //   Image.asset(
                              //     'assets/images/cth1.jpg',
                              //     width: 110,
                              //     height: 88,
                              //     fit: BoxFit.cover,
                              //   ),
                              //   SizedBox(
                              //     width: 18,
                              //   ),
                              //   Image.asset(
                              //     'assets/images/cth2.jpg',
                              //     width: 110,
                              //     height: 88,
                              //     fit: BoxFit.cover,
                              //   ),
                              //   SizedBox(
                              //     width: 18,
                              //   ),
                              //   Image.asset(
                              //     'assets/images/cth3.jpg',
                              //     width: 110,
                              //     height: 88,
                              //     fit: BoxFit.cover,
                              //   ),
                              //   SizedBox(
                              //     width: edge,
                              //   ),
                              // ],
                              ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // NOTE: LOCATION
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Location',
                            style: regulerTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${space.address} \n ${space.city}',
                                style: greyTextStyle.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  /*launchUrl(
                                    'https://www.google.com/maps/place/Jl.+Cempaka+III,+RT.12%2FRW.12,+Cengkareng+Tim.,+Kecamatan+Cengkareng,+Kota+Jakarta+Barat,+Daerah+Khusus+Ibukota+Jakarta/@-6.1480575,106.7352526,16z/data=!4m2!3m1!1s0x2e69f7fab72d1507:0x2e2405a8ab329d09',
                                  );*/
                                  launchUrl(space.mapUrl);
                                },
                                child: Image.asset(
                                  'assets/images/btn_wishlist2.png',
                                  width: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: edge,
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width - (2 * edge),
                          child: ElevatedButton(
                            onPressed: () {
                              launchUrl('tel:${space.phone}');
                            },
                            child: Text(
                              'Book Now',
                              style: whiteTextStyle.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: purpleC,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                  vertical: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/images/btn_back1.png',
                        width: 40,
                      ),
                    ),
                    Image.asset(
                      'assets/images/btn_wishlist1.png',
                      width: 40,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
