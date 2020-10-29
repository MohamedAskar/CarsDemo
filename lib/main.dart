import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: Locale('ar', 'EG'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple[900],
      ),
      title: 'Cars Demo',
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> brands = [
    'assets/audi.png',
    'assets/bmw.png',
    'assets/toyota.png',
    'assets/nissan.png',
    'assets/chevrolet.png',
    'assets/volkswagen.png'
  ];
  final List<String> carType = ['Wagon', 'SUV', 'Sedan', 'Hatchback'];
  final List<String> carTypeImages = [
    'assets/car.png',
    'assets/car.png',
    'assets/car.png',
    'assets/car.png'
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF4852C1),
          iconSize: 40,
          currentIndex: 0,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: GoogleFonts.almarai(
              fontWeight: FontWeight.w600, color: Colors.white),
          unselectedLabelStyle: GoogleFonts.almarai(
              fontWeight: FontWeight.w400, color: Colors.white),
          items: [
            BottomNavigationBarItem(
              label: 'الوكالات',
              icon: Icon(
                Icons.car_rental,
              ),
            ),
            BottomNavigationBarItem(
              label: 'الخدمات',
              icon: Icon(
                Icons.car_repair,
              ),
            ),
            BottomNavigationBarItem(
              label: 'التثمين',
              icon: Icon(
                Icons.attach_money,
              ),
            ),
            BottomNavigationBarItem(
              label: 'التأمين',
              icon: Icon(
                Icons.card_giftcard,
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset('assets/car_wallpaper.jpg'),
                Positioned(
                  top: 50,
                  right: 20,
                  child: Icon(
                    Icons.notes,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: Badge(
                    position: BadgePosition.topStart(top: -10),
                    badgeContent: Text(
                      '12',
                      style: GoogleFonts.almarai(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            CustomListView(
              images: carTypeImages,
              text: carType,
              headline: 'تصفح حسب نوع السيارة',
              height: 65,
              imageWidth: 110,
            ),
            SizedBox(height: 10),
            CustomListView(
              images: brands,
              headline: 'تصفح حسب الماركة',
              height: 90,
              text: [],
              imageWidth: 80,
            ),
            SizedBox(height: 10),
            AnotherCustomGridView(
              headline: 'جديد الوكالات',
            ),
            SizedBox(height: 10),
            AnotherCustomGridView(headline: 'فيديو'),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class AnotherCustomGridView extends StatelessWidget {
  const AnotherCustomGridView({
    Key key,
    @required this.headline,
  }) : super(key: key);

  final String headline;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                headline,
                style: GoogleFonts.almarai(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 265,
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) => CustomGridTile(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomGridTile extends StatelessWidget {
  const CustomGridTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        width: 350,
        height: 265,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 350,
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/car_wallpaper.jpg'))),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tesla Y',
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'تبدأ من 12900 ك.د',
                    style: GoogleFonts.almarai(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({
    Key key,
    @required this.images,
    @required this.headline,
    @required this.height,
    @required this.imageWidth,
    @required this.text,
  });

  final List<String> images;
  final List<String> text;
  final String headline;
  final double height;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                headline,
                style: GoogleFonts.almarai(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: height,
              child: ListView.builder(
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          images[index],
                          fit: BoxFit.contain,
                          width: imageWidth,
                        ),
                        SizedBox(height: 6),
                        Visibility(
                            visible: text.isNotEmpty,
                            child: Text(
                              text.isNotEmpty ? text[index] : '',
                              style: GoogleFonts.roboto(),
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
