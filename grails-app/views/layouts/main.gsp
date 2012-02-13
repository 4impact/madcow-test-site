<html>
<head>
    <title><g:layoutTitle default="Address Book" /></title>
    <%--<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" /> --%>
    <%--<link rel="stylesheet" href="${resource(dir:'css',file:'madcow.css')}" />--%>
    <link rel="shortcut icon" href="${resource(dir:'images',file:'Address-Book.ico')}" type="image/x-icon" />
    <g:layoutHead />
    <g:javascript library="application" />
    <g:javascript library="prototype" />
    <r:require modules="bootstrap"/>
    <g:javascript library="jquery" />
    <g:javascript>
        function showSpinner(visible) {
            $('spinner').style.display = visible ? "inline" : "none";
        }

        Ajax.Responders.register({
            onLoading: function() {
                showSpinner(true);
            },
            onComplete: function() {
                if(!Ajax.activeRequestCount) showSpinner(false);
            }
        });
    </g:javascript>
    <r:layoutResources/>
</head>
<body style="padding-top: 40px;">
<g:render template="/layouts/navigation"/>
<table class="noborder">
    <tr>
        <%--<td>
            <div id="addressBookLogo">
                <a name="madcowlogo" href="http://projectmadcow.com">
                    <img src="${resource(dir:'images',file:'madcow.jpg')}" alt="Madcow" title="Madcow" border="0" />
                </a>
            </div>
        </td>--%>
        <td style="vertical-align: middle;">
            <div class="spinner" id="spinner" style="display:none;">
                <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
            </div>
        </td>
    </tr>
</table>
<r:layoutResources/>
<div class="container">
    <div class="row">
        <div class="span10">
            <g:layoutBody />
        </div>
    </div>
</div>
<div id="footer" style="border: 0px; margin-top: 10px; margin-right: 10px; float: right">
    <a href="http://4impact.com.au">
        <img src="${resource(dir:'images',file:'4impact.jpg')}" alt="Madcow" title="Madcow" border="0" />
    </a>
</div>
</body>
</html>