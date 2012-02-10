
<%@ page import="au.com.ts4impact.madcow.test.site.domain.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h2><g:message code="default.show.label" args="[entityName]" /></h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="address.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value" id="addressId">${fieldValue(bean: addressInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="address.addressLine1.label" default="Address Line1" /></td>
                            
                            <td valign="top" class="value" id="addressLine1">${fieldValue(bean: addressInstance, field: "addressLine1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="address.addressLine2.label" default="Address Line2" /></td>
                            
                            <td valign="top" class="value" id="addressLine2">${fieldValue(bean: addressInstance, field: "addressLine2")}</td>
                            
                        </tr>                       
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="address.postCode.label" default="Post Code" /></td>
                            
                            <td valign="top" class="value" id="postCode"><g:link controller="postCodeReference" action="show" id="${addressInstance?.postCode?.id}">${addressInstance?.postCode?.postCode?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="address.state.label" default="State" /></td>
                            
                            <td valign="top" class="value" id="state"><g:link controller="state" action="show" id="${addressInstance?.postCode?.state?.id}">${addressInstance?.postCode?.state?.name?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="address.suburb.label" default="Suburb" /></td>
                            
                            <td valign="top" class="value" id="suburb">${fieldValue(bean: addressInstance, field: "postCode.locality")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="address.wirelessAccessPointDetected.label" default="Wireless Access Point Detected" /></td>                            
                            <td valign="top" class="value" id="wirelessAccessPointDetected">${fieldValue(bean: addressInstance, field: "wirelessAccessPointDetected")}</td>
                        </tr>                            
                        
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${addressInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
