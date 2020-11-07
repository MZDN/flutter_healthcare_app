import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class ContactInfo extends StatefulWidget {
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  List<Widget> emergencyWidgets = List<Widget>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emergencyWidgets.add(emergencyWidgetItem(context));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: ColorResources.themered,
            )),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Contact Information',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ),
      body: contactBody(context),
    );
  }

  contactBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            top: 10,
            right: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact information\n',
                style: TextStyle(
                    fontSize: 18,
                    color: ColorResources.themered,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Please fill the below details\n',
                style: TextStyle(
                    fontSize: 14,
                    color: ColorResources.lightblack,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                'Our doctors can directly provide emergency service to your location, if necessary',
                style: TextStyle(
                    fontSize: 14,
                    color: ColorResources.black,
                    fontWeight: FontWeight.normal),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "My postal code",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9.0),
                    borderSide: BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "Postal code can't be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 7.0)),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "My Phone number",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9.0),
                    borderSide: BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "Phone number can't be left blank";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 7.0)),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "My Address",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9.0),
                    borderSide: BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "Address can't be left blank";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                'On emergency',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              Divider(),
              emergencyWidgets != null
                  ? Column(
                      children: emergencyWidgets,
                    )
                  : 0,
              RaisedButton(onPressed: (){
                setState(() {
                  emergencyWidgets.add(emergencyWidgetItem(context));
                });
              },
                color: ColorResources.themered,
                child: Text('Add+',
                style: TextStyle(
                  color: ColorResources.white
                ),),
              ),
              Padding(padding: EdgeInsets.only(top: 15.0)),
              Center(
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                      side: BorderSide(color: Colors.white),
                    ),
                    onPressed: () => print("Button Pressed"),
                    color: ColorResources.themered,
                    child: Text('Save',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15.0)),
            ],
          ),
        ),
      ),
    );
  }

  Widget emergencyWidgetItem(BuildContext context) {
    return Column(
      children: [
         Padding(padding: EdgeInsets.only(top: 7.0)),
         TextFormField(
          decoration:  InputDecoration(
            labelText: "Emergency Contact person name",
            fillColor: Colors.white,
            border:  OutlineInputBorder(
              borderRadius:  BorderRadius.circular(9.0),
              borderSide:  BorderSide(),
            ),
            //fillColor: Colors.green
          ),
          validator: (val) {
            if (val.length == 0) {
              return "Phone number can't be left blank";
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.text,
          style:  TextStyle(
            fontFamily: "Poppins",
          ),
        ),
         Padding(padding: EdgeInsets.only(top: 7.0)),
         TextFormField(
          decoration:  InputDecoration(
            labelText: "Emergency Contact Number",
            fillColor: Colors.white,
            border:  OutlineInputBorder(
              borderRadius:  BorderRadius.circular(9.0),
              borderSide:  BorderSide(),
            ),
            //fillColor: Colors.green
          ),
          validator: (val) {
            if (val.length == 0) {
              return "Phone number can't be left blank";
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.number,
          style:  TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        Divider(
        )
      ],
    ); 
  }
}
