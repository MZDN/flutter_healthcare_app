import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_healthcare_app/src/model/dactor_model.dart';
import 'package:flutter_healthcare_app/src/model/data.dart';
import 'package:flutter_healthcare_app/src/model/medicine_model.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:intl/intl.dart';

class MedicationPage extends StatefulWidget {
  @override
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  TextEditingController _problemController = TextEditingController();

  var fileName = 'File';
  List<Medicine> medicineListdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    medicineListdata = medicineList.map((x) => Medicine.fromJson(x)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColor.themered,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_backspace)),
      ),
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.add_shopping_cart),
          backgroundColor: LightColor.themered,
          onPressed: () {}),
      body: Column(
        children: [
          headerpart(context),
          searchMedicine(context),
          Expanded(child: _medicineList(context))
        ],
      ),
    );
  }

  Widget headerpart(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: LightColor.themered,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15, bottom: 10),
            child: Text(
              'Lab test',
              style: TextStyle(
                color: LightColor.white,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Text(
              'Upload your prescription',
              style: TextStyle(
                color: LightColor.white,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: GestureDetector(
              onTap: () async {
                FilePickerResult result = await FilePicker.platform.pickFiles();

                if (result != null) {
                  setState(() {
                    fileName = result.names[0];
                  });
                }
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: LightColor.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: LightColor.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ]),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: LightColor.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      height: 50,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Upload',
                            style: TextStyle(
                                color: LightColor.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        '$fileName',
                        style: TextStyle(
                            color: LightColor.lightblack, fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 5, bottom: 10),
            child: Text(
              'upload .jpeg, png, doc, pdf file',
              style: TextStyle(color: LightColor.white, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  Widget searchMedicine(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 15.0, right: 15, top: 15, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Medication',
                style: TextStyle(
                  color: LightColor.lightblack.withOpacity(0.7),
                  fontSize: 18,
                ),
              ),
              Text(
                'View all',
                style: TextStyle(
                  color: LightColor.themered,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
        _searchField(),
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
                hintStyle: TextStyles.body,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search, color: LightColor.themered),
          ),
        ],
      ),
    );
  }

  Widget _medicineList(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: medicineListdata.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                color: LightColor.themered,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: LightColor.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/medicine.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: LightColor.themered.withOpacity(0.7)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:5.0),
                            child: Text(
                              '${medicineListdata[index].medicineName}',
                              style: TextStyle(
                                  color: LightColor.black, fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '${medicineListdata[index].companyName}',
                            style: TextStyle(
                                color: LightColor.black, fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom:5.0),
                            child: Text(
                              '\$${medicineListdata[index].price}/each',
                              style: TextStyle(
                                  color: LightColor.black, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: LightColor.white,
                        borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                      child: Center(
                        child: Icon(Icons.check,
                        color: LightColor.themered,
                        size: 20,),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
