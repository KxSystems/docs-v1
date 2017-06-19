![Screenshot](img/customwidget.jpg)

This is for Dashboards component developers, describing the SDK and API that is available.

Once your Javascript built component is complete, add the component into Dashboards:

![Screenshot](img/customwidgethtmllight.jpg)

A <a href="https://confluence.firstderivatives.com/download/attachments/34412189/dashboards-sdk.zip?version=1&modificationDate=1481121612829&api=v2">download package is available</a>. 

### Dashboards Environment

Dashboards Environment provides a quick way to test a component in Dashboards without loading the full application.

### Setup

Install the following software:

 * <a href="http://tortoisesvn.net/downloads.html">TortoiseSVN</a> - source code management
 * <a href="https://nodejs.org/en/download/">Node.js</a> - JavaScript runtime, includes package manager npm
 * <a href="https://code.visualstudio.com/">Visual Studio Code</a> - code editor
 * <a href="https://www.python.org/download/releases/2.7/">Python</a> - required for SASS compilation
 * <a href="https://www.microsoft.com/en-us/download/details.aspx?id=40784">Visual C++ Redistributable Packages for Visual Studio 2013</a> - required for SASS compilation

Permission SVN access to https://svn.firstderivatives.com/repos/delta-ui/html5-dash/trunk/SDK

SDK Repository contains

* QuickDashEnvironment - this is the Dashboards Environment. It allows developers to run their component in an environment like Dashboards (including a Properties Panel) without requiring a full Dashboards install.
* Projects - a number of sample projects (more information)

Open an administrator command prompt (right-click > Run as administrator) and navigate to C:\SDK\QuickDashEnvironment\_build.

Run and npm install to download the modules required by our build process. If using a proxy, provide details for npm to work with it. Check your specific setup with your network administrator.
 
_Standard proxies are as follows_ 


: `Dublin: http://dubproxy.firstderivatives.com:8080/`
: `Newry: http://newproxy.firstderivatives.com:8080/`


Install gulp globally, e.g. for Dublin:


: `npm install gulp -g -d --proxy http://dubproxy.firstderivatives.com:8080/ --https-proxy http://dubproxy.firstderivatives.com:8080/`
: `npm install -d --proxy http://dubproxy.firstderivatives.com:8080/ --https-proxy http://dubproxy.firstderivatives.com:8080/`
: `gulp`

!!! Note
    The build process will compile and copy the dependencies of QuickDashEnvironment to the QuickDashEnvironment\apps folder.

### Adding a new component

Adding a new component

To add a new component, navigate to C:\SDK\_script and install the dependencies for the NewProject command:

: `npm install -d --proxy http://dubproxy.firstderivatives.com:8080/ --https-proxy http://dubproxy.firstderivatives.com:8080/`

Navigate to C:\SDK and run the NewProject command, followed by your new project name:

: `NewProject MyNewProject`

This will create a MyNewProject folder containing sample component code in C:\SDK\Projects and point Dashboards Environment towards it.

Run `gulp` again in the C:\SDK\_build folder to rebuild Dashboards Environment with your new component included.

Open the MyNewProject folder in Visual Studio Code to begin editing your component.

### Renaming JSON files (optional)

The build process copies JSON files from MySampleProject/source/MySampleProject/ folder as specified by additionalSourceFiles in MySampleProject/build.json file.

SampleProject uses data.json. To use a different filename, update additionalSourceFiles.

e.g. to copy mySampleJSON.json from your source folder:

: `"additionalSourceFiles": [`
: `"mySampleJSON.json"`
: `]`

### Running Dashboards Environment

Sample Project:

![Screenshot](img/sampleproject.jpg)

Dashboards Environment requires a web server to run locally. You can use one of your choosing (copying the SDK folder to your webapps or www folder) or a simple option is to use Express as follows.

Open another command prompt, navigate to the QuickDashEnvironment folder and type the following commands:

: `npm install express`
: `node server`

This will install Express and then launch a basic server. Open a web browser and navigate to http://localhost:3000/ to view Dashboards Environment

The area on the left is where the SampleProject component app.js is loaded, with the numbers in the background coming from data.json. The area on the right is the Properties Panel, containing properties defined by the component (see Properties Schema). 

Leave this command prompt running 'node server' in the background and it will continue to serve your project to localhost:3000.

When you edit your project's source files, run gulp in the original command prompt to rebuild the project, then reload localhost:3000 to view the updated QuickDashEnvironment.

### Using Component in Dashboards

Once the component in Dashboards Environment is tested, try to use it in a full installation of Dashboards. Information on installing Dashboards can be found here.

Upload project's output folder (found in C:\SDK\QuickDashEnvironment\apps) to a server accessible to the Dashboards installation and note the URL to your app.js (e.g. http://{host:port}/extensions/{ProjectName}/app.js

For example, upload to the Dashboards installation's Tomcat server, e.g. {tomcat dir}/webapps/extensions/{ComponentName}/ then the component URL is: http://{host}:{port}/extensions/{ComponentName}/app.js

Alternatively if using the component locally, use the app.js on your localhost, e.g. http://localhost:3000/QuickDashEnvironment/apps/{ProjectName}/app.js if the Express server above is used.

Login to Dashboards and click the '+' button beside Widgets in the left toolbar.

![Screenshot](img/addwidgethtmllight.jpg)

Enter a name and description for your component, and the URL to your app.js. You can also upload an icon for your component.

Click Save and your component should appear in the left toolbar. Drag it into the center area to begin using it.

_Note URL to app.js_

: `http://{host:port}/extensions/{ProjectName}/app.js`

Define widget

![Screenshot](img/customwidget.jpg)
 
### Troubleshooting

**Missing Modules**

Build errors like 'Cannot find module xxx' can usually be resolved by clearing the npm cache and re-running install, e.g. for Dublin:

: `npm cache clean`
: `npm install gulp -g -d --proxy http://username:password@dubproxy.firstderivatives.com:8080/ --https-proxy http://username:password@dubproxy.firstderivatives.com:8080/`
: `npm install -d --proxy http://username:password@dubproxy.firstderivatives.com:8080/ --https-proxy http://username:password@dubproxy.firstderivatives.com:8080/`

If there is still an issue, manually remove the installed packages and start from scratch (caution: if packages are installed globally for other projects, they will also be removed)

The following commands are all run in the QuickDashEnvironment\_build folder.

**Remove local node_modules:**

: `rmdir node_modules /s /q`

**Find the global npm folder:**

: `npm config get prefix`

This will return a path like C:\Users\xxx\AppData\Roaming\npm - substitute this into the following commands

**Remove this folder and the npm-cache folder:**

: `rmdir C:\Users\xxx\AppData\Roaming\npm /s /q`
: `rmdir C:\Users\xxx\AppData\Roaming\npm-cache /s /q`

**Finally, re-run the install, e.g. for Dublin:**

: `npm install gulp -g -d --proxy http://dubproxy.firstderivatives.com:8080/ --https-proxy http://dubproxy.firstderivatives.com:8080/`
: `npm install -d --proxy http://dubproxy.firstderivatives.com:8080/ --https-proxy http://dubproxy.firstderivatives.com:8080/`

### Dashboards Environment

If able to run the Dashboards Environment, but are not getting the expected output, check the browser Console (press F12). Look for some of the following errors:

**XMLHttpRequest**

cannot load file:///***.json. Cross origin requests are only supported for protocol schemes: http, data, chrome, chrome-extension, https, chrome-extension-resource.

The index.html is opened from its folder rather through a web server. Check that each step in Running Dashboards Environment has been followed.

### Dashboards API

**Properties Schema**

Each component must include a getComponentDefinition function that defines the component's properties. See SampleProject\classes\componentDefinition.js for an example. More information on the structure of this schema can be found in the <a href="https://github.com/jdorn/json-editor">JSON Editor docs</a>.

**Data Sources**

Each property with type 'data' returns a dataSource which can be passed to the following API methods.

**subscribe**

Subscribes to a given data source

: `api.subscribe(dataSource, callback);`

**Parameters**

**dataSource**

The data source to subscribe to. A data source can be retrieved from <a href="https://confluence.firstderivatives.com/display/dlt/Dashboards#Dashboards-onSettingsChange">onSettingsChange</a> as follows (this example assumes it is a data property called Data in a category called Basics):

: `onSettingsChange: function (settings) {`
:    `var dataSource = settings['Basics.Data'];`
: `}`

**callback**

_callback_ is a function that will be called when there is a data update. Three parameters will be passed to this callback:

Property | Description
--- | ---
meta | ![Screenshot](img/metadescriptionhtmllight.jpg)
data | ![Screenshot](img/datahtmllight.jpg)
error | ![Screenshot](img/errorhtmllight.jpg)

_Example_

: `api.subscribe(dataSource, function (meta, data, error) {`
:   `// Apply to component`
: `});`

_Response_

None

-----

**unsubscribe**

Unsubscribes from a given data source
 
: `api.unsubscribe(dataSource);`

_Response_

None
 
-----

**View States**

Each property with type 'viewstate' returns a viewState which can be passed to the following API methods.

**getViewState**

Get the value of a given view state

: `api.getViewState(viewState);`

**Parameters**

**viewState**

The view state to get the value of. A view state can be retrieved from onSettingsChange as follows (this example assumes it is a view state property called Selected in a category called Basics):

: `onSettingsChange: function (settings) {`
:   `var viewState = settings['Basics.Selected'];`
: `}`


_Example_

: `var value = api.getViewState(viewState);`

_Response_

None

-----

**setViewState**

Set the value of a given view state

: `api.setViewState(viewState, value);`

**Parameters**

**viewState**

The view state to set.

_Example_

: `api.setViewState(viewState, value);`

_Response_

None

-----

**subscribe**

Subscribes to a given view state

: `api.subscribe(viewState, callback);`

**Parameters**

**viewState**

The view state to subscribe to.

**callback**

A function that will be called when the value of the view state changes. The new view state value will be passed as a parameter to callback.

_Example_

: `api.subscribe(dataSource, function (meta, data, error) {`
:    `// Apply to component`
: `});`

_Response_

None

-----

**unsubscribe**

Unsubscribes from a given view state

: `api.unsubscribe(viewState);`

_Response_

None

-----

**Error Messages**

Error messages can be shown in Dashboards using the following methods.

**showErrorMessage**

Show a Dashboards error message on the component

: `api.showErrorMessage(errorObj);`

**Parameters**

**errorObj**

An object containing the error information:

Name | Description
--- | ---
error | Error Description
type | One of 'Error', 'Warning', 'Info'

_Example_


: `api.showErrorMessage({`
:    `'error': 'Please define a data source',`
:    `'type': 'Info'`
: `});`

_Response_

None

-----

**hideErrorMessage**

Hides the Dashboards error message on the component

: `api.hideErrorMessage();`

_Response_

None

---

**onSettingsChange**

Your component app.js should implement an onSettingsChange(settings) function which will receive the settings from the Dashboards Properties Panel. The full settings object is provided on load, e.g

: `{` 
:    `"Basics": {` 
:        `"Data": "/"`
:    `},`
:    `"Style":{` 
:        `"Theme": "Dark",`
:        `"AskFill": "#00ff00",`
:        `"AskOpacity": 1,`
:        `"BidFill": "#ff3300",`
:        `"BidOpacity": 1`
:    `}`
: `}`

Changes are passed only with a path to the changed property, e.g.:

: `{`
:    `"Style.AskOpacity": 5`
:  `}`

**Delta Client (Advanced users only)**

Developers familiar with DeltaClient can access a reference to it via api.deltaClient - this allows direct access to its functions.

### Sample Projects

There are a number of Sample Projects available to demonstrate the above concepts in the SDK\Projects folder.

* **1_Basic** gives the most basic Hello World example for a component
* **2_DataSources** introduces the concept of data sources in the properties panel and how to subscribe to them
* **3_ViewStates** introduces the concept of view states - how to subscribe to them and set their value (this could be added alongside a text box linked to the same view state to see how changes in each component affect the other)
* **4_Advanced** introduces a number of concepts:

> Two data sources
> A clock (displayed using moment.js, loaded via a require module - see additionalSourceFiles and requireModules in build.json)
> Error messages (displayed using api.showErrorMessage)
> Themes (see the css for how to react to handle the global Dashboard theme)

These can be loaded into QuickDashEnvironment by navigating to C:\SDK and running, for example:

*LoadProject 1_Basic*

then building QuickDashEnvironment by navigating to C:\SDK\QuickDashEnvironment\_build and running:

*gulp*

That project can then be used as in <a href="https://confluence.firstderivatives.com/display/dlt/Dashboards#Dashboards-RunningDashboardsEnvironment">Running Dashboards Environment</a> or <a href="https://confluence.firstderivatives.com/display/dlt/Dashboards#Dashboards-UsingyourComponentinDashboards">Using your Component in Dashboards</a>.
