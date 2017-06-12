## Basics

Covers the data source and end-user controls for the Data Grid, including search, filtering, edit cells, insert and delete rows, grouping and custom column display. Users can also select by which column to autosort on dashboard load, and the direction of the sort order

![Screenshot](img/datagridbasics.jpg)

### Data Source

Data Source Example

![Screenshot](img/datasourcecolumns.jpg)

Defines the source data to display in the Data Grid. See [Defining a Query](introduction.md#defining-a-query) and [Analytics](introduction.md#analytics) for more on data sourcing.

### Filtering

Three types of filtering are available:

*Quick Search*

![Screenshot](img/gridquicksearch.jpg)

*Column Filters*

![Screenshot](img/columnfilters.jpg)

*Disabled:* No filters

### Show Paging Control

Toggle display of pagination controls. Used for large data sets.

![Screenshot](img/pagingcontrol.jpg)

### Enable Grouping

Users can group data together. Subtotals can be applied with [Summary Row For Groupings](datagrid.md#summary-row-for-groupings)

### Auto Collapse Grouping

On loading of dashboard, groupings will be in collapsed form. Grid groupings are configured in [Grouping Columns](datagrid.md#grouping-columns)

### Keep NonExistent Columns

Use of NonExistent Columns is best employed when working with a large number of queries. This could be during the design process where a dashboard builder can retain column configurations from copied data grids using different queries.

Dynamic queries which have don't have fixed column definitions can check the Keep NonExistent Columns to retain configuration options; e.g. column formatting. In this scenario, the "*" would be used in the Data Field Name      

### Custom Layout

User Configuration menu

![Screenshot](img/userconfiguration.jpg)

<aside class="warning">
User configuration will pick up all available columns from the query.
Users can drag-into the available area, columns from source data; these will be removed from display.
Reset reverts to default data view
This functionality is available to users of all permission types
</aside>

When checked, a Configuration menu will appear in the Data Grid. 

![Screenshot](img/configuration.jpg)

Users can change the display of columns in the Data Grid
  
<aside class="warning">'Hidden' columns will in the "Available Columns" list. This may not be desirable if a hidden column is used to store a calculation or is used for a highlight rule opertor not for display to the User. For these Data Grids it may be necessary to disable Custom Layout.</aside>

<aside class="warning">The user configuration on exiting the dashboard should be retained on next login</aside>


### Enable Edit Mode

Enable Edit Mode
  
![Screenshot](img/editcell.jpg)

Used in conjunction with <a href="#update-query">**Update Query**</a>. 

![Screenshot](img/checkedit.jpg) 

![Screenshot](img/sampleadd.jpg) 

![Screenshot](img/updateedit.jpg)

<aside class="warning">
In Preview mode, click "Edit" to enable. Remember to Submit Changes when done. Cancel to reject changes 
</aside>

### Enable Insert/Delete

Enable Insert/Delete
  
![Screenshot](img/addnewrow.jpg)

Used in conjunction with <a href="#update-query">**Update Query**</a>.

![Screenshot](img/checkinsert.jpg)

![Screenshot](img/sampleupdate.jpg) 

![Screenshot](img/updateedit.jpg)

<aside class="warning">
In Preview mode, click "Edit" to enable. Remember to Submit Changes when done. Cancel to reject changes  
</aside>

## Columns

Defines how data is formatted in each column. 

Data Grid Columns

![Screenshot](img/datagridcolumn.jpg)
  
In addition to individual column configurations, global settings can be defined from Column Edit.
  
![Screenshot](img/globalconfigure.jpg)
  
Select columns on the left using CTRL + column click, next select properties on the right to be applied across selected columns.
  
![Screenshot](img/multicolumn.jpg)
  
Columns can be removed from a Data Grid on clicking the trashcan icon
  
![Screenshot](img/deletecolumn.jpg)

**User Defined**

When checked, the selected column will remain in the Data Grid if the selected column variable is removed from the query. A User Defined query is effectively a 'lock' on the column

<aside class="warning">
If the User Defined column variable is missing in the query, the User Defined column will show as an empty column in the Data Grid
</aside>

**Data Field Name**

Data Field Name

![Screenshot](img/datafieldname.jpg)

<aside class="warning">
 When using a wildcard, all dynamic columns derived from a query will use the wildcard column format
The wildcard can be used in conjunction with text headers; e.g. bid* for bid, and bid_update
</aside>
  
The Data Field Name is selected from data columns in the Data Source query. 

Additional columns can be added, including wildcard columns. If wildcard is used, any non-defined columns will adopt the column specifications of the wildcard column; e.g. data alignment, decimal precision etc.

![Screenshot](img/newcolumnadd.jpg)

**Display Name**

Display Name

![Screenshot](img/displayname.jpg)

The name assigned for the column in the Data Grid. This is case sensitive.

**Width (relative)**

Relative Width
  
![Screenshot](img/relativewidthblack.jpg)

<aside class="warning">
Sample column widths set at 20,10,5,1
</aside>

Relative measure to the width of the Data Grid. The scale is contigent on the values of each column; for example, columns with a relative width of 20,10,5,1 will scale at a column width of 55% (i.e. 20/(20+10+5+1)), 28%, 14% and 3%.  

Relative columns will scale according to the browser size.

![Screenshot](img/whiterelativewidth.jpg)

**Minimum Width (pixels)**

This is the pixel minimum width for a column. Columns will never be smaller than the minimum width, but can be wider. 

Columns using minimum width will scale according to browser size

**Text Align**

Alignment of values inside Data Grid. 

![Screenshot](img/textalign.jpg)

**Sortable**

Sorting Columns

![Screenshot](img/columnsort.jpg)

When checked, users clicking on column header will toggle between ascending and descending sort. 

**Format**

Sample formats
  
![Screenshot](img/sampleformats.jpg)
  
<aside class="warning">
General, DateTime, General, Formatted Number, Formatted Number, Formatted Number, Formatted Number, DateTime, General, Smart Number
</aside>
  
Select formatting for data type in column
  
![Screenshot](img/formatdropdown.jpg)

**Precision**

Where numeric data is used, Precision sets the number of decimal places used.

**Hide Trailing Zeroes**

Removes the display of zeroes from end digits after the decimal point.

![Screenshot](img/beforeprecision.jpg)

![Screenshot](img/afterprecision.jpg)

**Currency Symbol**
 
Currencies

![Screenshot](img/currencysymbol.jpg)
 
Adds a currency symbol prefix to column data
  
![Screenshot](img/currencyselect.jpg)

**Date Format**

Combination Date and Time Format
  
![Screenshot](img/comboformat.jpg)
  
![Screenshot](img/timecolumn.jpg)
  
Select date format

![Screenshot](img/dateformat.jpg)
  
<aside class="warning">
Ensure Date or DataTime Format is selected
</aside>
  
**Time Format**
  
Select time format
  
![Screenshot](img/timeformat.jpg)
  
<aside class="warning">
Ensure Time or DataTime Format is selected
</aside>

**Min Value Color**
  
Min Value Color

![Screenshot](img/minvaluecolor.jpg)
  
Selection will place a color border highlight around lowest value in column
  
![Screenshot](img/minvalueselect.jpg)

To Remove, again click on the color and select *No Color* from the palette tool.

![Screenshot](img/nocolorhtmlight.jpg)

<aside class="warning">Min Color can be a viewstate parameter. To assign a viewstate parameter, rollover end of input bar until ![Screenshot](img/eyeiconhtmllight.jpg) appears, click to assign</aside>
  
**Max Value Color**

Max Value Color

![Screenshot](img/maxvaluecolor.jpg)
  
Selection will place a color border highlight around highest value in column
  
![Screenshot](img/maxvalueselect.jpg)

Click the color bar again and then click *No Color* to remove the Max color setting 

<aside class="warning">Max Color can be a viewstate parameter. To assign a viewstate parameter, rollover end of input bar until ![Screenshot](img/eyeiconhtmllight.jpg) appears, click to assign</aside>

**Range Color**

Range Color

![Screenshot](img/rangecolor.jpg)
  
Applies a selected colour gradient across all cells in a column. Assigning a color will automatically apply the Range Color. 
  
![Screenshot](img/rangeselect.jpg)

Click the color bar and then *No Color* to remove the Range color from column data

<aside class="warning">Range Color can be a viewstate parameter. To assign a viewstate parameter, rollover end of input bar until ![Screenshot](img/eyeiconhtmllight.jpg) appears, click to assign</aside>

**Percentage Color**

Percentage Color

![Screenshot](img/percentagehighlight.jpg)

Adds a mini-bar in Percentage formatted data. The proportion of the bar filled runs from 0 to 100%

To enable set Format to *Percentage* 

![Screenshot](img/percentageselecthtmllight.jpg)

Select a colour to use for the bar 

![Screenshot](img/percentcolorselecthtmllight.jpg)

<aside class="warning">Percentage Color can be a viewstate parameter. To assign a viewstate parameter, rollover end of input bar until ![Screenshot](img/eyeiconhtmllight.jpg) appears, click to assign</aside>

**Read Only**

Columns which are checked Read Only cannot be edited

**Template**

Template Help 

![Screenshot](img/templatehelp.jpg)

Template allows for richer customisation of columns. In this example, information from two columns ('URL' and 'Name') is merged together to form an active link:

![Screenshot](img/templateexamplehtmllight.jpg)

![Screenshot](img/templatemeldhtmllight.jpg)

## Selection and Routing

![Screenshot](img/selectionrouting.jpg)

When enabled, a user selecting a data grid row will have data grid variables asigned to [view state parameters](introduction.md#view-state-parameters). In the example below, *rowID* from a Data Grid has been mapped to a *rowid* view state parameter. 

![Screenshot](img/enablerow.jpg)

To start, *Enable Row Selection* must be checked.

![Screenshot](img/enablerowselectionhtmllight.jpg)

If just a single value is to be stored, the *Selected Column* and *Selected Value* can be used. If more than one value is to be stored, then <a href="#selected-row-viewstate-routing">Selected Row Viewstate Routing</a> must be used. 

[1] Select the Column of the data you wish to store

![Screenshot](img/selectedcolumnhtmllight.jpg)

[2] Assign a viewstate parameter which will receive and store the selected cell value

![Screenshot](img/selectedvaluehtmllight.jpg)

<aside class="warning">If more than one value from a grid is to be stored, use Selected Row Viewstate Routing</aside>

### Selected Row Viewstate Routing

Where *Selected Column* and *Selected Value* stores just a single value, *Selected Row Viewstate Routing* can store multiple values

Click ![Screenshot](img/addroutinghtmllight.jpg) to set storage for additional values

![Screenshot](img/selectedrowviewstateroutinghtmllight.jpg)

Add a row for each Data Grid variable to store to a view state parameter. 

**Follow Selected Value**

When checked, row selection highlight will retain view on screen during scroll event. 

**Default Fallback on Deselect**

When checked, default viewstate parameter values will be used (if set) in the absence of a row select.

## File Export

![Screenshot](img/fileexport.jpg)

Data from a data grid can be exported to a spreadsheet using the CSV downloader

![Screenshot](img/gridcsvdownloadhtmllight.jpg)

The filename can be specified, or linked to a view state parameter which can then be defined by the user

![Screenshot](img/fileexporthtmllight.jpg)

## Grouping Columns

On loading, Data Grids can be configured into groups. Subtotals can be added with <a href="#summary-row-for-groupings">Summary Row For Groupings</a>

Click on ![Screenshot](img/addgroupingcolumn.jpg) to add a Grouping

![Screenshot](img/groupingcolumns.jpg)

Each additional Grouping level will create subgroups derived from the previous grouping; i.e. the top Grouping is processed before subsequent groups are created. Groupings can be re-organised using a left-click-and-drag. 
 
![Screenshot](img/autocollapse.jpg)

Dashboard Users can also create groupings on the fly with a left-click-and-drag of a column header into the space directly above the column headers: 

![Screenshot](img/enablegroup.jpg)

## Highlight Rules

Used to apply color updates to notify users of changes in Data Grid values

![Screenshot](img/highlightrule.jpg)

**Name**

The name of the rule

**Target**

From the dropdown menu, select the target Data Grid column on which the rule will act 

<aside class="warning">The Target column can be any column in the Data Grid.  It does not have to be the data grid column which is using the operator</aside>

**Condition Source**

The data series on which the trigger is measured

**Condition Operator**

Dropdown menu of rule operations, including greater and less than, not equal to, exactly equal to, and text contains alerts

**Condition Value**

What value threshold will trigger the alert.  Default is *previous value*

**Color**

The text color change when rule is true

**Backround Color**

Background cell color change when rule is true. 

**Border Color**

Cell border color change when rule is true

**Icon**

Select an icon to appear when rule is true

**Icon Color**

Select the color for the icon (if used) when rule is true

![Screenshot](img/samplehighlightrules.jpg)

## Style

![Screenshot](img/datagridstylemenu.jpg)

**Row Height**

![Screenshot](img/rowheight.jpg)

Defines the height of the Data Grid table rows

**Even & Odd Row Background**

Defines the colour of the even and odd data grid rows. Colors can be selected from the color palette, a view state parameter (of a hex color reference) or a direct hex color reference. 

**Selected Row Background**

If <a href="#selected-row-viewstate-routing">selected view state routing</a> is enabled, then this color will define the background for the selection row. 

**Header Text Transformation**

Sets the text type for Data Grid column header names

**Header Font Weight**

Sets the font type for Data Grid column header names

**Font Family**

Sets the font family for Data Grid column header names

**Font size**

Sets the font size for Data Grid column header names

### Advanced CSS

Used to apply CSS to Data Grid.

[1] Left-click inside the Advanced CSS editor

![Screenshot](img/leftclickcss.jpg)

[2] Click on the ![Screenshot](img/selectoricon.jpg) in the pop-up dialog

![Screenshot](img/advancedcssselect.jpg)

[3] Click on an Data Grid element to view the CSS reference

![Screenshot](img/cssselect.jpg)

[4] Add the required CSS

![Screenshot](img/appliedcss.jpg)

[5] Click [Apply]

![Screenshot](img/appliedcssheader.jpg)

## Summary Row for Groupings

Column Grouping will reorganise the Data Grid layout. Summary Row for Groupings will add simple mathematical calculations to these groups.

Click on ![Screenshot](img/addsummarybutton.jpg) to add a new summary row. 

![Screenshot](img/summaryrowforgroupings.jpg)

**Column**

This is the data grid column on which the calculations will be made

**Aggregate Function**

The mathematical funtion to apply: average, sum, min or max

**Label**

The text label to use for the calculation

**Color**

The font color for the grouping

<aside class="warning">
Default color is none, so unless a color is selected the grouping calculation will appear 'invisible'
</aside>

![Screenshot](img/summaryrowgrouping.jpg)

## Margins

See [Margins](introduction.md#margins) in Introduction for more

## Format

See [Format](introduction.md#format) in Introduction for more