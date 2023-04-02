import 'package:flutter/material.dart';
import 'package:uikit/dtx.dart';

typedef OnToggle = Function(ToggleButtonState state);

class ToggleButton extends StatefulWidget {
  final double size;
  final OnToggle onToggle;
  final Color? thumbOnColor;
  final Color? backgroundOnColor;
  final Color? thumbOffColor;
  final Color? backgroundOffColor;
  final int? durationMills;

  const ToggleButton({
    super.key,
    required this.size,
    required this.onToggle,
    this.durationMills,
    this.thumbOffColor,
    this.backgroundOffColor,
    this.thumbOnColor,
    this.backgroundOnColor,
  });

  @override
  State<StatefulWidget> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton>{
  late Color thumbColor;
  late Color backgroundColor;
  ToggleButtonState state = ToggleButtonState.off;
  Alignment thumbAlign = Alignment.centerRight;


  void initColors(BuildContext context) {
    if(state == ToggleButtonState.off) {
      thumbColor =
          widget.thumbOffColor ?? context.colorScheme.onTertiaryContainer;
      backgroundColor =
          widget.backgroundOffColor ?? context.colorScheme.tertiaryContainer;
    }else{
      thumbColor =
          widget.thumbOnColor ?? context.colorScheme.onPrimaryContainer;
      backgroundColor =
          widget.backgroundOnColor ?? context.colorScheme.primaryContainer;
    }
  }

  @override
  Widget build(BuildContext context) {
    initColors(context);

    return GestureDetector(
      onTap: (){
        if(state == ToggleButtonState.on){
          setState(() {
            thumbColor = widget.thumbOffColor?? context.colorScheme.onPrimaryContainer;
            backgroundColor = widget.backgroundOffColor?? context.colorScheme.primaryContainer;
            thumbAlign = Alignment.centerRight;
            state = ToggleButtonState.off;
            widget.onToggle(state);
          });
        }else{
          setState(() {
            thumbColor = widget.thumbOnColor?? context.colorScheme.onTertiaryContainer;
            backgroundColor = widget.backgroundOnColor?? context.colorScheme.tertiaryContainer;
            thumbAlign = Alignment.centerLeft;
            state = ToggleButtonState.on;
            widget.onToggle(state);
          });
        }
      },
      child: Container(
        width: widget.size * 2.2,
        height: widget.size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16)
        ),
        child: AnimatedAlign(
          alignment: thumbAlign,
          duration: Duration(milliseconds: widget.durationMills?? 200),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: thumbColor,
              shape: BoxShape.circle
            ),
          ),
        ),
      ),
    );
  }
}

enum ToggleButtonState { on, off }
