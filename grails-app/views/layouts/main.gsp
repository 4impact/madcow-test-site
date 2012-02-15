<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Address Book" /></title>
    <link rel="shortcut icon" href="${resource(dir:'images',file:'Address-Book.ico')}" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <g:layoutHead />
    <g:javascript library="application" />
    <g:javascript library="prototype" />
    <r:require modules="bootstrap"/>
    <g:javascript library="jquery" />
    <style type="text/css">

        .body {
            padding-top: 10px;
        }

    </style>
    <g:javascript>
        function showSpinner(visible) {
            $('spinner').style.display = visible ? "inline" : "none";
        }
    </g:javascript>
    <r:layoutResources/>
</head>
<body style="padding-top: 40px;">
<g:render template="/layouts/navigation"/>
<div class="container">
            <g:layoutBody />
            <r:layoutResources/>
</div>
<div id="footer" style="border: 0px; margin-top: 10px; margin-right: 10px; float: right">
    <a href="http://4impact.com.au">
        <img src="${resource(dir:'images',file:'4impact.jpg')}" alt="Madcow" title="Madcow" border="0" />
    </a>
</div>
</body>
</html>