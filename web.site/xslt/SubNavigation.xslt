<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:PS.XSLTsearch="urn:PS.XSLTsearch" 
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets PS.XSLTsearch ">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:variable name="topNode" select="$currentPage/ancestor-or-self::*[@isDoc and @level=2 and string(umbracoNaviHide) != '1' and hideFromNav !=1]" />
<xsl:variable name="rootNode" select="$currentPage/ancestor-or-self::root" />

<xsl:param name="currentPage"/>

<xsl:template match="/">
	<xsl:if test="$currentPage/self::*[@isDoc and name()!='TeamMember']">
        <xsl:if test="count($topNode/descendant::* [@isDoc and @level=3 and string(umbracoNaviHide) != '1' and hideFromNav !=1 and name()!='NewsArticle' and name()!='Event' and name()!='Newsletter']) &gt; 0">
            <div class="sub-menu">
            	<xsl:element name="ul">
                	<xsl:attribute name="class">
                    	<xsl:choose>
                        	<xsl:when test="$currentPage/self::*[@isDoc and name()='ServicesFolder' or name()='IndustriesFolder' or name()='Industry' or name()='Service']">sub-menu-ul</xsl:when>
                            <xsl:otherwise>sub-menu-ul sub-menu-ul-sec</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>                 
                    
                    <xsl:for-each select="$topNode/descendant::* [@isDoc and string(umbracoNaviHide)!= '1' and hideFromNav !=1 and name()!='NewsArticle' and name()!='Event' and name()!='Newsletter']">
                        <xsl:call-template name="navItem">
                            <xsl:with-param name="node" select="." />
                        </xsl:call-template>
                    </xsl:for-each>
                </xsl:element>
            </div>
        </xsl:if>
    </xsl:if>
</xsl:template>

<xsl:template name="navItem">
	<xsl:param name="node" />
	
    <xsl:if test="./self::*[@isDoc and name()!='TeamMember']">        
        <xsl:element name="li">
            <xsl:attribute name="class">
            	<xsl:choose>
                	<xsl:when test="$currentPage/@id = current()/@id">current</xsl:when>
                    <xsl:when test="contains($currentPage/@path, current()/@id)">current</xsl:when>
                    <xsl:otherwise></xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            
            <a href="{umbraco.library:NiceUrl(@id)}"><xsl:value-of select="@nodeName"/></a>
        </xsl:element>
    </xsl:if>
</xsl:template>

</xsl:stylesheet> 