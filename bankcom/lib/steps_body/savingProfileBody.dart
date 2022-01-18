import 'package:bankcom/steps_body/personalProfileBody.dart';
import 'package:flutter/material.dart';


class SavingProfileBody extends StatefulWidget {
  const SavingProfileBody({Key? key}) : super(key: key);

  @override
  _SavingProfileBodyState createState() => _SavingProfileBodyState();
}

class _SavingProfileBodyState extends State<SavingProfileBody> {
  final _savingformKey = GlobalKey<FormState>();
  TextEditingController _yourgrossannualincomeController = TextEditingController();
  TextEditingController _yourspousegrossannualincomeController = TextEditingController();
  TextEditingController _retirementsavingsController = TextEditingController();
  TextEditingController _savingsaccountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _savingformKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headingText("What is your gross annual income?"),
            inputTextField("Your gross income",_yourgrossannualincomeController),
            headingText("What is your Spouse Gross Annual Income?"),
            inputTextField("Your spouse gross income",_yourspousegrossannualincomeController),
            headingText("How much you save monthly into retirement?"),
            inputTextField("Savings for retirement",_retirementsavingsController),
            headingText("How much you save into Bank Saving Account?"),
            inputTextField("Saving in bank",_savingsaccountController),
          ],
        ),

      ),
    );
  }
}
