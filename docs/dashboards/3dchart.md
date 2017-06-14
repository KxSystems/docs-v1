![Screenshot](img/3dchartshtmllight.jpg)

Charts data in 3 dimenions

## Basics

Set up <a href="#data-source">Data Source</a> and 3D chart type

![Screenshot](img/3dchartsbasicsmenu.jpg)

### Data Source

See [Defining a Query](introduction#defining-a-query) and [Analytics](introduction#analytics) for more on data sourcing.

### Focus

Used for [linking components](introduction#linking-components). Requires a [view state parameter](introduction#view-state-parameters).

### Type

Sets the type of 3D Chart to Use

![Screenshot](img/3dcharttypehtmllight.jpg)

### Selected Value 

Used to map a chart (query) data point to a [view state parameter](introduction#view-state-parameters) when a chart bar is clicked by the user. 

[1] Create a [view state parameter](introduction#view-state-parameters) and assign to _Selected Value_
 
![Screenshot](img/selectedvaluecharthtmllight.jpg)

[2] Go to <a href="#selected-value-attribute">Selected Value Attribute</a> to select a query variable to store in the Selected Value View State Parameter.

### Selected Value Attribute

This comes from the Data Source and is the variable paired with the <a href="#selected-value">selected value</a> [view state parameter](introduction#view-state-parameters). 

![Screenshot](img/selectedvalueattributehtmlight.jpg)

!!! Warning "When mapping _Selected Values_ to _Selected Value Attribute_, ensure the _Data Type_ of the View State Parameter matches the _Data Type_ of the <a href="#data-source">Data Source</a>; e.g. integer for numbered data."

## X

![Screenshot](img/3dchartsxmenu.jpg)

Configure data for X-axis

**Data Description**

Select which <a href="#data-source">data source</a> variable will be used to plot against the X-Axis

**Label** 
 
Select descriptive label for X-Axis

**Format**

![Screenshot](img/3daxisformat.jpg)

From dropdown menu, select the numeric or date format to use

**Set Min Axis Value**

Check control to use *AxisMin*

**AxisMin**

Sets minimum X-axis value when *Set Min Axis Value* is checked

Ensure _Set Min Axis Value_ is enabled for the chart to use _AxisMin_

**Set Max Axis Value**

Check control to use **AxisMax**

**AxisMax**

Sets maximum X-axis value when **Set Max Axis Value** is checked

Ensure _Set Max Axis Value_ is enabled for chart to use _AxisMax_

## Y

Configure data for Y-axis

**Data Description**

Select which <a href="#data-source">data source</a> variable will be used to plot against the Y-Axis

**Label** 
 
Select descriptive label for Y-Axis

**Format**

From dropdown menu, select the numeric or date format to use

**Set Min Axis Value**

Check control to use _AxisMin_

**AxisMin**

Sets minimum X-axis value when _Set Min Axis Value_ is checked

Ensure _Set Min Axis Value_ is checked for chart to use _AxisMin_

**Set Max Axis Value**

Check control to use *AxisMax*

**AxisMax**

Sets maximum X-axis value when *Set Max Axis Value* is checked

Ensure _Set Max Axis Value_ is enabled for chart to use _AxisMax_

## Z

Configure data for Z-axis

**Data Description**

Select which <a href="#data-source">data source</a> variable will be used to plot against the Z-Axis

**Label** 
 
Select descriptive label for Z-Axis

**Format**

From dropdown menu, select the numeric or date format to use

**Set Min Axis Value**

Check control to use _AxisMin_

**AxisMin**

Sets minimum X-axis value when _Set Min Axis Value_ is checked

Ensure _Set Min Axis Value_ is enabled for chart to use _AxisMin_

**Set Max Axis Value**

Check control to use _AxisMax_

**AxisMax**

Sets maximum X-axis value when _Set Max Axis Value_ is checked

Ensure _Set Max Axis Value_ is enabled for chart to use _AxisMax_

## Volume

![Screenshot](img/3dvolume.jpg)

From the <a href="#data-source">data source</a> select the variable to use for plot size.

## Position

Set 3D Position

![Screenshot](img/positionmenu.jpg)

Adjust sliders to orientate the orientation of the 3D Chart

!!! Tip "Alternatively, go into Preview mode and rotate the 3D Chart. Use the mouse scroll wheel to zoom in and out."

## Style

### Advanced CSS

Configure chart css

![Screenshot](img/advancedcss3dcharts.jpg)

### Custom Tooltip

Set rollover tooltip information

![Screenshot](img/3dcharttooltip.jpg)

## Format

![Screenshot](img/3dchartformat.jpg)

See [Format](introduction#format) in Introduction for more.

## Margins

See [Margins](introduction#margins) in Introduction for more