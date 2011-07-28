<%
    String tabIndex = xssUtil.getCleanInput(request, QueryBuilder.TAB_INDEX);
    if (tabIndex == null) {
        tabIndex = QueryBuilder.TAB_VISUALIZE;
    } else {
        tabIndex = URLEncoder.encode(tabIndex);
    }
%>

<!-- Include Dynamic Query Javascript -->
<script type="text/javascript" src="js/dynamicQuery.js"></script>

<%@ page import="org.mskcc.portal.servlet.QueryBuilder" %>
<%@ page import="java.net.URLEncoder" %>
<script type="text/javascript">

    // Store the currently selected options as global variables;
    window.cancer_study_id_selected = '<%= cancerTypeId%>';
    window.case_set_id_selected = '<%= caseSetId %>';
    window.gene_set_id_selected = '<%= geneSetChoice %>';

    //  Store the currently selected genomic profiles within an associative array
    window.genomic_profile_id_selected = new Array();
    <%
        for (String geneticProfileId:  geneticProfileIdSet) {
            out.println ("window.genomic_profile_id_selected['" + geneticProfileId + "']=1;");
        }
    %>
</script>

<div class="main_query_panel">

    <form id="main_form" action="index.do" method="get">
    <input type="hidden" id="<%= QueryBuilder.TAB_INDEX %>" name="<%= QueryBuilder.TAB_INDEX %>"
           value="<%= tabIndex %>">
        
    <%@ include file="step1_json.jsp" %>
    <%@ include file="step2_json.jsp" %>
    <%@ include file="step3_json.jsp" %>
    <%@ include file="step4_json.jsp" %>
    <%@ include file="step5_json.jsp" %>
    <p/>
    <input type=submit name="<%= QueryBuilder.ACTION%>" value="<%= QueryBuilder.ACTION_SUBMIT %>"/>

    <!--
    <p><small><a id='json_cancer_studies' href="">Toggle Experimental JSON Results</a></small></p>
    <div class="markdown" style="display:none;" id="cancer_results">
    </div>
    -->
</div>