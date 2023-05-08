import 'package:al_waha/constant/colors.dart';
import 'package:flutter/material.dart';

import '../constant/dimensions.dart';

class EntryField extends StatefulWidget {


  var controller = TextEditingController();
  IconData icon;
  bool? isPassword ;
  String labelField;


  EntryField({Key? key,
    required this.icon,
    required this.labelField,
    required this.controller,
     this.isPassword })
      : super(key: key);


  @override
  State<EntryField> createState() => _EntryFieldState();
}
bool isHidden = true;

class _EntryFieldState extends State<EntryField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
     margin: EdgeInsets.symmetric(vertical: Dimensions.width10),
      decoration:  BoxDecoration(
        border: const Border.fromBorderSide(BorderSide.none),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(.4),
          blurRadius: 25,
          offset: const Offset(3, 3),
          spreadRadius: 2),
        ],
      ),
      child: widget.isPassword!?
      TextField(
        controller: widget.controller,
        obscureText: isHidden,
        decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,

            prefixIcon: Icon(
              widget.icon,
              color: AppColors.mainColor,
              size: Dimensions.iconsSize * 2.3,
            ),
            hintText: 'Enter ${widget.labelField}',
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: AppColors.mainColor, width: 1),
                borderRadius: BorderRadius.circular(
                    Dimensions.borderRadius15 )
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                    Dimensions.borderRadius15 )
            ),
            contentPadding: EdgeInsets.all(Dimensions.height10),
            suffixIcon:  GestureDetector(
              onTap: (){
                setState(() {
                  isHidden =! isHidden;
                });
              },
              child: !isHidden ?
              Image.asset('assets/icons/Hide.png',):
              Image.asset('assets/icons/Show.png',)
            )
        ),
      ):
      TextField(
        controller: widget.controller,
        obscureText: widget.isPassword!,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade50,
          filled: true,

          prefixIcon: Icon(
            widget.icon,
            color: AppColors.mainColor,
            size: Dimensions.iconsSize * 2.35,
          ),
          hintText: 'Enter ${widget.labelField}',
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.mainColor, width: 1),
              borderRadius: BorderRadius.circular(
                  Dimensions.borderRadius15 )
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                  Dimensions.borderRadius15 )
          ),
          contentPadding: EdgeInsets.all(Dimensions.height10),

        ),
      ),


      // ((){
      //   if (widget.isPassword!) {
      //     return TextField(
      //       controller: widget.controller,
      //       obscureText: widget.isPassword!,
      //       decoration: InputDecoration(
      //         fillColor: Colors.grey.shade100,
      //         filled: true,
      //
      //         prefixIcon: Icon(
      //           widget.icon,
      //           color: AppColors.mainColor,
      //           size: Dimensions.iconsSize * 2.3,
      //         ),
      //         hintText: 'Enter ${widget.labelField}',
      //         focusedBorder: OutlineInputBorder(
      //             borderSide: const BorderSide(
      //                 color: AppColors.mainColor, width: 1),
      //             borderRadius: BorderRadius.circular(
      //                 Dimensions.borderRadius15 )
      //         ),
      //         border: OutlineInputBorder(
      //             borderSide: BorderSide.none,
      //             borderRadius: BorderRadius.circular(
      //                 Dimensions.borderRadius15 )
      //         ),
      //         contentPadding: EdgeInsets.all(Dimensions.height10),
      //         suffixIcon: Icon(Icons.remove_red_eye,
      //           color: AppColors.mainColor,
      //         )
      //       ),
      //     );
      //   }
      //   else{
      //     return TextField(
      //       controller: widget.controller,
      //       obscureText: widget.isPassword!,
      //       decoration: InputDecoration(
      //         fillColor: Colors.grey.shade50,
      //         filled: true,
      //
      //         prefixIcon: Icon(
      //           widget.icon,
      //           color: AppColors.mainColor,
      //           size: Dimensions.iconsSize * 2.35,
      //         ),
      //         hintText: 'Enter ${widget.labelField}',
      //         focusedBorder: OutlineInputBorder(
      //             borderSide: const BorderSide(
      //                 color: AppColors.mainColor, width: 1),
      //             borderRadius: BorderRadius.circular(
      //                 Dimensions.borderRadius15 )
      //         ),
      //         border: OutlineInputBorder(
      //             borderSide: BorderSide.none,
      //             borderRadius: BorderRadius.circular(
      //                 Dimensions.borderRadius15 )
      //         ),
      //         contentPadding: EdgeInsets.all(Dimensions.height10),
      //
      //       ),
      //     );
      //   }
      // }()),
    );
  }
}
