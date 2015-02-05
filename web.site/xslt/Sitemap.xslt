<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:frr="urn:frr" xmlns:PS.XSLTsearch="urn:PS.XSLTsearch" 
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets frr PS.XSLTsearch ">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>

<xsl:variable name="maxLevelForSitemap" select="4"/>

<xsl:template match="/">
    <div id="sitemap"> 
        <xsl:call-template name="drawNodes">  
        	<xsl:with-param name="parent" select="$currentPage/ancestor-or-self::* [@isDoc and @level=1]"/>  
        </xsl:call-template>
    </div>
</xsl:template>
    
<xsl:template name="drawNodes">
    <xsl:param name="parent"/> 
    
    <xsl:if test="umbraco.library:IsProtected($parent/@id, $parent/@path) = 0 or (umbraco.library:IsProtected($parent/@id, $parent/@path) = 1 and umbraco.library:IsLoggedOn() = 1)">
        <ul class="sitemap">
        	<xsl:for-each select="$parent/* [@isDoc and string(umbracoNaviHide) != '1' and @level &lt;= $maxLevelForSitemap]"> 
                <li>  
                    <a href="{umbraco.library:NiceUrl(@id)}"><xsl:value-of select="@nodeName"/></a>
                     
                    <xsl:if test="count(./* [@isDoc and string(umbracoNaviHide) != '1' and @level &lt;= $maxLevelForSitemap and name()!='Document' and name()!='DocumentsFolder']) &gt; 0">   
                        <xsl:call-template name="drawNodes">    
                        	<xsl:with-param name="parent" select="."/>    
                        </xsl:call-template>  
                    </xsl:if> 
                </li>
            </xsl:for-each>
        </ul>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>