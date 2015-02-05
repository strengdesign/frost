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

<xsl:variable name="rootNode" select="$currentPage/ancestor-or-self::root" />
<xsl:variable name="topTeamNode" select="$rootNode/descendant::OurTeamPage[@isDoc and @level=2]" />
<xsl:variable name="teamTypesNode" select="$rootNode/descendant::TeamTypesFolder[@isDoc]" />

<xsl:template match="/">
	
    <xsl:choose>
    	<xsl:when test="$currentPage/self::*[@isDoc and @level=2]">
			<table cellspacing="3" cellpadding="5">
				
            <xsl:for-each select="$topTeamNode/descendant::TeamMember[@isDoc and umbracoNaviHide !=1]">
            	<xsl:sort select="./memberLastName" />
              <tr>
				<td style="padding-right:10px;">
					<a href="{umbraco.library:NiceUrl(@id)}"><xsl:value-of select="@nodeName" /></a>											
				</td>
				<td>
					<a href="mailto:{memberEmail}"><xsl:value-of select="memberEmail" /></a>
				</td>				
				<td>
					<xsl:value-of select="memberPhoneDirect" />  
				</td>
				<td style="padding-left:5px;padding-right:5px;">
					<a href="{memberVCard}" title="Download vCard">
						<img src="/images/style/vcard.png"/>
					</a>
				</td>
			  </tr>
            </xsl:for-each>
				
			</table>
        </xsl:when>
        <xsl:otherwise>
        	<xsl:variable name="matchingMembers" select="$topTeamNode/descendant::TeamMember[@isDoc and frr:ListInList($currentPage/@id, memberType)]" />    
            <table cellspacing="3" cellpadding="5">
            <xsl:for-each select="$matchingMembers">
              	<xsl:sort select="./memberLastName" />
              
                <xsl:variable name="tagsPreNodes">
                    <xsl:variable name="memberTags" select="memberType" />
                    <xsl:variable name="memberTagsNodeIds" select="umbraco.library:Split($memberTags, ',')" />
                    <xsl:for-each select="$memberTagsNodeIds/value">
                      <xsl:copy-of select="umbraco.library:GetXmlNodeById(.)"/>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="tagNodes" select="msxml:node-set($tagsPreNodes)/*[@isDoc]" />
				 <tr>
					<td style="padding-right:10px;">
						<a href="{umbraco.library:NiceUrl(@id)}"><xsl:value-of select="@nodeName" /></a>											
					</td>
					<td>
						<a href="mailto:{memberEmail}"><xsl:value-of select="memberEmail" /></a>
					</td>				
					<td>
						<xsl:value-of select="memberPhoneDirect" />  
					</td>
					<td style="padding-left:5px;padding-right:5px;">
						<a href="{memberVCard}" title="Download vCard">
							<img src="/images/style/vcard.png"/>
						</a>
					</td>
				  </tr>
                	
            </xsl:for-each>     
			</table>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>