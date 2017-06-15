# Dashboards for Kx

> Quick Introduction to Dashboards for Kx:

  > <iframe src="https://player.vimeo.com/video/135580263" width="100%" height="450" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

  Dashboards for Kx offers an easy-to-use, yet powerful drag-and-drop interface to allow Creators build dashboards without the need for programming experience. 

  Dashboards for Kx provides rich visualisation of real-time streaming data with support for highly optimized polled queries. Built in HTML using JavaScript libraries, Dashboards for Kx can be used in all modern browsers and can be used on mobile and desktop environments.

  Kx supports real-time analysis of billions of records and fact access to terabytes of historical data, offering seamless scalability. 

## First Dashboard

  > New Dashboard View:

  > <img src="images/dashboards/newdashboard.jpg">

  The Dashboard builder is comprised of a central workspace; to the left is a list of components, and to the right are the properties associated with the dashboard or selected component.

  The Administrator dropdown menu in the top right offers a Light or (default) Dark theme builder view, and the ability to set the base language for the dashboard. 

  <img src="images/dashboards/administrator.jpg">

  <aside class="notice">
  Builder theme is different to Dashboard theme. Define dashboard theme from the Style menu of Dashboards. 
  </aside>

  <aside class="notice">
  Language support is offered for English, German and Japanese.
  </aside>

### Dashboard Basics

  In Dashboard properties, give the dashboard a Name. The Link is the public link used to share the dashboard with colleagues.

  <img src="images/dashboards/dashboardname.jpg">

  <aside class="notice">
  The Link is non-editable. Clicking on the link will open the dashboard in a new browser tab
  </aside>

### Save Dashboards

  > Dashboard Manager

  > <img src="images/dashboards/manage.jpg">

  It's good basic practice to regularly save dashboard work. This can be done from the header menu.

  <img src="images/dashboards/savedashboard.jpg">

  <aside class="success">
  Dashboards can be copied with <img src="images/dashboards/copyicon.jpg">. Good for dashboards sharing data formats, sourced from different databases.
  </aside>

### Create a New Dashboard

  New dashboards can be created clicking the file <img src="images/dashboards/newicon.jpg"> icon

### Dashboard Manager: Open, View & Delete Dashboards

  Dashboards are managed, opened and viewed from the Manage menu <img src="images/dashboards/manageicon.jpg">

  Inside Dashboard Manager, select a dashboard from the list, before clicking <img src="images/dashboards/managemenu.jpg"> 

  "View on Web" shows an end-user view of your Dashboard.

## Customizing the Dashboard

  Setting the global style for your dashboard.

  > Dashboard Settings: 

  > <img src="images/dashboards/dashboardsettings.jpg">

  > Dashboard Style Example: 

  > <img src="images/dashboards/dashboardstyle.jpg">

### Dashboard Style

  If the dashboard is to have a light or dark theme it can be defined from Style property.  The Style menu is also where spacing between the components and the background color of the component is defined. 

  <aside class="warning">
  If your dashboard uses streaming, managed or polling data, uncheck <img src="images/dashboards/showloadingindicators.jpg">
  </aside>

### Dashboard Permissions

  Dashboard Users can either be Read Only Users, or have assigned Write Access permissions - enabling editing of dashboards.  The User Group list is defined in Control for Kx. 

  <img src="images/dashboards/permissions.jpg">

### Screens

  All dashboards have a main screen, but multiple screens can be added and linked using the Navigation or Button component.

  <img src="images/dashboards/addscreen.jpg">

## Creating a Connection

  > Single Connection:

  > <img src="images/dashboards/createconnection.jpg">

  > Group Connection: 

  > <img src="images/dashboards/connectiongroup.jpg">

  Connections can be created from the Dashboard console or Query Editor.

  <img src="images/dashboards/welcomedashboard.jpg">

  1. Open the Connections menu and create New Connection

  2. Give your Connection a Name

  3. Define Type

  <aside class="notice">
  Default Type: kdb
  </aside>

  4. Define Host

  5. Set Connection Port

  6. Include any User and Password information. Confirm the Password

  7. Save when complete

### Connection Groups

  Individual connections can be grouped together 

  1. Give Connection Group a Name

  2. Use CTRL + select connections in the right-hand-box list.

  3. Save Group

  All connections (single & group) will appear in a drop down list in the Data Source Editor.  See <a href="#defining-a-query">**Defining a Query**</a>

  <img src="images/dashboards/connectionlist.jpg">

## Adding Your First Component

  > Drag-and-drop components into workspace

  > <img src="images/dashboards/dragcomponent.jpg">

  > Configure component from the Property panel on the right

  > <img src="images/dashboards/componentproperty.jpg">

  Dashboards are created by bringing components from the list available on the left into the workspace.  Each component has a set of properties, configured using the menu to the right.

### Basic customisation

  1. Define Data Source by assigning a query or analytic: see <a href="#defining-a-query">**Defining a Query**</a>

  2. Set Data View.  This is how the display will be displayed in the dashboard **See relevant Data & Pivot Grid or Charting Component**

  3. Set Style and Formatting, including any Title headers. See <a href="#dashboard-components">**Dashboard Components**</a>

  <aside class="notice">
  Some Components use unique Data Sources, e.g. Report Manager or Action Tracker. See relevant component for more information. 
  </aside>

  Components sharing data sources can be linked, and queries using input variables can have values passed to them using Data Form or Drop Down component. see <a href="#linking-components">**Linking Components**</a>

  The first component for many dashboards will be either a <a href="#data-grid">**Data Grid**</a>, <a href="#pivot-grid">**Pivot Grid**</a> or <a href="#bar-chart">**Bar Chart**</a>

  <img src="images/dashboards/simpledashboard.jpg">

## Defining a Query

  > Query Editor

  > <img src="images/dashboards/querydialog.jpg">

  Queries are defined from the Basic Property panel, "Data Source". Left click inside the "Data Source" input box to open the Query Editor

  <img src="images/dashboards/datasource.jpg">

  From the Query Editor, create a 'New' Data Source

  <img src="images/dashboards/newdatasource.jpg">

  Select the Data Connection from the dropdown menu. See <a href="#creating-a-connection">**creating a connection**</a> if this hasn't be done yet. 

  <aside class="notice">
  Connections can also be created by clicking <img src="images/dashboards/createconnect.jpg">
  </aside>

  <img src="images/dashboards/selectconnection.jpg">

  In the Query editor, add the query for your data

  <img src="images/dashboards/queryeditorquery.jpg">

  <aside class="notice">
  Ensure <img src="images/dashboards/queryanalytic.jpg"> is selected
  </aside>

  <aside class="notice">
  The primary Query, Pivot Query and Update Query section of the Query Editor have drag bars (blue highlight on rollover) to increase or decrease the viewable area of each. 
  </aside>

  <img src="images/dashboards/maxrows.jpg">

  <aside class="notice">
  The default number of display rows is 100, but up to 1 million rows of data can be displayed. 
  </aside>

### Sample Query

  **Data Connection:** `html5evalcongroup`

  **Query:** `select rowID, sym, counterParty, m2mUSD_0, percentage, startDate from SampleGridData` 

  > <img src="images/dashboards/staticmanaged.jpg">
  
  ```html
  The default data setting is static, if data is sourced from a running feed then Interval (in seconds) and Key has to be defined. 

  Queried data can be Managed or Polling. 

  Managed data is a server-side poll of the database, which is then pushed to the Client. 
  Managed queries are used for repeat poll requests to limit hits to the source database. 
  Polling queries are client-based requests to the database. 
  Analytics also support Streaming data from a real-time feed

  Force reset, if checked, clears stored values on Dashboard (re)load. 
  ```

  <img src="images/dashboards/execute.jpg"> the query to populate data to a Data Grid or Chart.

  A successfully executed query will populate the Results Table.

  <img src="images/dashboards/results.jpg">

## Pivot Query

  Pivot Queries are used by the <a href="#pivot-grid">**Pivot Grid**</a> component.

  <img src="images/dashboards/pivotgrid.jpg">

  Pivot data is split between independent variables, 'Breadown Cols' and dependent variables, 'Aggregates'. 

  <img src="images/dashboards/pivotformat.jpg">

  To add a new row of 'Aggregates' click <img src="images/dashboards/plusicon.jpg">

  <aside class="notice">
  Names for 'Breakdown Cols' and 'Aggregates' are case sensitive. If an error, check column header names in source database match those used in Dashboards. 
  </aside>

  The order of the 'Breakdown Cols' can be changed using drag-and-drop, and can also be changed by the User in the dashboard. See <a href="#pivot-grid">**Pivot Grid**</a>

  <img src="images/dashboards/pivotdrag.jpg">

### Pivot Breakdown via Breadcrumbs

> Breadcrumb Breakdown

> <img src="images/dashboards/breadcrumbbreakdown.jpg">

The order of the pivot breakdown can be controlled from the  <a href="#breadcrumbs">Breadcrumbs</a> component.

[1] Create a View State Parameter and associate with the <em>Breakdown</em> property in <strong>Settings</strong>

<img src="images/dashboards/breadcrumbsbreakdownlight.jpg">

[2] In the linked Pivot Query, assign the <em>Breakdown</em> property to the <em>Breakdown Cols</em> in the Pivot Query

<img src="images/dashboards/pivotquerybreadcrumb.jpg">

The resulting output shows the breakdown elements laid out in the breadcrumb component.  These can be dragged-and-repositioned to reorder the pivot order.

<img src="images/dashboards/pivotquerybreadcrumbbreakdown.jpg">

### Column Label

  > Two-dimensional Pivot Query:

  > <img src="images/dashboards/2dpivot.jpg">

  *Column Label* is used to support 2-dimenional pivots.  An example query is given below:

  <img src="images/dashboards/2dpivot2.jpg">

  <aside class="notice">
  Navigation of a OLAP / Pivot control requires enabling Breadcrumbs in a component, or linking with <a href="#breadcrumbs">**Breadcrumb Component**</a>.
  </aside>

### Aggregate Functions: Monadic/Dyadic

 > Dyadic Analytic

 > <img src="images/dashboards/pivotanalytic.jpg">
 
 In the query editor, **select from** database source

 <img src="images/dashboards/pivotqueryhtmllight.jpg">

 **Breakdown** represents the drilldown buckets (independent variables)

 **Aggregate** (dependent variables) Monadic are sum, avg, count, min, max data functions. Dyadic example as illustrated in the VWAP example (*function:`parameter*).

### Custom Dyadic Analytics

> Custom Dyadic Analytic

> <img src="images/dashboards/enhancedpivot.jpg">
 
 A standard built-in predefined dyadic function is available. 

 Example: {[a;b] sum[a*b] % (sum[`long $ a])};`bsize


## Update Query

  > In addition to using Update Query code, Data Grid requires *Enable Edit Mode* and/or *Enable Insert/Delete* to be selected in Properties

  > <img src="images/dashboards/enableeditinsert.jpg">

  > Sample format for an Update Query

  > <img src="images/dashboards/updatequeryblack.jpg">

  > The User can *Edit* in their dashboard

  > <img src="images/dashboards/insertedit.jpg">

  > Click inside cell to edit to change or add a row, then *Submit* or *Cancel* changes. 

  > <img src="images/dashboards/submitedit.jpg">

  An Update Query allows Dashboard end-users, both Read-Only and Write permissioned, to make changes to the source database inside a Data Grid; for example, when adding a new client to a database. The Update Query requires both a query, and a settings check in Data Grid properties.

  <img src="images/dashboards/updatequery.jpg">

  <aside class="notice">
  If Update Query is enabled, all Users permissioned for that dashboard will be able to make changes. If you only want some Read-only permissioned Users to have Edit permissions, duplicate the dashboard and uncheck Enable Edit Mode and Enable Insert/Delete from Data Grid properties and permission Users who shouldn't have edit control to this duplicate dashboard.  
  </aside>

<aside class="notice">Remember to link to the **Breadcrumb** component for navigation control of the pivot</aside>

## Analytics

 > SubVWAP Analytic

 > <img src="images/dashboards/analytics.jpg">

 Analytics are predefined queries, built in Control for Kx, which can be configured and executed as data sources.

 The *subVWAP* analytic is an example of an analytic using streaming data.

 <aside class="notice">As with q queries, analytics must include a selected database from the dropdown menu</aside>

## View State Parameters

  > View State Parameter menu

  > <img src="images/dashboards/viewstatemenu.jpg">

  View State Parameters are used to store values and states. These parameters can be used to pass values between components and input values into queries. 

  The View State Menu can be accessed by clicking inside any input box showing the <img src="images/dashboards/eyeicon.jpg"> 

  Alternatively, certain inputs also support View State Parameter usage, but the icon is hidden; for certain components it's to the left of the clear button <img src="images/dashboards/clearbutton.jpg">. If a View State Parameter is supported, a rollover of the input box will display the eye icon.

  <img src="images/dashboards/viewstatehidden.jpg"> 

  With the use of View State Parameters, any selection element from the dashboard editor can be made available to the dashboard user. By pairing a View State Parameter variable to a <a href="#text-input">Text Input</a> or <a href="#drop-down-list">Drop Down List</a> component, a User can pass a value, customize a chart color, or have available more advanced filtering options. To prevent errors in the formatting of the input, it may be neccessary to include a text prompt to help the user pass a variable in the correct format. 

### View State Parameter Menu

  > Select View State Parameter to enable *Rename* and *Delete* parameter

  > <img src="images/dashboards/editviewstate.jpg"> 

  Create a New View State, and name it

  <img src="images/dashboards/viewstatenew.jpg">

  Next set the parameter Type:

  **Supported:** *boolean byte char date datetime dict double float guid int list long minute month second short string symbol time timespan timestamp*

  Set a *Default* value if required. This will automatically map to *Value*.  When a dashboard is loaded it will automatically run queries using the View State Parameter

  Finally, Select or Cancel to create.

  <img src="images/dashboards/viewstatselect.jpg">

### View State Parameters in Query Editor

  View State Parameters can also be mapped from the Query Editor. When a user-variable is added to a Query, the Query Editor will automatically identify such variables. Query variables can be mapped to View State Parameters, and used with components like <a href="#data-form">**Date Form**</a>, <a href="#drop-down">**Drop down**</a>, or <a href="#date-picker">**Date Picker**</a>

  Inside the Query Editor, map the variable to a View State Parameter. This is an automatic process on click. 

  <img src="images/dashboards/queryviewstate.jpg">

  This will update *Value* to reflect the mapped View State Parameter. In the above example, <%Query/value%>

  <img src="images/dashboards/automaticmap.jpg">

  If a manual change to a View State Parameter is required; for example, to define a Default Value or change the Type, click the highlighted eye icon

  <img src="images/dashboards/manualmap.jpg">

  <img src="images/dashboards/integermap.jpg">

  <aside class="warning">
  When defining parameter Type, do so from the View State Parameters menu, not from the Query Editor.  Changing variable Type inside the Query Editor will only change it for that query.  Also, Type defined in Query Editor will be overwritten by defined Type from the View State Parameter dialog.
  </aside>

  <aside class="notice">
  However, when testing a query execution, it can be helpful to assign a value to a query parameter before mapping a View State. This can be done through the Query Editor.
  </aside>

## Linking Components

  > Linking Components:

  > <img src="images/dashboards/componentlink.jpg">

  Components which share a Data Source can interact so that updates in one component are reflected in another.

  Linking components is done by creating a View State Property, and assiging the parameter to the *Focus* variable of **Basic** component properties. An interaction of linked components, such as between <a href="#pivot-grid">**Pivot Grid**</a>, <a href="#breadcrumbs">**Breadcrumbs**</a>, and <a href="#bar-chart">**Bar Chart**</a> can update on a single click. For example:

  <img src="images/dashboards/link1.jpg">

  on click, becomes

  <img src="images/dashboards/link2.jpg">

## Snapshot PDF view

  A screenshot of a dashboard can be taken using the PDF button: <img src="images/dashboards/pdf.jpg">

## Design

 > <img src="images/dashboards/dashboardstylemenu.jpg">

 > Thick Borders

 > <img src="images/dashboards/border90_30.jpg">

 > Thin Borders

 > <img src="images/dashboards/border15_5.jpg">

 A number of styling and formatting options are available to customize dashboards. 

 <img src="images/dashboards/sampledashboardhtmllight.jpg">

 To apply a border to all components, set *Border Size* to a value greater than 1 in the **Dashboard Style** menu

 <img src="images/dashboards/bordersizehtmllight.jpg">

 If a border is used (although not required), adding widget spacing will help apply a buffer between components.

 <img src="images/dashboards/widgetspacinghtmllight.jpg">

 Added widget spacing is the equivalent of *Outer Margin* in the Margin menu of a component

 <img src="images/dashboards/outermarginhtmllight.jpg">

 *Border Spacing* sets the spacing between the elements of the component and the border.
 
 <img src="images/dashboards/borderspacinghtmllight.jpg">

 *Border Spacing* is the the equivalent of *Inner Margin* in the Margin menu of a component

 <img src="images/dashboards/innermarginhtmllight.jpg">

 Rounding of borders is only possible if *Border Size* has a value greater than 1. Use of more rounded borders requires increased border spacing to avoiding edge cutting of the border. 
 
 <aside class="warning">
 Changes to Dashboard Styling will overwrite individual component Margin settings. When styling dashboards, ensure changes are made at the macro-dashboard level before configuring at the individual component level.
 </aside>

### Adding a Logo

 > <img src="images/dashboards/logoadd.jpg">

 To add a logo to a dashboard, use the Text Component

 [1] Drag the text component into the dashboard, then select
 
 <img src="images/dashboards/dragtextlogohtmllight.jpg">

 [2] Click inside the *Formatted Text* box of **Text Component** *Basics* property to open the Text editor

 <img src="images/dashboards/formattedtexthtmllight.jpg">

 [3] Add an Image from the menu bar. The Height and Width of the logo are configured in pixels. 

 > <img src="images/dashboards/uploadimage.jpg">

 ```html
 Set the height of the logo (in pixels): 50 is good
 Set widith if needed
 Submit to load the image
 ```

 <img src="images/dashboards/texteditorhtmllight.jpg">

  A sample height of 50 is good for a logo. The importer will rescale the logo maintaining the aspect ratio if just image height is set. 

 <img src="images/dashboards/kxlogoimage.jpg">

 <aside class="warning">Ensure your logo image uses a transparent background so it's compatible with the background of the dashboard</aside>

 <aside class="notice">Delete the default "insert text here" from the **Text Component** before adding the logo</aside>

 [4] If your logo is positioned to the left of the dashboard, change the *Horizontal* alignment to Left. Do vice versa for right-positioned logos

 <img src="images/dashboards/alignlogohtmllight.jpg">

 [5] To prevent the appearance of unncessary scroll bars around the logo on browser resize, update the *Advanced CSS* from the **Syle** menu

 <img src="images/dashboards/advancedcssleftclickhtmllight.jpg">

 Next click the CSS icon to activate the selector

 <img src="images/dashboards/clickadvancedcssiconhtmllight.jpg">

 Rollover the *Text Component* until the *div.htmlContent* box is selected:

 <img src="images/dashboards/divhtmlcontenthtmllight.jpg">

 [6] Update the CSS so as to hide scroll bars using the *overflow* property. Set the *overflow* property to 'hidden'. Remember to add the CSS inside the '{}' brackets
 
 > <img src="images/dashboards/advancedcssstyle.jpg">

 <img src="images/dashboards/overflowhtmllight.jpg">

 <aside class="notice">If Dashboard Styling is used to align and position components, remember to update the *Margins* setting of the Text Component to undo any unncessary changes in the position of the logo</aside>

## Margins

 > <img src="images/dashboards/marginmenu.jpg">

### Outer 

 Controls spacing outside of component and component border

### Inner

 Controls spacing between component (rectagular) pane and any utilized border.

 <aside class="notice">In the absence of a defined border, changes between Inner and Outer Margin will appear similar</aside>

### Title 

 Controls Title positioning relative to the component pane and outer border

 Sample Title Settings | Results
 --- | ---
 <img src="images/dashboards/title66207htmllight.jpg"> | <img src="images/dashboards/titleimage66207.jpg">
 <img src="images/dashboards/title66620.jpg"> | <img src="images/dashboards/titleimage66620.jpg">
 <img src="images/dashboards/title50666htmllight.jpg"> | <img src="images/dashboards/titleimage50666htmllight.jpg">

 <aside class="notice">Adjusting *Title Left* and *Title Right* will add margin even if Title is center aligned for *Title Horizontal Align* in **Format** Menu </aside>

## Format

 > <img src="images/dashboards/formatmenu.jpg">

 The Format menu is used to add a component Title and set individual component colors. 

### Title

 > <img src="images/dashboards/formattitle.jpg">

 Adds a title description to the component

 <img src="images/dashboards/datagridtitlehtmllight.jpg">

### Title Font Size

 Defined in pixel size

### Title Font Color

 Font Color. To change, click on the color bar to bring up the palette menu

 <img src="images/dashboards/selectfontcolorhtmllight.jpg">
 
 <img src="images/dashboards/palettemenuhtmllight.jpg">

### Title Bold

 Check if Title is to be in bold

 <img src="images/dashboards/boldfontcolorhtmllight.jpg">

### Title Shadow

 Check if shadow is to be applied to Title

### Title Horizontal Align

 Position of title in component

 <img src="images/dashboards/titlehorizontalalignhtmllight.jpg">

### Title Bottom Border Size
 
 Defines distance between the Title and the content of the component

 <img src="images/dashboards/title20htmllight.jpg">

 <img src="images/dashboards/titlebordersizehtmllight.jpg">

### Component Color

 Sets color of component; applies to border and title background. Requires an uncheck of <a href="#transparent-background">Transparent Background</a> to activate.

 <img src="images/dashboards/componentcolorhtmllight.jpg">

 <img src="images/dashboards/componentcolorhtmllight2.jpg">

### Transparent Background

 If checked, will use the background color set in <a href="#design">Dashboard Styling</a>. If unchecked, will use <a href="#component-color">Component Color</a> set in Format menu.

 <img src="images/dashboards/transparentbackgroundhtmllight.jpg">

### Border Size, Rounding and Color
 
 The three inputs control border use of a component

 <img src="images/dashboards/bordercolorsettinghtmllight.jpg">

 <img src="images/dashboards/bordersettinghtmllight.jpg">

 <aside="notice">
 It may be necessary to adjust *Inner Top* and *Inner Bottom* margin to avoid the rectangular area box of the component from cutting into a rounded border</aside>

### Component Shadow

 Add shadow level around component edges

 <img src="images/dashboards/componentshadowhtmllight.jpg">

## Publish a Dashboard

  > Preview also offers iPhone and iPad views:

  > <img src="images/dashboards/ipadpreview.jpg">

  Once a dashboard is complete, it can be published for release. Before publishing a dashboard can be previewed: <img src="images/dashboards/previe.jpg">. This removes the Editor frame and shows the end-User view with full interactivity.

  To create a public link, go to Dashboards Manager

  <img src="images/dashboards/managepublish.jpg">

  Select the Dashboard to publish, and click <img src="images/dashboards/viewonwebutton.jpg">

  <img src="images/dashboards/viewonweb.jpg">

  The public link is available in Dashboard Basics properties.

  <img src="images/dashboards/publiclink.jpg">