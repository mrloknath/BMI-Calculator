import 'package:flutter/material.dart';

class MaleFemale extends StatefulWidget{
  const MaleFemale({super.key,required this.iconText,required this.buttonBackColor});
  final Color iconText;
  final Color buttonBackColor;
  @override
  State<StatefulWidget> createState() => _MaleFemale();
}

class _MaleFemale  extends State<MaleFemale>{
  Color maleButtonBackground=Colors.white,femaleButtonBackground=Colors.white;
  Color maleIconText=Colors.green,femaleIconText=Colors.green;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10.0,right: 10.0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.transparent.withAlpha(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton.icon(
              onPressed: (){
                setState(() {
                  maleIconText=Colors.white;
                  femaleIconText=widget.buttonBackColor;
                  maleButtonBackground=widget.buttonBackColor;
                  femaleButtonBackground=Colors.white;
                });
              },

              style: ElevatedButton.styleFrom(backgroundColor: maleButtonBackground, ),
              icon: Icon(Icons.man,color: maleIconText,size: 30,),
              label: Text("MALE",style: TextStyle(color: maleIconText))),
          ElevatedButton.icon(
              onPressed: (){
                setState(() {
                  femaleIconText=Colors.white;
                  maleIconText=widget.buttonBackColor;
                  femaleButtonBackground=widget.buttonBackColor;
                  maleButtonBackground=Colors.white;
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor:femaleButtonBackground, ),
              icon: Icon(Icons.woman,color: femaleIconText,size: 30,),
              label: Text("FEMALE",style: TextStyle(color: femaleIconText),))
        ],
      ),
    );
  }
}
