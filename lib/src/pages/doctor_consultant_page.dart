import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/dactor_model.dart';
import 'package:flutter_healthcare_app/src/model/data.dart';
import 'package:flutter_healthcare_app/src/pages/notification_page.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';
import 'package:flutter_healthcare_app/src/widgets/DrawerWidget.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:rating_bar/rating_bar.dart';

import '../theme/light_color.dart';
import '../theme/light_color.dart';
import '../theme/light_color.dart';

class DoctorConsultantPage extends StatefulWidget {
  DoctorConsultantPage({Key key}) : super(key: key);

  @override
  _DoctorConsultantPageState createState() => _DoctorConsultantPageState();
}

class _DoctorConsultantPageState extends State<DoctorConsultantPage> {
  List<DoctorModel> doctorDataList;
  var selected = 'DOCTOR';
  var selectedField = 'Near by';
  var isSelectFilter = false;
  var gender = 'Male';
  double _rating = 5;

  final GlobalKey<ScaffoldState> _scaffoldKey_home =
      new GlobalKey<ScaffoldState>();


  List<String> _genderList = ["Male", "Female"];

  @override
  void initState() {
    doctorDataList = doctorMapList.map((x) => DoctorModel.fromJson(x)).toList();
    super.initState();
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: GestureDetector(
        onTap: () {
          _scaffoldKey_home.currentState.openDrawer();
        },
        child: Icon(
          Icons.short_text,
          size: 30,
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => NotificationPage()));
          },
          child: Icon(
            Icons.notifications_none,
            size: 30,
            color: LightColor.grey,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          child: Container(
            // height: 40,
            // width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: Image.asset("assets/user.png", fit: BoxFit.fill),
          ),
        ).p(8),
      ],
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Hello,", style: TextStyles.title.subTitleColor),
        Text(
          "Peter Parker",
          style: TextStyles.title,
        ),
      ],
    ).p16;
  }

  Widget _navLinks() {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 20.0,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            // do what you need to do when "Click here" gets clicked
            setState(() {
              selected = 'DOCTOR';
              print("DOCTOR");
            });
          },
          child: Text("DOCTOR",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: selected == 'DOCTOR' ? Colors.redAccent : Colors.black54,
                fontSize: 14,
              )),
        ).vP8,
        GestureDetector(
          onTap: () {
            // do what you need to do when "Click here" gets clicked
            setState(() {
              selected = 'LAB TEST';
            });
            print("LAB TEST");
          },
          child: Text("LAB TEST",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: selected == 'LAB TEST'
                      ? Colors.redAccent
                      : Colors.black54,
                  fontSize: 14)),
        ).vP8,
        GestureDetector(
          onTap: () {
            // do what you need to do when "Click here" gets clicked
            setState(() {
              selected = 'MEDICINE';
            });
            print("MEDICINE");
          },
          child: Text("MEDICINE",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: selected == 'MEDICINE'
                      ? Colors.redAccent
                      : Colors.black54,
                  fontSize: 14)),
        ).vP8,
        GestureDetector(
          onTap: () {
            // do what you need to do when "Click here" gets clicked
            setState(() {
              selected = 'E-SHOP';
            });
            print("E-SHOP");
          },
          child: Text("E-SHOP",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color:
                      selected == 'E-SHOP' ? Colors.redAccent : Colors.black54,
                  fontSize: 14)),
        ).vP8
      ],
    );
  }

  Widget _searchField() {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: LightColor.lightblack.withOpacity(.3),
            blurRadius: 15,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 120,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyles.body.subTitleColor,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelectFilter == true) {
                          isSelectFilter = false;
                        } else {
                          isSelectFilter = true;
                        }
                      });
                      print(isSelectFilter);
                    },
                    child: Icon(Icons.filter_list, color: LightColor.themered)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.search, color: LightColor.themered)
                    .alignCenter
                    .ripple(() {}, borderRadius: BorderRadius.circular(13)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _category() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Category", style: TextStyles.title.bold),
              Text(
                "See All",
                style:
                    TextStyles.titleNormal.copyWith(color: LightColor.themered),
              ).p(8).ripple(() {})
            ],
          ),
        ),
        SizedBox(
          height: AppTheme.fullHeight(context) * .28,
          width: AppTheme.fullWidth(context),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _categoryCard("Cardiologists", "50+ doctors",
                  color: LightColor.green, lightColor: LightColor.lightGreen),
              _categoryCard("Dermatologists", "99+ Doctors",
                  color: LightColor.skyBlue, lightColor: LightColor.lightBlue),
              _categoryCard("Gastroenterologists", "50+ Doctors",
                  color: LightColor.orange, lightColor: LightColor.lightOrange),
              _categoryCard("Anesthesiologists", "15+ Doctors",
                  color: LightColor.purple, lightColor: LightColor.purpleLight)
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoryCard(String title, String subtitle,
      {Color color, Color lightColor}) {
    TextStyle titleStyle = TextStyles.bodynormal.bold.white;
    TextStyle subtitleStyle = TextStyles.bodynormal.white;
    if (AppTheme.fullWidth(context) < 392) {
      titleStyle = TextStyles.body.white;
      subtitleStyle = TextStyles.bodynormal.white;
    }
    return AspectRatio(
      aspectRatio: 6 / 8,
      child: Container(
        height: 280,
        width: AppTheme.fullWidth(context) * .3,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 10,
              color: lightColor.withOpacity(.8),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -20,
                  left: -20,
                  child: CircleAvatar(
                    backgroundColor: lightColor,
                    radius: 60,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: Text(title, style: titleStyle).hP8,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Text(
                        subtitle,
                        style: subtitleStyle,
                      ).hP8,
                    ),
                  ],
                ).p16
              ],
            ),
          ),
        ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  Widget _doctorsList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Top Doctors", style: TextStyles.title.bold),
              IconButton(
                  icon: Icon(
                    Icons.sort,
                    color: LightColor.themered,
                  ),
                  onPressed: () {})
              // .p(12).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
            ],
          ).hP16,
          getdoctorWidgetList()
        ],
      ),
    );
  }

  Widget getdoctorWidgetList() {
    return Column(
        children: doctorDataList.map((x) {
      return _doctorTile(x);
    }).toList());
  }

  Widget _doctorTile(DoctorModel model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: LightColor.grey.withOpacity(.2),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: LightColor.grey.withOpacity(.1),
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: randomColor(),
              ),
              child: Image.asset(
                model.image,
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(model.name, style: TextStyles.title.bold),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.type,
                style: TextStyles.body.subTitleColor.bold,
              ),
              Text(
                model.location,
                style: TextStyles.bodySm.subTitleColor,
              ),
              Text(
                ('\$${model.constFee}'),
                style: TextStyles.bodySm.subTitleColor,
              ),
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: LightColor.themered,
          ),
        ),
      ).ripple(() {
        Navigator.pushNamed(context, "/DetailPage", arguments: model);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  Widget _basedOnField() {
    return isSelectFilter
        ? Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            spacing: 20.0,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // do what you need to do when "Click here" gets clicked
                  setState(() {
                    selectedField = 'Near by';
                    print("Near by");
                  });
                  openNearByDialog(context);
                },
                child: Text("Near by",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: selectedField == 'Near by'
                          ? Colors.redAccent
                          : Colors.black54,
                      fontSize: 14,
                    )),
              ).vP8,
              GestureDetector(
                onTap: () {
                  // do what you need to do when "Click here" gets clicked
                  setState(() {
                    selectedField = 'Gender';
                  });
                  openGenderDialog(context);
                  print("Gender");
                },
                child: Text("Gender",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: selectedField == 'Gender'
                            ? Colors.redAccent
                            : Colors.black54,
                        fontSize: 14)),
              ).vP8,
              GestureDetector(
                onTap: () {
                  // do what you need to do when "Click here" gets clicked
                  setState(() {
                    selectedField = 'Rating';
                  });
                  openRatingDialog(context);
                  print("Rating");
                },
                child: Text("Rating",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: selectedField == 'Rating'
                            ? Colors.redAccent
                            : Colors.black54,
                        fontSize: 14)),
              ).vP8,
              GestureDetector(
                onTap: () {
                  // do what you need to do when "Click here" gets clicked
                  setState(() {
                    selectedField = 'Experience';
                  });
                  openExperienceDialog(context);
                  print("Experience");
                },
                child: Text("Experience",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: selectedField == 'Experience'
                            ? Colors.redAccent
                            : Colors.black54,
                        fontSize: 14)),
              ).vP8
            ],
          )
        : Text('');
  }

  Color randomColor() {
    var random = Random();
    final colorList = [
      Theme.of(context).primaryColor,
      LightColor.orange,
      LightColor.green,
      LightColor.grey,
      LightColor.lightOrange,
      LightColor.skyBlue,
      LightColor.titleTextColor,
      Colors.red,
      Colors.brown,
      LightColor.purpleExtraLight,
      LightColor.skyBlue,
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      key: _scaffoldKey_home,
      drawer: DrawerWidget(
        scaffoldKey: _scaffoldKey_home,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _header(),
                _navLinks(),

                _searchField(),
                _basedOnField(),
                //_category(),
              ],
            ),
          ),
          _doctorsList()
        ],
      ),
    );
  }

  void openExperienceDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (contex, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 16,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: LightColor.themered,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Input the year of experience',
                          style: TextStyle(color: LightColor.white,
                          fontSize: 18),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                              child: TextField(
                                maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: LightColor.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: LightColor.white),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: LightColor.white),
                                  ),
                                  counterText: '',
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16, vertical: 16),

                                ),
                              ),
                            ),
                            Text('Years',
                            style: TextStyle(
                              color: LightColor.white,
                              fontSize: 16
                            ),)
                          ],

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'OK',
                            style: TextStyle(
                                fontWeight:FontWeight.bold,
                                color: LightColor.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  void openRatingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (contex, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 16,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: LightColor.themered,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Input the rating',
                          style: TextStyle(color: LightColor.white,
                              fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: RatingBar(
                          initialRating: _rating,
                          onRatingChanged: (rating) => setState(() => _rating = rating),
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          halfFilledIcon: Icons.star_half,
                          isHalfAllowed: true,
                          filledColor: LightColor.white,
                          emptyColor: LightColor.white,
                          halfFilledColor: LightColor.white,
                          size: 24,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'OK',
                            style: TextStyle(
                                fontWeight:FontWeight.bold,
                                color: LightColor.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  void openGenderDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (contex, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 16,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: LightColor.themered,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Select your gender',
                          style: TextStyle(color: LightColor.white,
                              fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Theme(
                          data: ThemeData(
                            primarySwatch: LightColor.MATERIAL_WHITE
                          ),
                          child: RadioGroup<String>.builder(
                            direction: Axis.horizontal,
                            groupValue: gender,
                            onChanged: (value) => setState(() {
                              gender = value;
                            }),
                            items: _genderList,

                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'OK',
                            style: TextStyle(
                                fontWeight:FontWeight.bold,
                                color: LightColor.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  void openNearByDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (contex, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 16,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: LightColor.themered,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Input the year of experience',
                          style: TextStyle(color: LightColor.white,
                              fontSize: 18),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:10.0,right: 10),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: LightColor.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: LightColor.white),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: LightColor.white),
                                    ),
                                    counterText: '',
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),

                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:10.0),
                              child: Icon(Icons.gps_fixed,
                              size: 24,
                              color: LightColor.white,),
                            )
                          ],

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'OK',
                            style: TextStyle(
                                fontWeight:FontWeight.bold,
                                color: LightColor.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });

  }
}
