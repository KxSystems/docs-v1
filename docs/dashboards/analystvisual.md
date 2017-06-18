
For a Dark-themed dashboard:
```q
.gg.dash.go 
	// Theme to match dashboards
	.qp.theme[.gg.dash.dark]
	// Grammar of Graphics Specification
	.qp.point[([]x:til 45); `x; `x; ::]
```
For a Light-themed dashboard:
```q
.gg.dash.go 
	// Theme to match dashboards
	.qp.theme[.gg.dash.light]
	// Grammar of Graphics Specification
	.qp.point[([]x:til 45); `x; `x; ::]
```
To add an Analyst Grammar-of-Graphics visual to a dashboard:

1. Drag the Analyst Visual widget from the sidebar into the desired dashboard
2. Select the new Analyst Visual widget within the Dashboard
3. Click on the _Data Source_ in the right sidebar to open the dialog
4. Create a new Data field by clicking _New_ in the top-left of the _Data Source_ dialog
5. Set the database connection as _normal_ at the top of the dialog
6. **Important**! Uncheck the _Auto-exec_ checkbox near the _Results_ pane in the dialog
7. Type `.gg.dash.go` followed by a Grammar-of-Graphics specification in the _Query_ area at the top of the dialog
8. A theme can be used to match the theme of Dashboards (dark or light)
9. Click _Apply_ and _Select Item_ to save the changes
10. The visual will be plotted within the dashboard

Ensure _Auto-exec_ is unchecked within the Data Source editor.

!!! warning "Data sources"
    Do not add more than one Analyst Visual component using the same data source: create a new data source for each one. 


## Style

1. Left-click inside Advanced CSS button  
![Screenshot](img/leftclickcss.jpg)
2. Select the Analyst Visual component by first clicking on the ![Screenshot](img/cssselecticon.jpg) icon in the pop-up dialog and then clicking on the Analyst Visual component. 
3. Add the required CSS content


## Format

![Screenshot](img/3dchartformat.jpg)

<i class="fa fa-hand-o-right"></i> [Component style](style/#component-style) for more on Title and Border configuration.

## Margins

<i class="fa fa-hand-o-right"></i> [Margins](style/#margins)
