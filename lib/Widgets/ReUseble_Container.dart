import 'package:bmi_calculator/Widgets/constant_styling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusebleContainer extends StatelessWidget{
  ReusebleContainer({required this.Colour,required this.ContinerChild,required this.onPressed});
  final Color Colour;
  final Widget ContinerChild;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colour, //Color(0xff1d1e33),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ContinerChild,
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  RoundedButton(this.icon,this.onPressed);
  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
        backgroundColor: Color(0xff4c4f5e),
        child: IconButton(
            onPressed: onPressed,
            icon:Icon(icon),color: Colors.white,));
  }
}

class appbars extends StatelessWidget {
  final String label;
  appbars({required this.label});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff1A1F38),
      centerTitle: true,
      title: Text(label,style: AppBar_TextStyle,),
    );

  }
}
class btn_Container extends StatelessWidget {
final String label;
final VoidCallback onPressed;
btn_Container({required this.label,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(15),
        height: const_BottomContainerHeight,
        decoration: BoxDecoration(
          color:const_BottomContainerColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child:
        Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label,style: btn_TextStyle,),
          ],
        ),
      ),
    );
  }
}



