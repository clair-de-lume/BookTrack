<#-- @ftlvariable name="book" type="com.booktrack.models.Book" -->
<#import "_layout.ftl" as layout />

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>BookTrack</title>
        <@layout.page_title />
    </head>

    <body>
        <@layout.page_header />
        <@layout.show_book />
    </body>
</html>