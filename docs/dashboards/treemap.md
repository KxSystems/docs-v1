![Screenshot](img/heatmaphtmllight.jpg)

[Tree Map](https://en.wikipedia.org/wiki/Treemapping), best used in conjunction with [Pivot Queries](introduction/#pivot-query)

## Basics

![Screenshot](img/treemapmenu.jpg)

_Data Source_
: <i class="fa fa-hand-o-right"></i> [Defining a Query](introduction/#defining-a-query) and [Analytics](introduction/#analytics)

_Focus_
: Used for [linking components](introduction/#linking-components)


### Node sizes, colors and labels

![Screenshot](img/nodelabelshtmllight.jpg)

_Node Size Metric_
: A _Data Source_ column: determines the size of the nodes

_Node Color Metric_
: A _DataSource_ column: determines the color range. (Can be the same as _Node Size Metric_.)  
<i class="fa fa-hand-o-right"></i> [Style](#style) for colour options

_Node Label_
: A _DataSource_ column: the descriptive labels for the nodes


### View State Parameters

[View State Parameters](introduction/#view-state-parameters) can be paired to _Data Source_ columns. 

Define a single pair with _Selected Value_ (a View State Parameter) and _Selected Value Attribute_. 

For more pairs, use the _Selected Row Viewstate Routing_ table.


## Style

<i class="fa fa-hand-o-right"></i> [Style](style) for common styling parameters

![Screenshot](img/heatmapstyle.jpg)


_Color Scheme_
: ![Screenshot](img/colorscalehtmllight.jpg)  
_<small>Various color schemes</small>_

_ColorScale_
: Individual colors of the current scheme. Can also be configured to use Hex colors.

Text color
: When _Color Text Override_ is checked, _Text Color_ is applied

    ![Screenshot](img/heatmaptextcolor.jpg)  
    _<small>A heat map with white text</small>_


_Min Text Display_
: Minimum node size: adjust to ensure all node labels are visible

_Label Size_
: Text size for node labels 


_Custom Tooltip_
: ![Screenshot](img/customtooltiphtmllight3.jpg)
_<small>Tooltip definition and effect</small>_

    <i class="fa fa-hand-o-right"></i> [Custom tooltip](style/#custom-tooltip) in Style

_Hide Tooltips_
: When checked, disables tooltip


## Format

<!-- ![Screenshot](img/mapformat.jpg)
 -->
<i class="fa fa-hand-o-right"></i> [Format](style/#format) in Style


_Metric Format_
: Decimal display for the Heat Map variable control


_Label Format_
: Sets the format of the cell label used by the Heat Map


## Margins

<i class="fa fa-hand-o-right"></i> [Margins](style/#margins) in Style

