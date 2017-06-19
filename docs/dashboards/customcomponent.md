![Screenshot](img/customwidget.jpg)

This is for Dashboards component developers, describing the SDK and API that is available.

Once your Javascript component is built, add it into Dashboards:

![Screenshot](img/customwidgethtmllight.jpg)

<i class="fa fa-download"></i> [Software Development Kit](https://confluence.firstderivatives.com/download/attachments/34412189/dashboards-sdk.zip?version=1&modificationDate=1481121612829&api=v2 "download")

## Dashboards Environment

Dashboards Environment provides a quick way to test a component in Dashboards without loading the full application.

## Setup

Install the following software:

 * <a href="http://tortoisesvn.net/downloads.html">TortoiseSVN</a> – source code management
 * <a href="https://nodejs.org/en/download/">Node.js</a> – JavaScript runtime, includes package manager npm
 * <a href="https://code.visualstudio.com/">Visual Studio Code</a> – code editor
 * <a href="https://www.python.org/download/releases/2.7/">Python</a> – required for SASS compilation
 * <a href="https://www.microsoft.com/en-us/download/details.aspx?id=40784">Visual C++ Redistributable Packages for Visual Studio 2013</a> – required for SASS compilation

Permission SVN access to https://svn.firstderivatives.com/repos/delta-ui/html5-dash/trunk/SDK

SDK Repository contains

* QuickDashEnvironment – this is the Dashboards Environment. It allows developers to run their component in an environment like Dashboards (including a Properties Panel) without requiring a full Dashboards install.
* Projects – a number of sample projects (more information)

Open an administrator command prompt (right-click > Run as administrator) and navigate to C:\SDK\QuickDashEnvironment\_build.

Run a `npm` install to download the modules required by our build process. If using a proxy, provide details for `npm` to work with it. Check your specific setup with your network administrator.
 
### Standard proxies

Dublin: `http://dubproxy.firstderivatives.com:8080/`

Newry: `http://newproxy.firstderivatives.com:8080/`


Install `gulp` globally, e.g. for Dublin:
```dos
npm install gulp -g -d --proxy http://dubproxy.firstderivatives.com:8080/ --https-proxy http://dubproxy.firstderivatives.com:8080/
npm install -d --proxy http://dubproxy.firstderivatives.com:8080/ --https-proxy http://dubproxy.firstderivatives.com:8080/
gulp
```

!!! Note
    The build process will compile and copy the dependencies of QuickDashEnvironment to the QuickDashEnvironment\apps folder.


## Adding a new component

To add a new component, navigate to C:\SDK\_script and install the dependencies for the NewProject command:
```dos
npm install -d --proxy http://dubproxy.firstderivatives.com:8080/ --https-proxy http://dubproxy.firstderivatives.com:8080/`
```
Navigate to C:\SDK and run the NewProject command, followed by your new project name:
```dos
NewProject MyNewProject
```
This will create a MyNewProject folder containing sample component code in C:\SDK\Projects and point Dashboards Environment towards it.

Run `gulp` again in the C:\SDK\_build folder to rebuild Dashboards Environment with your new component included.

Open the MyNewProject folder in Visual Studio Code to begin editing your component.


## Renaming JSON files (optional)

The build process copies JSON files from MySampleProject/source/MySampleProject/ folder as specified by additionalSourceFiles in MySampleProject/build.json file.

SampleProject uses data.json. To use a different filename, update additionalSourceFiles.

e.g. to copy mySampleJSON.json from your source folder:
```json
"additionalSourceFiles": [
"mySampleJSON.json"
]
```


## Running Dashboards Environment

![Screenshot](img/sampleproject.jpg)  
_A sample project_

Dashboards Environment requires a web server to run locally. You can use one of your choosing (copying the SDK folder to your webapps or www folder) or a simple option is to use Express as follows.

Open another command prompt, navigate to the QuickDashEnvironment folder and type the following commands:
```dos
npm install express
node server
```
This will install Express and then launch a basic server. Open a web browser and navigate to `http://localhost:3000/` to view Dashboards Environment

The area on the left is where the SampleProject component app.js is loaded, with the numbers in the background coming from data.json. The area on the right is the Properties Panel, containing properties defined by the component (see Properties Schema). 

Leave this command prompt running `node server` in the background and it will continue to serve your project to `localhost:3000`.

When you edit your project's source files, run gulp in the original command prompt to rebuild the project, then reload `localhost:3000` to view the updated QuickDashEnvironment.


## Using your component in Dashboards

Once the component is tested in Dashboards Environment, try to use it in a full installation of Dashboards. <!-- Information on installing Dashboards can be found here. WTF? -->

1. Upload the project’s output folder (found in C:\SDK\QuickDashEnvironment\apps) to a server accessible to the Dashboards installation and note the URL to your app.js (e.g. `http://{host:port}/extensions/{ProjectName}/app.js`

    For example, upload to the Dashboards installation’s Tomcat server, e.g. `{tomcat dir}/webapps/extensions/{ComponentName}/` then the component URL is: `http://{host}:{port}/extensions/{ComponentName}/app.js`

    Alternatively if using the component locally, use the app.js on your localhost, e.g. `http://localhost:3000/QuickDashEnvironment/apps/{ProjectName}/app.js` if the Express server above is used.

1. Login to Dashboards and click the `+` button beside Widgets in the left toolbar.

    ![Screenshot](img/addwidgethtmllight.jpg)

1. Enter a name and description for your component, and the URL to your app.js. You can also upload an icon for your component.

    ![Screenshot](img/customwidget.jpg)

    Click _Save_ and your component should appear in the left toolbar. Drag it into the center area to begin using it.
 

## Troubleshooting

### Build errors

Build errors such as _Cannot find module xxx_ can usually be resolved by clearing the `npm` cache and re-running `install`, e.g. for Dublin:
```dos
npm cache clean
npm install gulp -g -d --proxy http://username:password@dubproxy.firstderivatives.com:8080/ --https-proxy http://username:password@dubproxy.firstderivatives.com:8080/
npm install -d --proxy http://username:password@dubproxy.firstderivatives.com:8080/ --https-proxy http://username:password@dubproxy.firstderivatives.com:8080/
```
If there is still an issue, manually remove the installed packages and start from scratch.

!!! warning "Watch out"
    If packages are installed globally for other projects, they will still be removed. 

The following commands are all run in the QuickDashEnvironment\_build folder.

1. Remove local node_modules
    ```dos
    rmdir node_modules /s /q
    ```

2. Find the global `npm` folder
    ```dos
    npm config get prefix
    ```

    This will return a path like C:\Users\xxx\AppData\Roaming\npm – substitute this into the following commands

3. Remove this folder and the npm-cache folder
    ```dos
    rmdir C:\Users\xxx\AppData\Roaming\npm /s /q
    rmdir C:\Users\xxx\AppData\Roaming\npm-cache /s /q
    ```
4. Finally, re-run the install, e.g. for Dublin:
    ```dos
    npm install gulp -g -d --proxy http://dubproxy.firstderivatives.com:8080/ --https-proxy http://dubproxy.firstderivatives.com:8080/
    npm install -d --proxy http://dubproxy.firstderivatives.com:8080/ --https-proxy http://dubproxy.firstderivatives.com:8080/
    ```


### Dashboards Environment

If you are able to run the Dashboards Environment, but are not getting the expected output, check the browser Console (press F12). Look for some of the following errors:
```
XMLHttpRequest
cannot load file:///***.json.
```
Cross-origin requests are supported only for these protocol schemes: HTTP, data, chrome, chrome-extension, HTTPS, chrome-extension-resource.

If the index.html is opened from its folder rather through a web server, check each step in Running Dashboards Environment has been followed.

## Dashboards API

### Properties schema

Each component must include a `getComponentDefinition` function that defines the component’s properties. See SampleProject\classes\componentDefinition.js for an example. 

<i class="fa fa-hand-o-right"></i> JSON Editor docs at <i class="fa fa-github"></i> [jdorn/json-editor](https://github.com/jdorn/json-editor).

### Data sources

Each property with type `data` returns a dataSource which can be passed to the following API methods.

`subscribe`

: Subscribes to a given data source:

: `api.subscribe(dataSource, callback);`

    `dataSource`

    : The data source to subscribe to. A data source can be retrieved from <a href="https://confluence.firstderivatives.com/display/dlt/Dashboards#Dashboards-onSettingsChange">onSettingsChange</a> as follows. This example assumes it is a data property called `Data` in a category called `Basics`:
    ```js
    onSettingsChange: function (settings) {
      var dataSource = settings['Basics.Data'];
    }
    ```

    `callback`

    : A function that will be called when there is a data update. Three parameters will be passed to this callback, defined as follows:

        * `meta`:  `{columns:{add:[],remove:[],change:[],reset:[]}}`
        * `data`: `{add:[],remove:[],change:[],reset:[]}`
        * error: `{message: ''}`

: Example:
```js
api.subscribe(dataSource, function (meta, data, error) {
    // Apply to component`
});
```

: Response: none

-----


`unsubscribe`

: Unsubscribes from a given data source
```js 
api.unsubscribe(dataSource);
```
Response: none
 

### View States

Each property with type `viewstate` returns a viewState which can be passed to the following API methods.

`getViewState`

: Get the value of a view state
```js
api.getViewState(viewState);
```

    `viewState`

    : The view state to get the value of. A view state can be retrieved from `onSettingsChange` as follows. This example assumes it is a view state property called `Selected` in a category called `Basics`.
    ```js
    onSettingsChange: function (settings) {
        var viewState = settings['Basics.Selected'];
    }
    ```

: Example:
```js
var value = api.getViewState(viewState);
```

: Response: none

-----


`setViewState`

: Set the value of a view state
```js
api.setViewState(viewState, value);
```

    `viewState`
    : The view state to set.

: Example:
```js
api.setViewState(viewState, value);
```
Response: none

-----


`subscribe`

: Subscribes to a view state
```js
api.subscribe(viewState, callback);
```

    `viewState`
    : The view state to subscribe to.

    `callback`
    : A function that will be called when the value of the view state changes. The new view state value will be passed as a parameter to callback.

: Example
```js
api.subscribe(dataSource, function (meta, data, error) {
   // Apply to component
});
```
Response: none

-----

**unsubscribe**

Unsubscribes from a given view state
```js
api.unsubscribe(viewState);
```
Response: none

-----

### Error messages

Error messages can be shown in Dashboards using the following methods.

`showErrorMessage`
: Show an error message on the component
```js
api.showErrorMessage(errorObj);
```

    `errorObj`
    : An object containing the error information:

    * error: error description
    * type: one of `Error`, `Warning`, `Info`

: Example:
```js
api.showErrorMessage({
'error': 'Please define a data source',
    'type': 'Info'
});
```
Response: none

-----

`hideErrorMessage`
: Hides the Dashboards error message on the component
```js
api.hideErrorMessage();
```
Response: none

---

`onSettingsChange`

: Your component app.js should implement an `onSettingsChange(settings)` function which will receive the settings from the Dashboards Properties Panel. The full settings object is provided on load, e.g
```json
{ 
    "Basics": { 
        "Data": "/"
    },
    "Style":{
        "Theme": "Dark",
        "AskFill": "#00ff00",
        "AskOpacity": 1,
        "BidFill": "#ff3300",
        "BidOpacity": 1
    }
}
```
Changes are passed only with a path to the changed property, e.g.:
```json
{
    "Style.AskOpacity": 5
}
```


### Delta Client

!!! warning "Advanced users only"

Developers familiar with DeltaClient can access a reference to it via `api.deltaClient` – this allows direct access to its functions.


### Sample Projects

Sample Projects in the SDK\Projects folder demonstrate the concepts above.

1_Basic
: gives the most basic Hello World example for a component

2_DataSources
: introduces the concept of data sources in the Properties Panel and how to subscribe to them

3_ViewStates
: introduces the concept of view states – how to subscribe to them and set their value (this could be added alongside a text box linked to the same view state to see how changes in each component affect the other)

4_Advanced
: introduces several concepts:

    * Two data sources:  clock (displayed using moment.js, loaded via a require module – see `additionalSourceFiles` and `requireModules` in build.json)
    * Error messages (displayed using `api.showErrorMessage`)
    * Themes (see the CSS for how to react to handle the global Dashboard theme)

These can be loaded into QuickDashEnvironment by navigating to C:\SDK and running, for example:
```dos
LoadProject 1_Basic
```
then building `QuickDashEnvironment` by navigating to C:\SDK\QuickDashEnvironment\_build and running:
```dos
gulp
```
That project can then be used as in [Running Dashboards Environment](https://confluence.firstderivatives.com/display/dlt/Dashboards#Dashboards-RunningDashboardsEnvironment) or [Using your Component in Dashboards](https://confluence.firstderivatives.com/display/dlt/Dashboards#Dashboards-UsingyourComponentinDashboards).
