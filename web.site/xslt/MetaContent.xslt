<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:frr="urn:frr" xmlns:PS.XSLTsearch="urn:PS.XSLTsearch" 
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets frr PS.XSLTsearch ">


<xsl:output method="html" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>

<xsl:template match="/">
    <title>
        <xsl:choose>
            <xsl:when test="$currentPage/metaTitle != ''"><xsl:value-of select="$currentPage/metaTitle" /></xsl:when>
            <xsl:otherwise>FR&amp;R <xsl:value-of select="$currentPage/@nodeName" /></xsl:otherwise>
        </xsl:choose>
    </title>
    
    <xsl:element name="meta">
        <xsl:attribute name="name">description</xsl:attribute>
        <xsl:attribute name="content">
            <xsl:choose>
                <xsl:when test="$currentPage/metaDescription != ''"><xsl:value-of select="$currentPage/metaDescription" /></xsl:when>
                <xsl:otherwise>Frost, Ruttenberg &amp; Rothblatt, P.C (FR&amp;R) <xsl:value-of select="$currentPage/@nodeName" /></xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:element>
</xsl:template>

</xsl:stylesheet>