The Maps component adds geographical data to your dashboards.


## Basics

![Screenshot](img/mapbasics.jpg)

Unlike other components, different data sources can be assigned and overlaid by map type.


_Focus_

: Used for [linking components](introduction/#linking-components). Requires a [View State Parameter](introduction/#view-state-parameters).


_Theme_

: Switches between Light and Dark Theme

## Map

![Screenshot](img/mapmenu.jpg)

_Map Type_
 
: ![Screenshot](img/mapselectionhtmllight.jpg)
 
    ![Screenshot](img/maptype.jpg)


_Scale_

: Zoom level of the map

    ![Screenshot](img/mapscalehtmllight.jpg)


_Center X/Y_

: Co-ordinates to center the map on dashboard load.
 
    ![Screenshot](img/centerxyhtmllight.jpg)


_Track Changes_

: When checked, will update _Center X/Y_ co-ordinates depending on User interaction of map. 

    ![Screenshot](img/trackchangeshtmllight.jpg)

    !!! note "Saved state"
        Map will open on updated Center X/Y co-ordinates on next dashboard load.


_Bounds_

: Create a View State Parameter to store user-map-selected co-ordinates.

    ![Screenshot](img/boundshtmllight.jpg)


_Custom point_

: ![Screenshot](img/custompointhtmllight.jpg)

    1. Create a View State Parameter to store custom marker location details. 
    2. Right-click on the map to view the _Add Point_ option – click to select
    3. The co-ordinates of the added point will be stored in the assigned _Custom Point_ View State Parameter. 

    ![Screenshot](img/customhtmllight.jpg)

    !!! warning "Assign a View State Parameter first"
        _Custom Point_ will be enabled only when a View State Parameter has been assigned. To right-click on the map in the absence of an assigned View State Parameter will not add a custom point to the map.


## Statistical Overlay

Provide a custom map overlay. 

![Screenshot](img/statisticaloverlay.jpg)

![Screenshot](img/staticaloverlayhtmllight.jpg)


_Show Overlay_

: When checked, the statistical overlay is visible


_Data Source_

: <i class="fa fa-hand-o-right"></i> [Defining a Query](introduction/#defining-a-query) and [Analytics](introduction/#analytics) for more on data sourcing.

    !!! note "Geographic coordinates"
        Ensure geographic coordinates are included in the data source to create data points for the map.


_Data Key_

: Data grouping from the _Data Source_ (e.g. Postcode) and can be stored using the _Selected Value_ as a View State Parameter


_Data Value_

: The measured variable (e.g. 1 Bedroom Cost)


_Geo Data Source_

: ![Screenshot](img/geodatasourcehtmlight.jpg)

    Select the underlying country/region map to use (e.g. Dublin)


_Geo Data Column_

: The data column relevant to the _Geo Data Source_ (included in [Defining a Query](introduction/#defining-a-query))

    ![Screenshot](img/geodatacolumnhtmllight.jpg)


_Geo Data Filter_

: Selected country, state or county (if used). Value can be stored using the _Geo Filter Selected Value_ as a View State Parameter


_Color Scale_

: Toggle control for color use in the statistical overlay. 

    ![Screenshot](img/colorscaletogglehtmlight.jpg)


_Legend Type_

: Switch between _Percentage_ or _Range_ overlay


_Legend Color_

: Used when _Color Scale_ is employed

    ![Screenshot](img/legendcolorhtmllight.jpg)


_Overlay Colour (From DB)_

: Overlay color defined from _Data Source_ instead of _Legend Color_


_Custom Tooltip_

: Custom Tooltip on Overlay

    ![Screenshot](img/overlaylegend.jpg)

    To define the tooltip, click inside the _Custom Tooltip_ box

    ![Screenshot](img/customtooltiphtmllight.jpg)

    ![Screenshot](img/customtooltip1htmllight.jpg)

    Additional information can be included in the tooltip. First select a data variable from the dropdown

    ![Screenshot](img/customtooltip2htmllight.jpg)

    Then click the `+` add button to include:

    ![Screenshot](img/customtooltip3htmllight.jpg)


_Selected Value_

: Create and assign a [View State Parameter](introduction/#view-state-parameters). Will store the _Data Key_ (if used) as a View State Parameter. 


_Geo Filter Selected Value_

: Create and assign a View State Parameter. Will store the _Geo Data Filter_ (if used) as a View State Parameter.

    ![Screenshot](img/geofiltervalue.jpg)


_Bounds Selected_

:  Create and assign a View State Parameter. Will store the boundary co-ordinates for a selected region in the Overlay.


_Image Source_

: ![Screenshot](img/imageoverlay.jpg)

    Uses a URL reference for an image overlaid on the map.  The position of the image relative to the map is defined by _Image North Bound_, _Image South Bound_, _Image East Bound_ and _Image West Bound_.

    ![Screenshot](img/imagehtmllight.jpg)


_Image North Bound_

_Image South Bound_

_Image East Bound_

_Image West Bound_

: Map Overlay coordinates


_Image Opacity_

: Opacity for the overlay relative to the underlying map. 


_Selected Point Viewstate Routing_

: Map Statistical Overlay _Data Source_ variables to View State Parameter.

### Sample Statistical Overlay Data

```q
tab:flip `Id`Id2`Postal`Name`1_Bed_Apartment_Cost`1_Bed_Apartment_Inc`2_Bed_trc_Cost`2_Bed_trc_Inc
`3_Bed_semi_Cost`3_Bed_semi_Inc`4_Bed_bungalow_Cost`4_Bed_bungalow_Inc`5_Bed_detached_Cost`5_Bed_detached_Inc
`Color!(`13`0`2`10`1`15`9`17`5`3`7`8`12`20`22`24`6.1`6`4`14`16`18`11;
13 0 2 10 1 15 9 17 5 3 7 8 12 20 22 24 61 6 4 14 16 18 11;
`Dublin_13`DLR`Dublin_2`Dublin_10`Dublin_1`Dublin_15`Dublin_9`Dublin_17`Dublin_5`Dublin_3`Dublin_7`Dublin_8
`Dublin_12`Dublin_20`Dublin_22`Dublin_24`Dublin_6W`Dublin_6`Dublin_4`Dublin_14`Dublin_16`Dublin_18`Dublin_11;
`Donaghmede_Sutton_and_Howth`Stillorgan_Dun_Laoghaire_and_Dalkey`City_Centre_South`Ballyfermot_and_Cherry_Orchard
`North_Inner_City`Blanchardstown_Castleknock_and_Clonsilla`Drumcondra_Glasnevin_and_Santry
`Balgriffin_Darndale_and_Priorswood`Artane_Coolock_and_Raheny`Clontarf_East_Wall_and_Fairview
`Cabra_Phibsborough_and_Smithfield`The_Liberties_Inchicore_and_Phoenix_Park`Crumlin_Drimnagh_and_Walkinstown
`Chapelizod_and_Palmerstown`Clondalkin_Rowlagh_and_Liffey_Valley`Tallaght_Firhouse_and_Jobstown
`Harolds_Cross_Templeogue_and_Terenure`Ranelagh_Rathmines_and_Rathgar`Donnybrook_Irishtown_and_Sandymount
`Churchtown_Clonskeagh_and_Dundrum`Ballinteer_Ballyboden_and_Knocklyon`Foxrock_Stepaside_and_Cabinteely
`Ballymun_and_Finglas;
172 133 221 107 163 131 170 116 164 205 167 174 144 150 109 116 225 281 281 218 190 214 126;
-0.05 -5.70 -0.16 0.01 0.10 -0.06 -0.03 -0.02 -0.06 0.04 -0.03 -0.01 -0.04 -0.05 0.00 0.00 
-0.06 -0.08 -0.05 -0.04 -0.10 -0.09 0.00;
217 167 307 135 247 165 214 146 206 289 211 219 181 189 138 146 283 354 399 274 240 270 159;
-0.05 -5.60 -0.06 0.01 0.05 -0.06 -0.03 -0.02 -0.06 0.04 -0.03 -0.01 -0.04 -0.05 0.00 0.00 
-0.05 -0.08 0.02 -0.04 -0.10 -0.09 0.00;
333 271 440 207 344 254 329 224 317 406 324 336 278 291 211 225 435 543 581 421 368 414 244;
0.03 1.98 -0.05 0.09 0.04 0.02 0.05 0.06 0.01 0.04 0.05 0.07 0.04 0.02 0.08 0.08 0.02 -0.01 
0.02 0.03 -0.03 -0.01 0.08;
554 427 672 344 511 422 547 373 527 663 538 559 463 483 352 373 723 903 980 701 612 688 406;
0.09 7.90 0.01 0.16 0.08 0.08 0.11 0.12 0.08 0.07 0.11 0.13 0.10 0.08 0.14 0.14 0.08 0.05 
0.04 0.09 0.03 0.05 0.14;
647 499 760 402 622 494 640 436 615 826 629 654 541 565 411 436 845 1055 1188 819 716 804 474;
0.04 2.90 -0.08 0.10 0.01 0.03 0.06 0.07 0.03 0.07 0.06 0.08 0.05 0.03 0.09 0.09 0.03 0.01 
0.03 0.04 -0.02 0.00 0.09;
`ff0000`ff0000`ff00ff`ffff00`fffff`ff0f00`ff000f`ff000f`fff000`ff0000`ff0000`ff0000`ff0000
`ff0000`ff0000`ff0000`ff0000`ff0000`ff0000`ff0000`ff0000`ff0000`ff0000)
```


## _Points_

![Screenshot](img/mappoints.jpg)

![Screenshot](img/mapointsmenu.jpg)

Applies distinct data points to map


_Data Source_

: <i class="fa fa-hand-o-right"></i> [Defining a Query](introduction/#defining-a-query) and [Analytics](introduction/#analytics) for more on data sourcing.

    !!! note "Geographic coordinates"
        Ensure geographic coordinates are included in the data source to create data points for the map.


_Selected Value_

: Create and assign a [View State Parameter](introduction/#view-state-parameters).  


_Tracker_

: Create and assign a View State Parameter.  Stores value set in _TrackedItem_.


_TrackedItem_

: Used in combination with _Tracker_: takes variable from _Data Source_ and maps it to the _Tracker_ View State Parameter. The variable is populated when the user chooses a point on the map. 
 
    ![Screenshot](img/trackeditemmenuhtmllight.jpg)
     
    !!! tip 
        Additional mapped items can be tracked using _Selected Point Viewstate Routing_


_Latitude / Longitude Data_

: Set Latitude / Longitude from *Data Source*

    ![Screenshot](img/latitudelongitude.jpg)

    The columns in the _Data Source_ to use for positioning the points on the map

    ![Screenshot](img/latitudehtmllight.jpg)


_Shape_

: The shape of the map point graphic

    ![Screenshot](img/shape.jpg)



_Shape (From DB)_

: Point shape from _Data Source_

    ![Screenshot](img/shapefromdbhtmllight.jpg)


_Shape Colour_

: Shape color


_Shape Colour (From DB)_

: Point color using reference to _Data Source_


_Shape Size_

: Point size
 
    ![Screenshot](img/sahpesizehtmllight.jpg)


_Shape Colour (Selected)_

: The colour for when a user selects a point


_Shape Opacity (Selected)_

: The opacity when a user selects a point


_Shape Colour (Hovered)_

: The colour for when a user hovers over a point


_Shape Opacity (Hovered)_

: The opacity when a user hovers over a point


_Cluster Size_

: Map Clusters

    ![Screenshot](img/mapcluster.jpg)

    Size of clusters into which points are aggregated 

    ![Screenshot](img/clustersizehtmllight.jpg)


_Cluster_

: When checked, replaces grouped individual points with a numeric cluster icon. Points outside of a cluster will remain displayed as individual points.

    ![Screenshot](img/clusterhtmllight.jpg)


_Show Tooltip_

: When checked, displays a tooltip on Point rollover


_Custom Tooltip_

: ![Screenshot](img/customtooltip.jpg)
 
    The information to display on a tooltip. Available options taken from _Data Source_

    ![Screenshot](img/customtooltiphtmlight.jpg)


_Zoom on Select_

: When checked, map will zoom when user selects a point


_Single Zoom on Cluster_

: When checked, map will zoom on selected cluster

    ![Screenshot](img/singlezoomhtmllight.jpg)


_Open Dashboard on Select_

: If user selects a map point, the assigned dashboard will load.

    ![Screenshot](img/opendashboardhtmllight.jpg)


_Points in View_

: Points in View

    ![Screenshot](img/pointsinview.jpg)

    When checked, map will auto-zoom to show all available data points


### _Selected Row ViewState Routing_

The _Selected Value_ and _Selected Value Attribute_ handles a single data map. _Selected Row Viewstate Routing_ supports multiple mappings between _Selected Values_ and _Selected Value Attributes_.

![Screenshot](img/selectedviewstateroutingwhitehtml.jpg)

To add a row, click ![Screenshot](img/routinghtmllight.jpg)


## Heat Map

Can be used for dynamic overlays; e.g. when linked with [Playback](playback) component. 

![Screenshot](img/heatmap.jpg)  
_A traffic heat map_

![Screenshot](img/heatmapmenu.jpg)



_Data Source_

: <i class="fa fa-hand-o-right"></i> [Defining a Query](introduction/#defining-a-query) and [Analytics](introduction/#analytics) for more on data sourcing.

    !!! note "Geographic coordinates"
        Ensure geographic coordinates are included in the data source to create data points for the map.


_Latitude / Longitude Data_

: The columns in the _Data Source_ to use for positioning the heat map.

    ![Screenshot](img/heatmaplatlonghtmllight.jpg)


_Weight_

: The column in the _Data Source_ to use for setting the heat map weight/depth

    ![Screenshot](img/weighthtmllight.jpg)


_Opacity_

: The opacity of the heat-map overlay. 

    ![Screenshot](img/changeopacity.jpg)



_Gradient_

: Color gradient for heat map

    ![Screenshot](img/gradienthtmllight.jpg)


_Radius_

: Radius for heat-map spread


_Show Heatmap_

: When checked, the heat map is visible


## Lines

![Screenshot](img/linesmap.jpg)

![Screenshot](img/linesmenu.jpg)


_Data Source_

: <i class="fa fa-hand-o-right"></i> [Defining a Query](introduction/#defining-a-query) and [Analytics](introduction/#analytics) for more on data sourcing.

    !!! note "Geographic coordinates"
        Ensure geographic coordinates are included in the data source to create data points for the map.

    ![Screenshot](img/linesdatasourcehtmllight.jpg)

    ![Screenshot](img/linesviewstateparameter.jpg)


_Latitude / Longitude Data_

: Columns of the _Data Source_ to use for setting the lines.


_Colour_

: Color of the line


_Label Color_

: Background colour of rollover label


_Label Size_

: Size of the label


_Label Text_

: Can also be a [View State Parameter](introduction/#view-state-parameters)


_Show Label_

: When checked, displays the label


_Show Tooltip_

: When checked, displays the tooltip


### Sample Lines Query

```q
{[ln] tab:flip `Stop`long`lat`Line!(
`Tallaght`Hospital`Cookstown`Belgard`Kingswood`Red_Cow`Kylemore`Bluebell`Blackhorse`Drimnagh`Goldenbridge
`Suir_Road`Rialto`Fatima`Jamess`Heuston`Museum`Smithfield`Four_Courts`Jervis`Abbey_Street`BusAras`Connolly
`St_Stephens_Green`Harcourt`Charlemont`Ranelagh`Beechwood`Cowper`Milltown`Windy_Arbour`Dundrum`Balally
`Kilmacud`Stillorgan`Sandyford`Central_Park`Glencairn`The_Gallops`Leopardstown_Valley`Ballyogan_Wood
`Racecourse`Carrickmines`Brennanstown`Laughanstown`Cherrywood`Brides_Glen`Fettercairn`Cheeverstown
`Citywest_Campus`Fortunestown`Saggart`Georges_Dock`Mayor_Square__NCI`Spencer_Dock`The_Point`Depot;
-6.374588889 -6.37885 -6.384397222 -6.374886111 -6.36525 -6.369872222 -6.343444444 -6.333791667 -6.327394444
 -6.318161111 -6.313569444 -6.307211111 -6.297241667 -6.292547222 -6.293361111 -6.291808333 -6.286713889
  -6.277727778 -6.273436111 -6.265333333 -6.258172222 -6.25145 -6.249941667 -6.261333333 -6.26265 
  -6.258683333 -6.256202778 -6.254652778 -6.253447222 -6.251727778 -6.250708333 -6.245116667 -6.236772222
   -6.223886111 -6.209919444 -6.204677778 -6.203763889 -6.209941667 -6.206022222 -6.198361111 -6.184475
    -6.175161111 -6.169908333 -6.161597222 -6.155005556 -6.145852778 -6.142886111 -6.395553517 -6.4068485
     -6.418914583 -6.42460165 -6.43776255 -6.247575 -6.243394444 -6.237147222 -6.229258333 -6.369958333;
53.28749444 53.28936944 53.29350556 53.29928611 53.30369444 53.31683333 53.32665556 53.32929722 53.33425833
 53.33536111 53.33589167 53.33661667 53.33790833 53.33843889 53.34194167 53.34664722 53.34786667 53.34713333
  53.34686389 53.34768611 53.34858889 53.350075 53.35092222 53.33907222 53.33335833 53.33066944 53.32643333
   53.32082222 53.31646667 53.30991667 53.30155833 53.29235833 53.28610556 53.28300833 53.27931111
    53.27760278 53.27015 53.26633611 53.26116389 53.25824722 53.255047 53.25536667 53.25403333 53.25261944
     53.25060556 53.24533333 53.242075 53.29351885 53.29098242 53.28783255 53.28425063 53.2846788
      53.349528 53.34924722 53.34882222 53.34835 53.31465833;
`Red`Red`Red`Red`Red`Red`Red`Red`Red`Red`Red`Red`Red`Red`Red`Red`Red`Red`Red`Red`Red`Red`Red`Green
`Green`Green`Green`Green`Green`Green`Green`Green`Green`Green`Green`Green`Green`Green`Green`Green
`Green`Green`Green`Green`Green`Green`Green`Red2`Red2`Red2`Red2`Red2`Red`Red`Red`Red`End);
select from tab where Line = ln}
```


## Voronoi

![Screenshot](img/voronoimap.jpg)  
_A [Voronoi](https://en.wikipedia.org/wiki/Voronoi_diagram) map_
 
![Screenshot](img/voronoimenu.jpg)


_Data Source_

: <i class="fa fa-hand-o-right"></i> [Defining a Query](introduction/#defining-a-query) and [Analytics](introduction/#analytics) for more on data sourcing.

    !!! note "Geographic coordinates"
        Ensure geographic coordinates are included in the data source to create data points for the map.


_Data Key_

: The variable from the _Data Source_ on which the Voronoi map will be based

    ![Screenshot](img/voronoisdatakey.jpg)


_Description_

: Description variable or a [View State Parameter](introduction/#view-state-parameters) offering descriptive details.


_Latitude / Longitude Data_

: Latitude and longitude columns from the _Data Source_ 

    ![Screenshot](img/longlathtmllight.jpg)


_Average Latitude / Longitude Data_

: Typically uses the same column information as for _Latitude / Longitude Data_

    ![Screenshot](img/avglonglathtmllight.jpg)


_Line Color_

: Color of the lines


_Show Scale_

: When checked, displays key for Voronoi metric scale


_Scale Metric_

: Metric from the _Data Source_ variables. This will add a shading level to the Voronoi map.

    ![Screenshot](img/scalemetrichtmllight.jpg)


_Scale Opacity_

: Opacity of the Voronoi map shading.


_Legend Colour_

: Legend text colour

    ![Screenshot](img/voronoilegendcolor.jpg)


## Style

_Advanced CSS_

: ![Screenshot](img/style.jpg)
 
    Use _Advanced CSS_ to make changes to Map elements. Click inside the _Advanced CSS_ editor. Click the selector icon, then inside the Map component to bring up the relevant CSS code. 

    ![Screenshot](img/advancedcsshtmllight.jpg)
 

### Margins

<i class="fa fa-hand-o-right"></i> [Style](style)


### Format

![Screenshot](img/mapformat.jpg)

<i class="fa fa-hand-o-right"></i> [Style](style)

