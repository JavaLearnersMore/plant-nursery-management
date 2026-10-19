<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="hasRole('ADMIN')">
    <jsp:include page="/WEB-INF/jsp/common/admin-header.jsp"/>
</sec:authorize>

<sec:authorize access="hasRole('USER')">
     <jsp:include page="/WEB-INF/jsp/common/user-header.jsp"/>
</sec:authorize>
