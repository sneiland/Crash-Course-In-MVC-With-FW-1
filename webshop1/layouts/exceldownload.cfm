<cfparam name="filename" default="download">
<cfset request.layout = false>
<cfheader name="Content-Disposition" value="attachment; filename=#filename#.xls">
<cfcontent type="application/msexcel">#body#