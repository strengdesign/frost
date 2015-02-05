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

<xsl:variable name="bannerFolder" select="1109"/>
<xsl:variable name="bannerFolderNodes" select="umbraco.library:GetMedia($bannerFolder, true())" />

<xsl:template match="/">



<!-- start writing XSLT -->
<div class="slider-wrapper theme-default">
    <div id="slider" class="nivoSlider">
    	<xsl:for-each select="$bannerFolderNodes/descendant::*[@nodeTypeAlias='Image']">
        	<xsl:variable name="image" select="./umbracoFile" />
            
            <img border="0">
                <xsl:attribute name="src">
                    <xsl:value-of select="$image"/>
                </xsl:attribute>
            </img>
        </xsl:for-each>
    </div>
</div>           

</xsl:template>

</xsl:stylesheet>