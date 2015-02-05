<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" 
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>
<xsl:variable name="rootNode" select="$currentPage/ancestor-or-self::root" />

<xsl:template match="/">

<ul id="mainnav">
    <li><a href="/">HOME</a></li>
    
    <xsl:for-each select="$rootNode/descendant::*[@isDoc and @level=2 and name()!='UserControl' and @nodeName!='Policy' and umbracoNaviHide !=1 and hideFromNav !=1]">
        <xsl:element name="li">
            <xsl:if test="position()=last()">
                <xsl:attribute name="class">lastli</xsl:attribute>
            </xsl:if>
        
            <a href="{umbraco.library:NiceUrl(@id)}"><xsl:value-of select="@nodeName" /></a>
            <xsl:call-template name="subNavigation">
                <xsl:with-param name="node" select="." />
            </xsl:call-template>        
        </xsl:element>
    </xsl:for-each>        
</ul>

</xsl:template>

<xsl:template name="subNavigation">
	<xsl:param name="node" />
    
    <xsl:variable name="topNode" select="$node/ancestor-or-self::*[@isDoc and @level=2 and string(umbracoNaviHide) != '1' and hideFromNav !=1]" />
    
    <xsl:choose>
        <xsl:when test="$node/self::*[@isDoc and name()='OurTeamPage']">
        	<ul class="subnav">            
                <xsl:for-each select="$node/descendant::* [@isDoc and string(umbracoNaviHide)!= '1' and name()='TeamType' and hideFromNav !=1]">
                    <li><a href="{umbraco.library:NiceUrl(@id)}"><xsl:value-of select="@nodeName" /></a></li>
                </xsl:for-each>
            </ul>
        </xsl:when>
        <xsl:otherwise>
            <xsl:if test="count($topNode/descendant::* [@isDoc and @level=3 and string(umbracoNaviHide) != '1' and hideFromNav !=1 and name()!='TeamMember' and name()!='NewsArticle' and name()!='Event' and name()!='Newsletter']) &gt; 0">
                <ul class="subnav">            
                    <xsl:for-each select="$topNode/descendant::* [@isDoc and string(umbracoNaviHide)!= '1' and hideFromNav !=1 and name()!='TeamMember' and name()!='NewsArticle' and name()!='Event' and name()!='Newsletter']">
                        <li><a href="{umbraco.library:NiceUrl(@id)}"><xsl:value-of select="@nodeName" /></a></li>
                    </xsl:for-each>
                </ul>
            </xsl:if>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>