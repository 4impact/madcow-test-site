

<%@ page import="au.com.ts4impact.madcow.test.site.domain.PostCodeReference" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'postCodeReference.label', default: 'PostCodeReference')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h2><g:message code="default.edit.label" args="[entityName]" /></h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${postCodeReferenceInstance}">
            <div class="errors">
                <g:renderErrors bean="${postCodeReferenceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${postCodeReferenceInstance?.id}" />
                <g:hiddenField name="version" value="${postCodeReferenceInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="locality"><g:message code="postCodeReference.locality.label" default="Locality" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: postCodeReferenceInstance, field: 'locality', 'errors')}">
                                    <g:textField name="locality" value="${postCodeReferenceInstance?.locality}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="postCode"><g:message code="postCodeReference.postCode.label" default="Post Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: postCodeReferenceInstance, field: 'postCode', 'errors')}">
                                    <g:textField name="postCode" value="${postCodeReferenceInstance?.postCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="state"><g:message code="postCodeReference.state.label" default="State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: postCodeReferenceInstance, field: 'state', 'errors')}">
                                    <g:select name="state.id" from="${au.com.ts4impact.madcow.test.site.domain.State.list()}" optionKey="id" value="${postCodeReferenceInstance?.state?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
