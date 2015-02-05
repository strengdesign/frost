<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:PS.XSLTsearch="urn:PS.XSLTsearch" 
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets PS.XSLTsearch ">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>

<xsl:template match="/">
<div class="paddingDiv" id="newsletterPage">
	<a class="print" href="javascript:togglePrintPreview()"><img src="/images/style/printicon.gif" /></a>
    <h1 class="styled"><xsl:value-of select="$currentPage/newsletterTitle" /></h1>
    <em><xsl:value-of select="umbraco.library:FormatDateTime($currentPage/articlePublishDate, 'MMMM d, yyyy')"/></em>
    
    <div id="industry-tags">
        <xsl:variable name="preNodes">
            <xsl:variable name="industries" select="$currentPage/newsletterIndustries" />
            <xsl:variable name="nodeIds" select="umbraco.library:Split($industries, ',')" />
            
            <xsl:for-each select="$nodeIds/value">
              <xsl:copy-of select="umbraco.library:GetXmlNodeById(.)"/>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="nodes" select="msxml:node-set($preNodes)/*[@isDoc]" />
        
        <xsl:if test="count($nodes) > 0">
            <h2 class="styled">Industries: 
             
                <xsl:for-each select="$nodes">
                    <a href="{umbraco.library:NiceUrl(@id)}"><xsl:value-of select="@nodeName"/></a>&nbsp;  
                </xsl:for-each>
             </h2>
        </xsl:if>
    </div>    
    
    <div id="services-tags">
        <xsl:variable name="preNodes">
            <xsl:variable name="services" select="$currentPage/newsletterServices" />
            <xsl:variable name="nodeIds" select="umbraco.library:Split($services, ',')" />
            
            <xsl:for-each select="$nodeIds/value">
              <xsl:copy-of select="umbraco.library:GetXmlNodeById(.)"/>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="nodes" select="msxml:node-set($preNodes)/*[@isDoc]" />
        
        <xsl:if test="count($nodes) > 0">
            <h2 class="styled">Services:
             
                <xsl:for-each select="$nodes">
                    <a href="{umbraco.library:NiceUrl(@id)}"><xsl:value-of select="@nodeName"/></a>&nbsp; 
                </xsl:for-each>
            </h2>
        </xsl:if>
    </div>  
    
    <p><xsl:value-of select="$currentPage/newsletterText" disable-output-escaping="yes" /></p>

</div>

</xsl:template>

</xsl:stylesheet>