
<%@ page import="au.com.ts4impact.madcow.test.site.domain.State" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'state.label', default: 'State')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav" role="navigation">
        <ul>
            <li><span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span></li>
            <li><span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span></li>
            </ul>
        </div>
        <div class="body">
            <h2><g:message code="default.list.label" args="[entityName]" /></h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'state.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="shortName" title="${message(code: 'state.shortName.label', default: 'Short Name')}" />
                            <g:sortableColumn property="longName" title="${message(code: 'state.longName.label', default: 'Long Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${stateInstanceList}" status="i" var="stateInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${stateInstance.id}">${fieldValue(bean: stateInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: stateInstance, field: "shortName")}</td>
                            <td>${fieldValue(bean: stateInstance, field: "longName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${stateInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
