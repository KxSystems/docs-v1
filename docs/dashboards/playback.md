![Screenshot](img/playbackhtmllight.jpg)

Replays time-series data in Data Grid and charting components


## Basics

![Screenshot](img/playbackmenu.jpg)

Configure time series <a href="#data-source">Data Source</a> and timing parameters


_Data Source_

: ![Screenshot](img/playbackdatasource.jpg)

    A query containing a time series (number, dates or timestamps), shared with the component being played back.  
<i class="fa fa-hand-o-right"></i> [Defining a Query](introduction/#defining-a-query) and [Analytics](introduction/#analytics)


_Selected Value_

: A [View State Parameter](introduction/#view-state-parameters) for the time series


_Selected Column_

: An Integer or temporal column from the _Data Source_, to be used in playback sequence


_Time Column_

: A temporal column from the _Data Source_ (can be the _Selected Column_)


_Mode_

: The default setting on load: `Event` or `Time` 


_Speed Controls_

: ![Screenshot](img/speedcontrolhtmllight.jpg)

    When checked, offers a choice of replay speeds

_Multi Controls_

: ![Screenshot](img/multicontrolshtmllight.jpg)

    When checked, offers fast-forward and rewind


_Max Overall Time_

: Upper limit <!-- in what units ETF? --> for replay based on _Selected Value_ View State Parameter


_Interval Time_

: Sampling interval of the _Selected Value_ View State Parameter: values above `1` will skip data points; e.g. a value of `2` will use every second data point of the _Selected Value_ View State Parameter


_Force Pause_

: Check control. 



<i class="fa fa-hand-o-right"></i> [Style](style) for common styling parameters