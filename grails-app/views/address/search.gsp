
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
        <div class="nav" role="navigation">
            <ul>
            <li><span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span> </li>
            <li><span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span></li>
            </ul>
        </div>               
        <div class="body">
            <h2><g:message code="default.search.label" args="[entityName]" /></h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${companyInstance}">
            <div class="errors">
                <g:renderErrors bean="${companyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="showSearchResults" method="post" >
                <fieldset class="form">
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="addressLines"><g:message code="address.addressLines.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textField name="addressLines"/>
                                </td>                                                        
                            </tr>  
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="postCode"><g:message code="address.postCode.label" default="Post Code" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textField name="postCode"/>
                                </td>                                                        
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="suburb"><g:message code="address.suburb.label" default="Suburb" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:textField name="suburb"/>
                                </td>                                                        
                            </tr>  
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state"><g:message code="address.state.label" default="State" /></label>                                    
                                </td>
                                <td valign="top" class="value">
                                    <g:select                                      
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
                </div>
                </fieldset>
            <fieldset class="buttons">
                <input class="list" type="submit" value="${message(code: 'default.button.search.label', default: 'Search')}" />
            </fieldset>
            </g:form>
        </div>
    </body>
</html>
