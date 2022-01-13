import 'package:bankcom/steps_body/personalProfileBody.dart';
import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  PersonalProfileBody pb = PersonalProfileBody();
  int _index = 0;
  List<String> mainsteps = ["personalProfile",""];
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
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        personalProfile(mainsteps.indexOf("personalProfile")==_index),
        const Step(
          title: Text('Step 2 title'),
          content: Text('Content for Step 2'),
        ),
      ],
    );
  }
}


Step personalProfile(bool isactive){
  return Step(
    isActive:isactive,
    title: const Text('PERSONAL PROFILE'),
    content: PersonalProfileBody(),
  );
}



