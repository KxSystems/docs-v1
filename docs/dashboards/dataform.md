![Screenshot](img/dataforminput.jpg)

The Data Form component quickly converts [View State Parameter](introduction#view-state-parameters) inputs from a _Data Source_ query into user-configurable inputs for the dashboard. All that is required for the Data Form component is the _Data Source_

![Screenshot](img/dataformparameters.jpg)

## _Basics_

![Screenshot](img/dataformbasics.jpg)

_Data Source_
: See [Defining a Query](introduction#defining-a-query) and [Analytics](introduction#analytics) for more on data sourcing.

_Expand Dict Parameters_

: ![Screenshot](img/expandeddictionary.jpg)

: When checked, a _Data Source_ using dictionary type View State Parameter(s), will expand out the dictionary inputs.

_Show Reset_

: Includes a reset to return View State Parameters to default values.

: ![Screenshot](img/resetbuttonhtmllight.jpg)


_Show Submit_

: Includes a Submit button which allows a range of View State Parameters to be updated before applying the values to the connected _Data Source_.

!!! Note "No Submit button?"
    If there is no Submit button, each change of a View State Parameter will be applied to the connected _Data Source_. Use a Submit button if multiple inputs are required or preferred before sourcing from the database.

## _View State Parameters_

![Screenshot](img/viewstateparameters.jpg)

_Hide Parameter_
: Hide the input. Prevent user updates of variable

_Parameter Type_
: Select if the input for the _Data Source_ View State Parameters is a user-input box or a dropdown.

## _Set View State on Submit_

The Data form pulls View State Parameters inputs from the _Data Source_ View State Parameters. Setting a _View State on Submit_ allows for non-Data Source View State Parameters to be set when the Submit button is submit.

![Screenshot](img/setviewstateonsubmithtmllight.jpg)

!!! Tip "Best for boolean"
    This view state control is best used for boolean switches; e.g. expanding an [Accordion](accordion) section containing a result output from a Data Form submit. 


## Style

_Advanced CSS_

: Configure customisation options for **Data Form** component

: ![Screenshot](img/advancedcssdataformhtmllight.jpg)


_Display_

: Dropdown choice of options:  

    Selection | Configuration
    --- | ---
    Default | ![Screenshot](img/defaultstylehtmllight.jpg)
    Inline-Block | ![Screenshot](img/inlineblockhtmllight.jpg)
    Inline | ![Screenshot](img/inlinehtmllight.jpg)
    Flex | ![Screenshot](img/flexhtmllight.jpg)
    Table | ![Screenshot](img/tablehtmllight.jpg)

_Minimum width_

: Slider sets the width of the _Data Form_ input box. 
 
: ![Screenshot](img/minwidthhtmllight.jpg)


<i class="fa fa-hand-o-right"></i> [Styling dashboards](style)