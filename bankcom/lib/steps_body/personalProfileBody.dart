import 'package:flutter/material.dart';







enum Gender { Male, Felmale ,Other}
enum Married { yes, no }
class PersonalProfileBody extends StatefulWidget {
  const PersonalProfileBody({Key? key}) : super(key: key);

  @override
  _PersonalProfileBodyState createState() => _PersonalProfileBodyState();
}

class _PersonalProfileBodyState extends State<PersonalProfileBody> {
  int dropdownValue = 1;
  int noofChildren = 0;
  void makechildrenlistForAge(){
    for(var i=0;i<noofChildren;i++){
      childrenListForage.add(
        Container(
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${childrenIndex[i]} child"),

              SizedBox(height: 30,width: 100,child: TextFormField()),
            ],
          ),
        )
      );
    }
  }
  List<Widget> childrenListForage = [];
  List<String> childrenIndex = ["1st","2nd","3rd","4th"];
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _secondnameController = TextEditingController();
  TextEditingController _pannumberController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _zipController = TextEditingController();
  TextEditingController _spouseageController = TextEditingController();
 void formvalidator(){
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }
  final _formKey = GlobalKey<FormState>();
 Gender? _genderGroup = Gender.Male;
 Married? _marriedgorup = Married.yes;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            headingText("Enter Your Name"),
            inputTextField("First Name",_firstnameController),
            inputTextField("Last Name",_secondnameController),
            headingText("Enter Your Pan Card Number"),
            inputTextField("Pan",_pannumberController),
            headingText("Enter Your Age"),
            inputTextField("Age",_ageController),
            headingText("What is Your gender?"),
            Column(
              children: [
                SizedBox(
                  width: 150,
                  child: ListTile(
                    title: const Text('Male'),
                    leading: Radio<Gender>(
                      value: Gender.Male,
                      groupValue: _genderGroup,
                      onChanged: (Gender? value) {
                        setState(() {
                          _genderGroup = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ListTile(
                    title: const Text('Female'),
                    leading: Radio<Gender>(
                      value: Gender.Felmale,
                      groupValue: _genderGroup,
                      onChanged: (Gender? value) {
                        setState(() {
                          _genderGroup = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ListTile(
                    title: const Text('Other'),
                    leading: Radio<Gender>(
                      value: Gender.Other,
                      groupValue: _genderGroup,
                      onChanged: (Gender? value) {
                        setState(() {
                          _genderGroup = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            headingText("Enter Your Zip Code"),
            inputTextField("Zip",_zipController),
            headingText("Are You Married?"),
            Column(
              children: [
                SizedBox(
                  width: 150,
                  child: ListTile(
                    title: const Text('Yes'),
                    leading: Radio<Married>(
                      value: Married.yes,
                      groupValue: _marriedgorup,
                      onChanged: (Married? value) {
                        setState(() {
                          _marriedgorup = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ListTile(
                    title: const Text('No'),
                    leading: Radio<Married>(
                      value: Married.no,
                      groupValue: _marriedgorup,
                      onChanged: (Married? value) {
                        setState(() {
                          _marriedgorup = value;
                        });
                      },
                    ),
                  ),
                ),

              ],
            ),
            _marriedgorup==Married.yes?headingText("What is your spouse's age?"):Container(),
            _marriedgorup==Married.yes?inputTextField("Age",_spouseageController):Container(),
            _marriedgorup==Married.yes?headingText("How many children do you have?"):Container(),
            _marriedgorup==Married.yes?Container(
              width: MediaQuery.of(context).size.width-20,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<int>(
                isExpanded:true,
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 42,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline:  SizedBox(),
                onChanged: (int? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    noofChildren=newValue;

                  });
                  makechildrenlistForAge();
                },
                items: <int>[1, 2, 3, 4]
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text("${value}"),
                  );
                }).toList(),

              ),
            ):Container(),
            _marriedgorup==Married.yes?headingText("How old are your children?"):Container(),
            _marriedgorup==Married.yes?Column(
              children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: childrenListForage.length,
                    itemBuilder: (context,index){
                  return childrenListForage[index];
                })
              ],
            ):Container(),
          ],
        ),
      ),
    );
  }
}


Widget inputTextField(String labletext,TextEditingController controller){
  return  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      alignment: Alignment.topLeft,
      width: 300,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        decoration:  InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labletext,
        ),
      ),
    ),
  );
}

Widget headingText(String heading){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      heading,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20
      ),
    ),
  );
}
