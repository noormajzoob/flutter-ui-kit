# UI Kit
implement basic widget in flutter.

# Toggle button

    ToggleButton(
	    size: 30,
	    thumbOffColor: Colors.black,
	    onToggle: (state) {
	    
	    },
	    
	);
	
    ToggleButton(size: 30, 
	    onToggle: (state) {},
	    thumbOffColor: context.colorScheme.primary,
	    backgroundOffColor: context.colorScheme.tertiaryContainer,
	    backgroundOnColor: context.colorScheme.primaryContainer,
	    thumbOnColor: context.colorScheme.tertiary
    );
    
   
https://user-images.githubusercontent.com/120308888/229360436-909041e5-8a8f-444b-b055-09011cb6c1f1.mp4


# Radio button

    RadioButton(
	    size: 30, 
	    defaultState: RadioButtonState.checked, 
	    onChecked: (state) {
	});
    RadioButton(
	    size: 30, 
	    defaultState: RadioButtonState.checked, 
	    onChecked: (state) {},
	    outlineBorderWidth: 2, 
	    color: context.colorScheme.primary,
	    duration: 300
	);
  

https://user-images.githubusercontent.com/120308888/229360270-b441decb-2538-4b57-a0a4-8a53db20ad1d.mp4

