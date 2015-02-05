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

<xsl:choose>
	<xsl:when test="$currentPage/ancestor-or-self::*[@isDoc and name()='OurTeamPage' or name()='TeamMember' or name()='TeamType']">
    	<div id="head-team-title"></div>
    </xsl:when>
    <xsl:when test="$currentPage/ancestor-or-self::*[@isDoc and name()='ServicesFolder' or name()='Service']">
    	<div id="head-services-title"></div>
    </xsl:when>
    <xsl:when test="$currentPage/ancestor-or-self::*[@isDoc and name()='GeneralPage' and @nodeName='About Us']">
    	<div id="head-heading-title"></div>
    </xsl:when>  
    <xsl:when test="$currentPage/ancestor-or-self::*[@isDoc and name()='IndustriesFolder' or name()='Industry']">
    	<div id="head-industries-title"></div>
    </xsl:when>  
    <xsl:when test="$currentPage/ancestor-or-self::*[@isDoc and name()='GeneralPage' and @nodeName='Resources']">
    	<div id="head-resources-title"></div>
    </xsl:when>   
    <xsl:when test="$currentPage/ancestor-or-self::*[@isDoc and name()='GeneralPage' and @nodeName='Careers']">
    	<div id="head-careers-title"></div>
    </xsl:when>
    <xsl:when test="$currentPage/ancestor-or-self::*[@isDoc and name()='UserControl' and @nodeName='Contact Us']">
    	<div id="head-contact-title"></div>
    </xsl:when>   
    <xsl:when test="$currentPage/ancestor-or-self::*[@isDoc and name()='NewsFolder' or name()='News &amp; Events']">
    	<div id="head-news-title"></div>
    </xsl:when>
    <xsl:when test="$currentPage/self::*[@isDoc and @id='1099']">
    	<div id="head-search-title"></div>
    </xsl:when>                
    <xsl:otherwise>
    	<div id="head-heading-title"></div>
    </xsl:otherwise>
</xsl:choose>


</xsl:template>

</xsl:stylesheet>