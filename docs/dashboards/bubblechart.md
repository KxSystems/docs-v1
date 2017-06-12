![Screenshot](img/bubblecharthtmllight.jpg)

## Basics

![Screenshot](img/bubblechartmenu.jpg)

### Data Source

See [Defining a Query](introduction.md#defining-a-query) and [Analytics](introduction.md#analytics) for more on data sourcing.

### Focus

Used for [linking components](introduction.md#linking-components). Requires a [view state parameter](introduction.md#view-state-parameters).

### Range

Used for linking to a [range slider](rangeslider.md). Requires a [view state parameter](introduction.md#view-state-parameters).

### Selected Value 

Used to map a chart (query) data point to a [view state parameter](introduction.md#view-state-parameters) when a chart bar is clicked by the user. 

[1] Create a [view state parameter](introduction.md#view-state-parameters) and assign to <i>Selected Value</i>
 
![Screenshot](img/selectedvaluecharthtmllight.jpg)

[2] Go to <a href="#selected-value-attribute">Selected Value Attribute</a> to select a query variable to store in the Selected Value View State Parameter.

### Selected Value Attribute

This comes from the Data Source and is the variable paired with the <a href="#selected-value">selected value</a> [view state parameter](introduction.md#view-state-parameters). 

![Screenshot](img/selectedvalueattributehtmlight.jpg)

<aside class="warning">When mapping <i>Selected Values</i> to <i>Selected Value Attribute</i>, ensure the <i>Data Type</i> of the View State Parameter matches the <i>Data Type</i> of the <a href="#data-source">Data Source</a>; e.g. integer for numbered data </aside>

### Selected Row ViewState Routing

The aforementioned <a href="#selected-value">Selected Value</a> and <a href="#selected-value-attribute">Selected Value Attribute</a> handles a single data map. <a href="#selected-row-viewstate-routing">Selected Row Viewstate Routing</a> supports multiple mappings between <a href="#selected-value">Selected Values</a> and <a href="#selected-value-attribute">Selected Value Attributes</a>.

![Screenshot](img/selectedviewstateroutingwhitehtml.jpg)

To add a row, click ![Screenshot](img/routinghtmllight.jpg)

## X Axis

![Screenshot](img/bubblechartxaxis.jpg)
  
**Axis Value**

Sets which query column variable will be used as the x-axis chart label

![Screenshot](img/selectvariablehtmllight.jpg)

**Axis Type**

Sets the data type for the label used for X-Axis Value

![Screenshot](img/xaxistypehtmllight.jpg)

<aside class="warning">If x-axis labels look incorrect, try selecting a different <a href="#type">Type</a></aside>

**Axis Format**

Used for when <a href="#axis-type">X-Axis Type</a> is of type <i>Date</i>.

![Screenshot](img/xaxisformatdatehtmllight.jpg)

**Axis Scale**

![Screenshot](img/axisscale.jpg)

Select no scaling, or use numberic/time scaling depending on selected axis type. 

**Legend Label Tag**

Coming Soon

**Stack**

Overlays data on existing plot.  Data from <a href="#data-source">data source</a> from dropdown

For example, displaying bid price on top of bid plotted bubbles. 

![Screenshot](img/bubblechartstack.jpg) 

**Fixed Columns**

Check to toggle chart between standard chart scale and fixed (transposed) chart view.  

**Show legend**

Toggles display of chart legend

![Screenshot](img/charthtmllegendhtmllight.jpg)

**Show new Time Period**

Ensures the latest data point of a time sequence is displayed

![Screenshot](img/shownewtimeperiodhtmllight.jpg)

**Use Fixed Num of Ticks**

Toggles control to use **Num of Ticks**

![Screenshot](img/multichartnumofticks.jpg)

**Show All Ticks**

Displays every charted data point in the x-axis

**Num of Ticks**

The number of ticks to display in the x-axis.

<aside class="warning">Requires a check for <a href="#use-fixed-num-of-ticks">Use fixed num of ticks</a> to enable</aside>

**Axis Rotation**

Rotate x-axis label

![Screenshot](img/xaxislabelrotation.jpg)

## Columns

![Screenshot](img/bubblecolumnsmenu.jpg)

To refresh the chart to its default (prior saved) state, click the refresh button

![Screenshot](img/columnresethtmllight.jpg)

To add a column, click ![Screenshot](img/addcolumnbutton.jpg)

**User Defined**

Check to make the column 'read only'.

**Column**

Select the <a href="#data-source">data source</a> variable to plot

**Color**

Select a Line color from the color palette

**Display Name**

Create a display name to use in the chart Legend key 

## Zoom/Pan 

![Screenshot](img/zoomandpanmenu.jpg)

**Pan On**

Check control to switch Zoom and Pan functionality on

![Screenshot](img/panzoom.jpg)

![Screenshot](img/panzoom2.jpg)

**Type**

Select between drag-to-select <i>Zoom</i>, or <i>Pan</i> control

**Zoom Select Color, Opacity and Border**

Selects the background color, background color opacity and the border for the selected area. 

**Min and Max Zoom**

![Screenshot](img/minmaxzoom.jpg)

Set [view state parameter](introduction.md#view-state-parameters) for to store the range value for <b>Min and Max Zoom</b>

**Mouse Pan**

Check to select mouse pan control; best used on real-time time series data 

**Mouse Pan Interval and Type**

Set time pan control for chart; chart will move in timed sections.

![Screenshot](img/mousepaninterval.jpg)

## Highlight Rules

![Screenshot](img/highlightrulebar.jpg)

Used to color code bar charts. Best used with real-time streaming or polling data. 

Click on ![Screenshot](img/addrulebutton.jpg) to include additional highlight rules.

**Condition Source**

The dependent variable from the <a href="#data-soruce">data source</a> defining the trigger.

**Condition Operator**

Dropdown menu of rule operations, including greater and less than, not equal to, exactly equal to, and text contains alerts

**Condition Value**

What value threshold will trigger the alert. Typically, this is "previous value" but can be numeric or text (depending on the source data)

**Color**

What color the bar will be when the highlight rule is true. 

## Style

OLAP Bar Color

![Screenshot](img/stylemenubar.jpg)

### ChartBarColors

Sets bars color and order for Pivot/OLAP chart. 

Colors can be set using Hex reference or by clicking on the color bar and selecting from the pop-up palette. 

### Advanced CSS

Left click inside the Advanced CSS editor. Click the selector icon, then left-click inside the chart component to bring up the relevant CSS code. Add changes to your css as required. 

![Screenshot](img/advancedcssmulticharthtmllight.jpg)

### Custom Tooltip

Step 1: Create View States for items in tooltip

![Screenshot](img/multicharttooltip.jpg)

Step 2: Add a html tag for View States (using handlebars)

![Screenshot](img/configuretooltip.jpg)

Step 3: Chartview

![Screenshot](img/chartviewtooltip.jpg)

Tooltips can use View State Parameters which have been mapped to Data Source variables

![Screenshot](img/parametermaphtmllight.jpg)

In the Configure Tooltip template, add html tags for the View State Parameters to display (using handlebars) 

If viewstate parameter = *param1*

Add a table cell with *param1* viewstate to tooltip with the tag:  <td>{{obj.param1}}</td>

![Screenshot](img/tooltiphtmllight.jpg)

Tool tip will appear as: 

![Screenshot](img/tooltipchart.jpg)

**Tooltip Top distance**

Sets distance from mouse in pixels at which tooltip appears

### Tooltip Helper

Tooltip Helper

![Screenshot](img/tooltiphelper.jpg)

Apply Tooltip Helper Variable to Tooltip reference

![Screenshot](img/addhelpertooltip.jpg)

Tooltips use <a href="http://handlebarsjs.com/">Handlebars.js</a> so variables can be added dynamically to tooltip.

For example:
 
```
{{fx}} : {{volume}}
```

could appear as
EUR/USD: 250000

To format "250000" so it will appear as "$250,000" use Tooltip Helper

**Name**

Give the function a name.  This name will be used inside the tooltip.

For example:

![Screenshot](img/helpername.jpg)

```
{{fx}} : {{fd volume}}
```

**Regex**

The regular expression used to find the required pattern

In this example:

```
(\d{3})(?=\d)
```

**Value**

The value to replace the text with. In this case, comma-delimited currency values: 

```
$1,
```

## Format

![Screenshot](img/bubbleformat.jpg)

Formatting of Component Titles and Component Borders can be found in the introductory section of <a href="#dashboards-for-kx">Dashboards for Kx</a>

See [Format](introduction.md#format) in Introduction for more on shared formatting options. Additional formatting specific to bar charts is detailed below

**Y-Axis Format**

Configures the number of decimal places used in a numeric X-Axis.

![Screenshot](img/xaxisformathtmllight.jpg)

![Screenshot](img/chartxaxishtmllight.jpg)

**Component Shadow**

Not used

**Volume**

Sets bubble size to a <a href="#data-source">data source</a> variable; in the below example bid price is charted against the y-axis and bid volume is bubble size:

![Screenshot](img/bidvolumebubble.jpg)

Use <b>Min Bubble Size</b> and <b>Bubble Scale</b> sliders to set the baseline bubble size

**Shape**

Dropdown menu of different bubble chart types

![Screenshot](img/bubbleshapehtmllight.jpg)

**Y-axis Force Min**

The default chart best-fits data to the axis to maximise visual differnces. It sets the lowest value in your data to the baseline. 

![Screenshot](img/yaxisminmaxhtmllight.jpg)

![Screenshot](img/yaxismincharthtmlight.jpg)

Checking *Y-axis Force Min* will set the Y-axis to use the value entered <a href="#y-axis-min">Y-Axis Min</a>.

**Y-axis Force Max**

As with <a href="#y-axis-force-min">Y-axis Force Min</a> will set y-axis maximum to use <a href="y-axis-max">Y-Axis Max</a> value. 

<aside class="warning">Using <i>Y-axis Force Max</i> may crop chart if y-axis values exceed <i>Y-Axis max</i></aside>

**Y-axis Min**

The defined value will be used if <a href="#y-axis-force-min">Y-axis Force Min</a> is checked.

**Y-axis Max**

The defined value will be used if <a href="#y-axis-force-max">Y-Axis Force Max</a> is checked.

<aside class="warning">Use Y-axis Max to standardize the appearance of neighboring chart components where relative comparisons are important</aside>

**Y-Axis Ticks (best fit)**

Chart will best fit number of displayed y-axis ticks to value set

![Screenshot](img/yaxisticks.jpg)

**X/Y Axis Labels**
  
Adds text labels for x- and y-axis

![Screenshot](img/axislablehtmllight.jpg)

![Screenshot](img/axischartlabelhtmllight.jpg)

**X-Axis Size**

Sets the distance between the X-axis and the border of the component. 

![Screenshot](img/xaixssizehtmllight.jpg)

![Screenshot](img/xaxissizecharthtmllight.jpg)

Distance between x-axis and line chart

**Min Bubble Size**

Slider control to define how big the smallest bubble will be. Minimum bubble size is independent of relative difference as measured by **Bubble Scale**

**Bubble Scale**

Slider control to define the scale of the relative change between bubbles as set by the <b>Volume</b> variable. The further right the slider, the bigger the relative difference between bubbles.  

<aside class="warning">Dependent on <a href="#data-source">data source</a> variable selected for <b>Volume</b></aside> 

**Show X-axis Min/Max**

Display in the x-axis the min/max values.

![Screenshot](img/showxaxisminmaxhtmllight.jpg)

![Screenshot](img/showxaxisminmaxcharthtmllight.jpg)

**Show Y-axis Min/Max**
 
Display in the y-axis the min/max values.

![Screenshot](img/showyaxisminmaxhtmllight.jpg)

![Screenshot](img/showyaxisminmaxcharthtmllight.jpg)

<aside class="warning">If Y-axis min/max values are used, these will be displayed</aside>

**X/Y Axis Tick Padding**

![Screenshot](img/charttickpadding.jpg)

Defines spacing between x- and y-axis labels to chart x- and y-axis.

![Screenshot](img/axistickpaddinghtmllight.jpg)

**Left/Right Y-Axis Margin**

Distance between Y-Axis and chart component edge

**Y-axis min/max range scale**

Defines the range between min and max values of y-axis

![Screenshot](img/yaxisminmaxrangehtmllight.jpg)

![Screenshot](img/yaxisminmaxrangescalehtmllight.jpg)

<aside class="warning">If defined range is greater than data range a negative y-axis will be applied</aside>

**Dynamic Columns in Pivot**

Marks if dynamic colums are used for a [pivot query](introduction.md#pivot-query)

**Show X- Y-Axis Ticks**

Toggles the display of chart tick labels

**Chart Background**

Change background color of chart

## Margins

See [Margins](introduction.md#margins) in Introduction for more
