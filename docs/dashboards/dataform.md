
![Screenshot](img/dataforminput.jpg)

The Data Form component quickly converts [view state parameter](introduction.md#view-state-parameters) inputs from a *Data Source* query into user configurable inputs for the dashboard. All that is required for the Data Form component is the <a href="#data-source">Data Source</a>

![Screenshot](img/dataformparameters.jpg)

## Basics

Configuration options

### Data Source

See [Defining a Query](introduction.md#defining-a-query) and [Analytics](introduction.md#analytics) for more on data sourcing.

**Expanded Dict Parameters**

If <a href="#data-source">Data Source</a> is using dictionary type [view state parameter](introduction.md#view-state-parameters), then <a href="#data-source">Data Source</a> will expand out the dictionary inputs.

**Show Reset**

Includes a reset to return [view state parameter](introduction.md#view-state-parameters) to default values.

![Screenshot](img/resetbuttonhtmllight.jpg)

**Show Submit**

Includes a submit button which allows a range of [view state parameter](introduction.md#view-state-parameters) to be updated before applying the values to the connected <a href="#data-source">Data Source</a>.

<aside class="notice">If there no <i>Show Submit</i> button, each change of a [view state parameter](introduction.md#view-state-parameters) will be applied to the connected <i>Data Source</i> on change</aside>

### View State Parameters

![Screenshot](img/viewstateparameters.jpg)

For each [view state parameter](introduction.md#view-state-parameters) from the <a href="#data-source">Data Source</a> the input can be configured as a user-text input box or dropdown menu.  If *Hide Parameter* is checked, then the selected <a href="#view-state-parameters">View State Parameter</a> will not appear in the dashboard. 

### Set View State on Submit

In addition to passing values from *Data Source* [view state parameter](introduction.md#view-state-parameters), an additional (non-related to **Data Source**) <a href="#view-state-parameters">View State Parameter</a> can be set when **Data Form** values are submitted. Requires *Show Submit* button to activate

![Screenshot](img/setviewstateonsubmithtmllight.jpg)

## Style

**Advanced CSS**

Configure customisation options for **Data Form** component

![Screenshot](img/advancedcssdataformhtmllight.jpg)

**Display**

Dropdown choice of options 

Selection | Configuration
--- | ---
Default | ![Screenshot](img/defaultstylehtmllight.jpg)
Inline-Block | ![Screenshot](img/inlineblockhtmllight.jpg)
Inline | ![Screenshot](img/inlinehtmllight.jpg)
Flex | ![Screenshot](img/flexhtmllight.jpg)
Table | ![Screenshot](img/tablehtmllight.jpg)

**Minimum Width**

Slider sets the width of the *Data Form* input box. 
 
![Screenshot](img/minwidthhtmllight.jpg)

## Format

![Screenshot](img/3dchartformat.jpg)

See [Format](introduction.md#format) in Introduction for more.

## Margins

See [Margins](introduction.md#margins) in Introduction for more