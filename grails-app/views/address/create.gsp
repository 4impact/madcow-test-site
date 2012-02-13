<%@ page import="au.com.ts4impact.madcow.test.site.domain.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>

        <g:javascript library="application" />
		<g:javascript>
		
		    function updateSuburb(e) { // The response comes back as a bunch-o-JSON
		        //console.log(e);
		        var postCodes = eval("(" + e.responseText + ")") // evaluate JSON		    
		    
		        // remove existing radio buttons
		        var radioButtonLocation = document.getElementById("suburbOptions");
		        while (radioButtonLocation.lastChild){
		            radioButtonLocation.removeChild(radioButtonLocation.lastChild )
		        }    
		    
		        if (postCodes) { 

	                var radioButtonLocation = document.getElementById("suburbOptions");
	                for (var i=0; i < postCodes.length; i++) {
	                    var objRadItem = document.createElement("input");
	                    objRadItem.type = "radio";
	                    objRadItem.name = "postCode.id";
	                    objRadItem.id = postCodes[i].id;
	                    objRadItem.value = postCodes[i].id;
	                    
	                    if(i == 0) {objRadItem.defaultChecked = true; objRadItem.checked = true; };
	
	                    var objTextNode = document.createTextNode(" " + postCodes[i].locality);
	
	                    var objLabel = document.createElement("label");
	                    objLabel.htmlFor = objRadItem.id;
	                    objLabel.appendChild(objRadItem);
	                    objLabel.appendChild(objTextNode);
	
	                    var objBreak = document.createElement("br");
	
	                    radioButtonLocation.appendChild(objLabel);
	                    radioButtonLocation.appendChild(objBreak);
	        		}
                }
		    }

            //Clears the "Duplicate addresses found" message
		    function clearNumberOfDuplicatesMessage() {
		        var resultsDiv = document.getElementById("duplicatesMessage");
		        while (resultsDiv.firstChild) {
		            resultsDiv.removeChild(resultsDiv.firstChild);
		        }
		    }

		    function showNumberOfDuplicates(e) {
		        clearNumberOfDuplicatesMessage()
		        //parse the result into a string
		        var numberOfResults = eval("(" + e.responseText + ")");

                //Create a text node containing our message
		        var message = numberOfResults + " ${message(code: 'address.create.NumberOfDuplicates')}"
                //var message = "1 ${message(code: 'address.create.NumberOfDuplicates')}"
		        var messageNode = document.createTextNode(message);

		        //Append the message node in a <p> element
		        var pElement = document.createElement("p");
		        pElement.appendChild(messageNode);
		        var resultsDiv = document.getElementById("duplicatesMessage");
		        resultsDiv.appendChild(pElement);
		    }


		</g:javascript>
        
    </head>
    <body>
    <div class="nav" role="navigation">
        <ul>
            <li><span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span></li>
            <li><span class="menuButton"><g:link class="list" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></span></li>
        </ul>
    </div>
        <div class="body">
            <h2><g:message code="default.create.label" args="[entityName]" /></h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${addressInstance}">
            <div class="errors">
                <g:renderErrors bean="${addressInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="addressLine1"><g:message code="address.addressLine1.label" default="Address Line1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: addressInstance, field: 'addressLine1', 'errors')}">
                                    <g:textField name="addressLine1" value="${addressInstance?.addressLine1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="addressLine2"><g:message code="address.addressLine2.label" default="Address Line2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: addressInstance, field: 'addressLine2', 'errors')}">
                                    <g:textField name="addressLine2" value="${addressInstance?.addressLine2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="postCodeEntry"><g:message code="address.postCode.label" default="Post Code" /></label>
                                </td>
                                <td valign="top" class="value">                                    
                                    <g:textField name="postCodeEntry"                                    
                                        onchange="${remoteFunction(
                                            controller:'address', 
                                            action:'ajaxGetSuburbs',
                                            params:'\'id=\' + escape(this.value)',
                                            onComplete:'updateSuburb(XMLHttpRequest);')}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="suburbOptions"><g:message code="address.suburb.label" default="Suburb" /></label>
                                </td>
                                <td id="suburbOptions"></td>                                
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="wirelessAccessPointDetected"><g:message code="address.wirelessAccessPointDetected.label" default="Wireless Access Point Detected" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: addressInstance, field: 'wirelessAccessPointDetected', 'errors')}">
                                    <g:checkBox name="wirelessAccessPointDetected" value="${addressInstance?.wirelessAccessPointDetected}" />                                    
                                </td>
                            </tr>                            
                        </tbody>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <g:submitToRemote
                                    name="checkForDuplicates"
                                    value="${message(code: 'address.create.button.CheckForDuplicates', default: 'Check For Duplicates')}"
                                    controller="address"
                                    action="ajaxCheckForDuplicates"
                                    onComplete="showNumberOfDuplicates(XMLHttpRequest)"/>
                            </td>
                            <td valign="top">
                                <div valign="top" class="warning" id="duplicatesMessage"></div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
