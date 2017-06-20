![Screenshot](img/rangesliderhtmllight.jpg)

The Range Slider plays a similar function to the <a href="#Breadcrumbs">Breadcrumbs</a> component.  It supports zoom-in navigation for linked charts using sequential x-axis data (e.g. time)

## Basics

![Screenshot](img/rangeslidermenu.jpg) 

### Data Source

See [Defining a Query](introduction/#defining-a-query) and [Analytics](introduction/#analytics) for more on data sourcing.

### Focus

Used for [linking components](introduction/#linking-components). Requires a [view state parameter](introduction/#view-state-parameters).

### Range

Range Slider interaction

![Screenshot](img/rangesliderinteraction.jpg)

Used to link **Range Slider** components to other components with the **Range** Basics property.

[1] Create and assign a <a href="#view-state-parameters">View State Parameter</a>

![Screenshot](img/rangesliderviewstate.jpg)

[2] Share the **View State Parameter** and **Data Source** for components to be linked; e.g. a chart.

![Screenshot](img/rangesliderlinkhtmllight.jpg)

[3] Go to Quickview/Preview to interact with chart

**Selected Value**

Set a [view state parameter](introduction/#view-state-parameters) to store the value selected in the Range Slider.

**Selected Min Value**

Set a [view state parameter](introduction/#view-state-parameters) to store the minimum value of the selected range.

**Selected Max Value**

Set a [view state parameter](introduction/#view-state-parameters) to store the maximum value of the selected range.

## X Axis

![Screenshot](img/xaxisrangeslidermenu.jpg)

Configures Range Slider X-Axis

**Axis Value**

Sets which query column variable will be used as the x-axis chart label

![Screenshot](img/selectvariablehtmllight.jpg)

**Axis Type**

Sets the data type for the label used for X-Axis Value

![Screenshot](img/xaxistypehtmllight.jpg)

<aside class="admonition caution">If x-axis labels look incorrect, try selecting a different <a href="#type">Type</a></aside>

**Axis Format**

Used for when <a href="#axis-type">X-Axis Type</a> is of type <i>Date</i>.

![Screenshot](img/xaxisformatdatehtmllight.jpg)

**Axis Scale**

![Screenshot](img/axisscale.jpg)

Select no scaling, or use numberic/time scaling depending on selected axis type. 

**Legend Label Tag**

Coming soon

**Use Fixed Num of Ticks**

Toggles control to use **Num of Ticks**

**Show All Ticks**

Displays every charted data point in the x-axis

**Num of Ticks**

The number of ticks to display in the x-axis if **Use Fixed Num of Ticks** is checked

**Axis Rotation**

Rotate x-axis label

![Screenshot](img/xaxislabelrotation.jpg)

## Y-axis

![Screenshot](img/yaxisrangeslider.jpg)

Adds <a href="#data-source">data source</a> variables to Range Slider

**Column**

Dropdown select of <a href="#data-source">data source</a> variable to plot.

To add a new data column, click ![Screenshot](img/columnbuttonhtmllight.jpg)

**Color**

Color Palette

![Screenshot](img/colorpalettemenu.jpg)

Use the colour palette to select bubble color

**Display Name**

The Legend name for the selected data source

## Style

![Screenshot](img/stylerangeslider.jpg)

### ChartBarColors

Selects <i>Range Slider</i> line colors when a [pivot query](introduction/#pivot-query) is used. For non-Pivot data, select line color from the **Y-axis Columns** control.

To add a color, click ![Screenshot](img/barcolorhtmllight.jpg)

![Screenshot](img/chartbarcolorshtmllight.jpg)

### Advanced CSS

Select to add CSS elements to Line of Range Slider chart

![Screenshot](img/rangeslidercss.jpg)

## Format

![Screenshot](img/formatrangeslider.jpg)

See [Format](introduction/#format) in Introduction for more on shared formatting options. 

**Y-axis Format**

Dropdown to select number of decimal places to use for Y-axis

[1] 4 Decimal places
[2] 3 Decimal places
[3] 2 Decimal places
[4] 1 Decimal place
[5] Smart Number
[6] No decimal place

**Component Shadow**

Applies shadow to component.

**Fill Color**

![Screenshot](img/samplefillcolor.jpg)

![Screenshot](img/rangesliderfill.jpg)

Define background fill color during range select.

**Fill Opacity**

Set opacity of the overlay fill color to the underlying data plotted in the Range Slider.

**Fill Color (Inverse)**

Set fill color inside selected range.

**Fill Opacity (Inverse)**

Set fill opacity inside selected range.

**Resize Stroke Color**

Set color of selected range border

**Resize Icon Color**

Set color of range slider drag bar. 

## Margins

See [Margins](introduction/#margins) in Introduction for more