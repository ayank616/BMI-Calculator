import 'package:bmi_calculator/data/constants.dart';
import 'package:bmi_calculator/cus_buttons/cus_card.dart';
import 'package:bmi_calculator/cus_buttons/buttons.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiRes1, required this.bmiRes2, required this.bmiMes});

  final String bmiRes1;
  final String bmiRes2;
  final String bmiMes;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 10, top: 15),
              child: const Text(
                'Your Result:',
                style: kYourResultTextStyle,
              ),
            ),
            Expanded(
                flex: 5,
                child: CusCard(
                  colour: kactiveC,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        bmiRes2.toUpperCase(),
                        style: kBodyConditionTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Column(
                        children: [
                          Text(bmiRes1,
                              style: kResultTextStyle,
                              textAlign: TextAlign.center),
                          const Text(
                            'Normal BMI Range:',
                            style: kRangeMessageTextStyle1,
                          ),
                          const Text(
                            '18.5 - 24.5',
                            style: kRangeMessageTextStyle2,
                          ),
                        ],
                      ),
                      Text(bmiMes,
                          style: kResultMessageTextStyle,
                          textAlign: TextAlign.center),
                    ],
                  ),
                )),
            BottomButton(
                onPress: () {
                  Navigator.pop(context);
                },
                label: 'RECALCULATE BMI')
          ],
        ),
      ),
    );
  }
}
