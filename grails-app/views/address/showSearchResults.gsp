
<%@ page import="au.com.ts4impact.madcow.test.site.domain.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.search.results.label" args="[entityName]" /></title>        
    </head>
    <body>
    <div class="nav" role="navigation">
        <ul>
            <li><span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span></li>
            <li><span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span></li>
        </ul>
        </div>        
        <div class="body">
            <h2><g:message code="default.search.results.label" args="[entityName]" /></h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table id="searchResults" >
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="Id" params="${params}"/>                    	    
                   	        <g:sortableColumn property="addressLine1" title="Address Line 1" params="${params}"/>                        
                            <g:sortableColumn property="addressLine2" title="Address Line 2" params="${params}"/>                        
                   	        <g:sortableColumn property="postCode.locality" title="Suburb" params="${params}"/>
                   	        <g:sortableColumn property="postCode.state" title="State" params="${params}"/>
                   	        <g:sortableColumn property="postCode.postCode" title="Post Code" params="${params}"/>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${addressInstanceList}" status="i" var="addressInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${addressInstance.id}">${addressInstance.id}</g:link></td>                        
                            <td>${fieldValue(bean:addressInstance, field:'addressLine1')}</td>                        
                            <td>${fieldValue(bean:addressInstance, field:'addressLine2')}</td>                       
                            <td>${fieldValue(bean:addressInstance, field:'postCode.locality')}</td>
                            <td>${fieldValue(bean:addressInstance, field:'postCode.state.name')}</td>                        
                            <td>${fieldValue(bean:addressInstance, field:'postCode.postCode')}</td>                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${params.totalAddresses}" params="${params}"/>
            </div>
        </div>
    </body>
</html>