
<%@ page import="au.com.ts4impact.madcow.test.site.domain.Address" %>
<%@ page import="au.com.ts4impact.madcow.test.site.domain.AddressController" %>
<%@ page import="au.com.ts4impact.madcow.test.site.domain.State" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.search.label" args="[entityName]" /></title>                
    </head>
    <body>
        <div class="body">
            <ul class="breadcrumb">

                <li>
                    <g:link class="create" action="create"><g:message code="default.create.label" args="[entityName]" /></g:link>
                </li>
            </ul>
            <g:if test="${flash.message}">
            <div class="alert alert-info">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${companyInstance}">
            <div class="alert alert-error">
                <g:renderErrors bean="${companyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="showSearchResults" method="post" class="form-horizontal">
                <legend><g:message code="default.search.label" args="[entityName]" /></legend>
                <fieldset class="form">
                    <table>
                        <tbody>
                            <tr class="control-group">
                                <td valign="top" class="control-label">
                                    <label for="addressLines"><g:message code="address.addressLines.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="controls">
                                    <g:textField name="addressLines" class="input-xlarge"/>
                                </td>                                                        
                            </tr>  
                            
                            <tr class="control-group">
                                <td valign="top" class="control-label">
                                    <label for="postCode"><g:message code="address.postCode.label" default="Post Code" /></label>
                                </td>
                                <td valign="top" class="controls">
                                    <g:textField name="postCode" class="input-xlarge"/>
                                </td>                                                        
                            </tr>
                            
                            <tr class="control-group">
                                <td valign="top" class="control-label">
                                    <label for="suburb"><g:message code="address.suburb.label" default="Suburb" /></label>
                                </td>
                                <td valign="top" class="controls">
                                    <g:textField name="suburb" class="input-xlarge"/>
                                </td>                                                        
                            </tr>  
                            
                            <tr class="control-group">
                                <td valign="top" class="control-label">
                                    <label for="state"><g:message code="address.state.label" default="State" /></label>                                    
                                </td>
                                <td valign="top" class="controls">
                                    <g:select class="input-xlarge"
                                        from="${State.list().sort() {state -> state.name} }"
                                        value="${state}" 
                                        name="state"
                                        optionKey="id"
                                        optionValue="name"
                                        noSelection="${['':'Select One...']}"/>
                                </td>
                            </tr> 
                                                                                  
                        </tbody>
                    </table>
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <i class="icon-search icon-white">
                    </i>
                    ${message(code: 'default.button.search.label', default: 'Search')}
                </button>
                <button type="reset" class="btn">Cancel</button>
            </div>
            </fieldset>
            </g:form>
        </div>
    </body>
</html>
