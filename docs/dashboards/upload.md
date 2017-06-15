
File uploader (and downloader).

![Screenshot](img/uploadmanagerhtmllight.jpg)

Click ![Screenshot](img/uploadbuttonhtmllight.jpg) to search for a file to upload

![Screenshot](img/fileuploadhtmllight.jpg)

File upload will begin

![Screenshot](img/fileuploadcompletehtmllight.jpg)

Users can also download files from the dashboard by clicking the download icon

![Screenshot](img/downloadfilehtmllight.jpg)

## Basics

![Screenshot](img/uploadbasics.jpg)

Set permissions and upload/download directory

**Valid File Names**

Name or set with [view state parameter](introduction#view-state-parameters).

**Valid File Types**

Choose file type to support for import or set with a [view state parameter](introduction#view-state-parameters).

File extensions or mime types can be specificied, with multiple file types separated by a comma.

Example | Supported Files
--- | ---
.csv, .pdf | supports CSV and PDF files (file extensions)
image/* | supports any image file (mime type)
.csv, .pdf, image/* | accept CSV, PDF files and any image type

If not defined, then all file types are supported.

**Directory**

Assign a [view state parameter](introduction#view-state-parameters). Defines the destination directory for uploaded files (or where files are downloaded from).

**Server**

Dropdown menu. This is the target server (set up in Connection Management, by making a connection with type "daemon" to facilitate transfer between UAT and Production servers).

**Download Enabled**

Allow users download files from the dashboard

**Upload Enabled**

Allow users upload files to a dashboard

## Style

**Display Type**

Icon View

![Screenshot](img/iconuploadview.jpg)

Table View

![Screenshot](img/tableuploadview.jpg)

Dropdown menu. Switches between icon and table view; default is tabulated view

### Advanced CSS

Configure CSS of Upload component

![Screenshot](img/advancedcssuploadhtmllight.jpg)

## Margins

See [Margins](introduction.md#margins) in Introduction for more

## Format

![Screenshot](img/3dchartformat.jpg)

See [Format](introduction#format) in Introduction for more.


