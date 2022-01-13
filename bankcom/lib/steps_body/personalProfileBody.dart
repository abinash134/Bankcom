import 'package:flutter/material.dart';







enum Gender { Male, Felmale ,Other}
class PersonalProfileBody extends StatefulWidget {
  const PersonalProfileBody({Key? key}) : super(key: key);

  @override
  _PersonalProfileBodyState createState() => _PersonalProfileBodyState();
}

class _PersonalProfileBodyState extends State<PersonalProfileBody> {

  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _secondnameController = TextEditingController();
  TextEditingController _pannumberController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
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
