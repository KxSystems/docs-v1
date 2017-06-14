
_For a Dark-Themed dashboard_:

```
.gg.dash.go 
	// Theme to match dashboards
	.qp.theme[.gg.dash.dark]
	// Grammar of Graphics Specification
	.qp.point[([]x:til 45); `x; `x; ::]
```

_For a Light-Themed dashboard_:

```
.gg.dash.go 
	// Theme to match dashboards
	.qp.theme[.gg.dash.light]
	// Grammar of Graphics Specification
	.qp.point[([]x:til 45); `x; `x; ::]
```

 To add an Analyst Grammar of Graphics visual to a dashboard:

1. Drag the "Analyst Visual" widget from the sidebar into the desired dashboard
2. Select the new Analyst Visual widget within the Dashboard
3. Click on the _Data Source_ in the right sidebar to open the Data Source dialog
4. Create a new Data field by clicking "New" in the top-left of the Data Source dialog
5. Set the database connection as normal at the top of the dialog
6. **Important**! Uncheck the "Auto-exec" checkbox near the "Results" pane in the dialog
7. Type `.gg.dash.go` followed by a Grammar of Graphics specification in the Query area at the top of the dialog
8. A theme can be used to match the theme of Dashboards (dark or light)
9. Click "Apply" and "Select Item" to save the changes
10. The visual will be plotted within the dashboard

!!! Warning "Ensure 'Auto-exec' is unchecked within the Data Source editor."

!!! Warning "Do not add more than one Analyst Widget using the same Data Source (create a new data source for each Analyst Widget)."

## Style

[1] Left click inside Advanced CSS button

![Screenshot](img/leftclickcss.jpg)

[2] Select the Analyst Visual component by first clicking on the ![Screenshot](img/cssselecticon.jpg) icon in the pop-up dialog and then clicking on the Analyst Visual component. 

[3] Add the required CSS content

## Format

![Screenshot](img/3dchartformat.jpg)

See [Format](introduction#format) in Introduction for more.

## Margins

See [Margins](introduction#margins) in Introduction for more
