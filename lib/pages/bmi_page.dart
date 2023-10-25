import 'package:bmi_calculator/data/bmi_brain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/data/constants.dart';
import 'package:bmi_calculator/cus_buttons/cus_card.dart';
import 'package:bmi_calculator/data/icon_data.dart';
import 'package:bmi_calculator/Pages/results_page.dart';
import 'package:bmi_calculator/cus_buttons/buttons.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class BMI_Page extends StatefulWidget {
  const BMI_Page({super.key});

  @override
  State<BMI_Page> createState() => _BMI_PageState();
}

class _BMI_PageState extends State<BMI_Page> {
  Gender? selectedgender;
  int height = 180;
  int weight = 50;
  int age = 20;

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
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: CusCard(
                    onPress: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    colour:
                        selectedgender == Gender.male ? kactiveC : kinactiveC,
                    child: Icon_data(icon: Icons.male, label: 'MALE')),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedgender = Gender.female;
                    });
                  },
                  child: CusCard(
                      onPress: () {
                        setState(() {
                          selectedgender = Gender.female;
                        });
                      },
                      colour: selectedgender == Gender.female
                          ? kactiveC
                          : kinactiveC,
                      child: Icon_data(icon: Icons.female, label: 'FEMALE')),
                ),
              ),
            ]),
          ),
          Expanded(
            child: CusCard(
                colour: kactiveC,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kCardTextStyle,
                        ),
                        const Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        trackHeight: 3,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 10),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 20),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 200,
                        onChanged: (double newVal) {
                          setState(() {
                            height = newVal.round();
                          });
                        },
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CusCard(
                        colour: kactiveC,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kCardTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: CusCard(
                      colour: kactiveC,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kCardTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
          BottomButton(
            onPress: () {
              BmiBrain myBmi = BmiBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiRes1: myBmi.calculateBMI(),
                            bmiRes2: myBmi.getResult(),
                            bmiMes: myBmi.bmiMessafe(),
                          )));
            },
            label: 'CALCULATE',
          )
        ]),
      ),
    );
  }
}
