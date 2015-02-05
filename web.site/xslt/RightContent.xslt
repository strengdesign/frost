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
<xsl:variable name="imageRoot" select="$currentPage/videoImagePlaceholder" />

<xsl:template match="/">

<!-- start writing XSLT -->
<xsl:if test="$currentPage/frrRelatedInformation != ''">
    <div class="right-list">
		<h3>Related Info</h3>
        <xsl:value-of select="$currentPage/frrRelatedInformation" disable-output-escaping="yes" />
    </div><!-- /right-list-->
</xsl:if>

<xsl:if test="$currentPage/frrContentQuote != ''">
    <div id="right-page-content">
        <span id="quote-right"><xsl:value-of select="$currentPage/frrContentQuote" disable-output-escaping="yes" />
        <xsl:if test="$currentPage/frrQuoteAttribution !=''"><div style="font-size: 70%; line-height:16px !important;">&nbsp;-&nbsp;<xsl:value-of select="$currentPage/frrQuoteAttribution" /></div></xsl:if></span>
    </div>
</xsl:if>

<xsl:if test="$currentPage/frrVideoLink != ''">
    <div class="video">
         <script type='text/javascript' src='/scripts/jwplayer.js'></script>
         <ul>
            <li class="videoPlayer_Holder">
                <div id="1435_wrapper">
                    <input type="hidden" name="jwFile" value="{$currentPage/frrVideoLink}"/>
                    <xsl:if test="$imageRoot != ''">
                        <xsl:element name="input">
                            <xsl:attribute name="hidden"></xsl:attribute>
                            <xsl:attribute name="name">jwThumb</xsl:attribute>
                            <xsl:attribute name="value">
                            	<xsl:value-of select="umbraco.library:GetMedia($imageRoot, 0)/umbracoFile" />
                            </xsl:attribute>                                        
                        </xsl:element>
                    </xsl:if>
                </div>
                <strong><xsl:value-of select="$currentPage/frrVideoCaption" /></strong><br />
           </li>         
        </ul>    
    </div><!-- /video -->
</xsl:if>

</xsl:template>

</xsl:stylesheet>