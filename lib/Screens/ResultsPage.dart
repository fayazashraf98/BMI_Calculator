import 'package:bmi_calculator/Widgets/ReUseble_Container.dart';
import 'package:bmi_calculator/Widgets/constant_styling.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final BmiResult;
  final BmiResultText;
  final BmiResultTextDet;
  Results({required this.BmiResult,required this.BmiResultText,required this.BmiResultTextDet});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: appbars(label: 'Results'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Your Result",style: result_mainFonat_TextStyle,),
              SizedBox(height: 10,),

            ],
          ),
          Expanded(
              child: ReusebleContainer(
                Colour: const_ActiveContinerColour, onPressed: () {  },
            ContinerChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(BmiResultText,
                  style: result_TextStyle
                ),
                Text(BmiResult,style: heightTextStyle,),
                Text(BmiResultTextDet,
                  style: result_det_TextStyle,
                textAlign: TextAlign.center,)
              ],
            ),)),
          btn_Container(label: "RE-CALCULATE", onPressed: (){Navigator.pop(context);})

        ],
      ),
    );
  }
}



