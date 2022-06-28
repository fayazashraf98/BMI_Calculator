import 'package:bmi_calculator/Screens/ResultsPage.dart';
import 'package:bmi_calculator/Widgets/IconContent.dart';
import 'package:bmi_calculator/Widgets/ReUseble_Container.dart';
import 'package:bmi_calculator/Widgets/constant_styling.dart';
import 'package:bmi_calculator/function/Bmi_formul.dart';
import 'package:flutter/material.dart';

enum Gender{Male,FeMale,}

enum Orientation{Portrait,LandScap}
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Gender? selectedGender;
  int height=180;
  int weight=60;
  int age=18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: appbars(label: 'BMI Calculator',),
      ),
      body: SafeArea(
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child:Row(
              children: [
                Expanded(child:
                ReusebleContainer(
                  Colour:selectedGender==Gender.Male?
                  const_ActiveContinerColour:const_InActiveContinerColour,
                  ContinerChild: IconContent(
                      icon: Icons.male,
                      label:"MALE"
                  ),
                  onPressed: (){
                  setState((){
                    selectedGender=Gender.Male;
                  });},
                )
                ),
                Expanded(child:
                ReusebleContainer(
                  Colour:selectedGender==Gender.FeMale?
                  const_ActiveContinerColour:const_InActiveContinerColour,
                  ContinerChild: IconContent(
                      icon: Icons.female,
                      label:"FEMALE"),
                  onPressed: (){
                    setState((){
                      selectedGender=Gender.FeMale;
                    });},
                )
                ),
              ],
            ),
            ),
            Expanded(child:ReusebleContainer(Colour:const_ActiveContinerColour,
              ContinerChild:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("HEIGHT",style:labelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),style: heightTextStyle),
                      const Text('cm',style: labelTextStyle),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: const Color(0xffeb1555),
                      inactiveColor: const Color(0xff8d8e98),
                      onChanged: (double newValue){
                        setState((){
                          height=newValue.round();
                        });
                      }
                  )
              ],),
              onPressed: (){},)
            ),

           Expanded(child:Row(
           children: [
           Expanded(child:ReusebleContainer(Colour:const_ActiveContinerColour,
             ContinerChild:Column(
               mainAxisAlignment:MainAxisAlignment.center,
               children: [
                 const Text("WEIGHT",style: labelTextStyle,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(weight.toString(),style: heightTextStyle,)
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                    RoundedButton(Icons.remove, () {setState((){weight--;}); }),
                     RoundedButton(Icons.add, () {setState((){weight++;}); }),
                   ],
                 )
             ],), onPressed: (){},)

                  ),
           Expanded(child:ReusebleContainer(Colour:const_ActiveContinerColour,
             ContinerChild:Column(
               mainAxisAlignment:MainAxisAlignment.center,
               children:[
                 Text("AGE",style: labelTextStyle,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(age.toString(),style: heightTextStyle,)
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     RoundedButton(Icons.remove, () {setState((){age--;}); }),
                     RoundedButton(Icons.add, () {setState((){age++;}); }),
                   ],
                 )
             ],), onPressed: (){},)

    ),
    ],
    ),
    ),
           btn_Container(label: 'Calculate',
               onPressed:(){
             Bmi_calculator_formula calc=Bmi_calculator_formula(height: height,weight: weight);
             Navigator.push(context,
                 MaterialPageRoute(
                     builder: (context)=>Results(
                       BmiResult: calc.calculateBMI(),
                       BmiResultText: calc.getResultText(),
                       BmiResultTextDet: calc.getResult_det(),
                     )));} )
          ],
        ),
      ),
    );
  }


  }




