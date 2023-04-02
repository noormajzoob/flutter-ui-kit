import 'package:flutter/material.dart';
import 'package:uikit/dtx.dart';

typedef OnChecked = Function(RadioButtonState state);

class RadioButton extends StatefulWidget {
  final double size;
  final Color? color;
  final double? outlineBorderWidth;
  final OnChecked onChecked;
  final RadioButtonState? defaultState;
  final int? duration;

  const RadioButton({super.key, required this.size, this.color, this.outlineBorderWidth, required this.onChecked, this.duration, this.defaultState});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {

  RadioButtonState state = RadioButtonState.unchecked;
  late Color primaryColor;
  late double outlineWidth;
  late double padding;

  @override
  void initState() {
    if(widget.defaultState != null){
      state = widget.defaultState!;
    }
  }

  @override
  Widget build(BuildContext context) {
    initColor(context);
    initWidth();

    return GestureDetector(
      onTap: (){
        if(state == RadioButtonState.checked){
          setState(() {
            state = RadioButtonState.unchecked;
            padding = widget.size;
            widget.onChecked(state);
          });
        }else{
          setState(() {
            state = RadioButtonState.checked;
            padding = 3;
            widget.onChecked(state);
          });
        }
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
            width: outlineWidth,
          ),
          borderRadius: BorderRadius.circular(widget.size * 0.4)
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: widget.duration?? 200),
          padding: EdgeInsets.all(padding),
          child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular((widget.size - 3) * 0.4)
                ),
              ),
        ),
      ),
    );
  }

  void initColor(BuildContext context){
    primaryColor = widget.color?? context.colorScheme.primary;
  }

  void initWidth(){
    if(state == RadioButtonState.checked){
      padding = 3;
    }else{
      padding = widget.size;
    }

    if(widget.outlineBorderWidth != null){
      if(widget.outlineBorderWidth! > 5){
        outlineWidth = 5;
      }else{
        outlineWidth = widget.outlineBorderWidth!;
      }
    }else{
      outlineWidth = 2;
    }
  }

}

enum RadioButtonState{
  checked, unchecked
}