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

<xsl:variable name="imageRoot" select="$currentPage/memberPhoto" />

<xsl:template match="/">

    <div id="center-head">
        <xsl:if test="$imageRoot != ''">
          <xsl:element name="img">
              <xsl:attribute name="src">
                <xsl:value-of select="umbraco.library:GetMedia($imageRoot, 0)/umbracoFile" />
              </xsl:attribute>
              <xsl:attribute name="class">headShot_Img</xsl:attribute>
              <xsl:attribute name="border">0</xsl:attribute>
              <xsl:attribute name="width">176</xsl:attribute>
              <xsl:attribute name="height">192</xsl:attribute>
              <xsl:attribute name="title">
                  <xsl:value-of select="$currentPage/memberFirstName" />&nbsp;<xsl:value-of select="$currentPage/memberLastName" /> Photo
              </xsl:attribute>                    
          </xsl:element>
        </xsl:if>

        <div id="quote">
            <span id="q-itself"><xsl:value-of select="$currentPage/memberQuote" /></span><br />
        </div>
        <div id="bio-name">
            <span id="e-name">
                <xsl:value-of select="$currentPage/memberFirstName" />&nbsp;<xsl:value-of select="$currentPage/memberLastName" /></span>
				<span id="accreditation"><xsl:if test="$currentPage/memberAccreditation !=''">,&nbsp;<xsl:value-of select="$currentPage/memberAccreditation" /></xsl:if></span>
            
            <br />
            <span id="position">
            	<xsl:value-of select="$currentPage/memberTitle" />
            </span>
        </div>
        <div id="white-back"><xsl:text> </xsl:text>
		</div>
    </div>
  
    <div id="wrapper-page-content">
        <div id="bio-left-page">
        	<xsl:if test="$currentPage/memberPhoneDirect != ''">
            	<span class="nlb">Direct Phone</span><xsl:value-of select="$currentPage/memberPhoneDirect" />
            </xsl:if>
            <xsl:if test="$currentPage/memberFax != ''">
            	<span class="nlb">Fax</span><xsl:value-of select="$currentPage/memberFax" />
            </xsl:if>
            <xsl:if test="$currentPage/memberMainPhone != ''">
            	<span class="nlb">Main</span><xsl:value-of select="$currentPage/memberMainPhone" />
            </xsl:if>
            <xsl:if test="$currentPage/memberEmail != ''">
            	<div class="bio-contacts"><img src="/images/style/mail.png" /><a href="mailto:{$currentPage/memberEmail}">Email me</a></div>
            </xsl:if>
            <xsl:if test="$currentPage/memberLinkedInLink != ''">
            	<div class="bio-contacts"><img src="/images/style/lin.png" /><a href="{$currentPage/memberLinkedInLink}">My LinkedIn Profile</a></div>
            </xsl:if>
            <xsl:if test="$currentPage/memberVCard != ''">
            	<div class="bio-contacts"><img src="/images/style/vcard.png" /><a href="{$currentPage/memberVCard}">Download vcard</a></div>
            </xsl:if>
        </div>
      
        <div id="bio-center-page-content-inner">
            <div id="page-content">
            	<xsl:value-of select="$currentPage/memberBio" disable-output-escaping="yes" />
            </div>
        </div>
    </div>    

</xsl:template>

</xsl:stylesheet>