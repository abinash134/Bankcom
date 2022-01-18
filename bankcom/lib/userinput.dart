import 'package:bankcom/steps_body/personalProfileBody.dart';
import 'package:bankcom/steps_body/savingProfileBody.dart';
import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  PersonalProfileBody pb = PersonalProfileBody();
  int _index = 0;
  List<String> mainsteps = ["personalProfile","savings","spendinganddebt"];
  List<Function> confirmFuncs = [];
  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.horizontal,
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        print(_index);
        if (_index <= mainsteps.length) {
          setState(() {
            _index += 1;
            print(_index);
          });
        }
      },
      steps: <Step>[
        personalProfile(mainsteps.indexOf("personalProfile")==_index),
        savingsProfile(mainsteps.indexOf("savings")==_index),
        spendinganddebtProfile(mainsteps.indexOf("spendinganddebt")==_index)
      ],
    );
  }
}


Step personalProfile(bool isactive){
  return Step(
    isActive:isactive,
    title: isactive?Text('Personal Profile'):Container(),
    content: PersonalProfileBody(),
  );
}
Step savingsProfile(bool isactive){
  return Step(
    isActive:isactive,
    title: isactive?Text('Savings'):Container(),
    content:SavingProfileBody(),
  );
}
Step spendinganddebtProfile(bool isactive){
  return Step(
    isActive:isactive,
    title: isactive?Text('Spending And Debt'):Container(),
    content:SavingProfileBody(),
  );
}


