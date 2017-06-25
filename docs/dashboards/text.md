A container for text and images: everything from a short string, through HTML tables, to entire web pages. Content may include values from the component’s data source. 

![Screenshot](img/textcomponent.jpg)  
_<small>A Text component with formatted content</small>_


## Basics

![Screenshot](img/basicsmenu.jpg)

_Data Source_
: <i class="fa fa-hand-o-right"></i> [Defining a Query](introduction/#defining-a-query) and [Analytics](introduction/#analytics)


_Formatted Text_
: Clicking on the field summons the [Text Editor](#text-editor), which toggles between WYSIWYG and HTML modes. 

_Template Text_
: Template text can include data from the _Data Source_. Clicking on the field summons the [Template Editor](#template-editor).

_Font Size_
: Default type size, in pixels

_Horizontal_
: Horizontal alignment of text

_Vertical_
: Vertical alignment of text

_Tooltip_
: (Not in use)


## Text Editor

Click inside the _Formatted Text_ box to summon the Text Editor.

![Screenshot](img/textcomponenthtmllight.jpg)

![Screenshot](img/texteditorinputhtmllight.jpg)

![Screenshot](img/texteditor.jpg)  
_<small>Text Editor in WYSWIG mode</small>_

![Screenshot](img/htmltexteditor.jpg)  
_<small>Text Editor in HTML mode</small>_


### Toolbar 

button | function
--- | ---
![Screenshot](img/fontstylehtmllight.jpg) | **Bold**, *italic* or underscore
![Screenshot](img/alignmenthtmllight.jpg) | Left, center, right and justify alignment
![Screenshot](img/listoptionhtmllight.jpg) | Bullet or numeric points
Font Size | 8pt, 10pt, 12pt, 14pt, 18pt, 24pt
Font Family | Arial, Comic Sans, Courier New, Georgia, Helvetica, Impact, Times, Trebuchet, Verdana
Font Format | Paragraph, Pre, Heading 6, Heading 5, Heading 4, Heading 3, Heading 2, Heading 1
![Screenshot](img/indentoptionhtmllight.jpg) | Add or remove paragraph indent
![Screenshot](img/addimagehtmllight.jpg) | Import an image. Includes options to set width, height, Alt Text and image alignment. To import an image, click ![Screenshot](img/uploadimagebutton.jpg), source the image from the PC, then click ![Screenshot](img/submitbutton.jpg)  
![Screenshot](img/addlinkhtmllight.jpg) | Add or remove URL links. Define the URL, give the URL a descriptive Title, and configure from the dropdown whether the link should open in the current window or a new window
![Screenshot](img/textcolorhtmllight.jpg) | Select text color from the color palette
![Screenshot](img/addhtmllight.jpg) | HTML or WYSWIG mode


### Uploading an image

![Screenshot](img/addeditimage.jpg)


## Template Editor

### Embedding values

As an example, the table:

![Screenshot](img/customtable.jpg)

was generated from the following _Template Text_:

![Screenshot](img/templatetextsample.jpg)

### Online help

The _Help_ button offers additional configuration assistance: 

![Screenshot](img/samplehealthhtmllight.jpg)

!!! warning "Can’t see Template Text?"
    _Template Text_ requires a data source. If no _Data Source_ is defined, _Template Text_ will not appear.


## Style, Margins, Format

<i class="fa fa-hand-o-right"></i> [Style](style) for common styling parameters