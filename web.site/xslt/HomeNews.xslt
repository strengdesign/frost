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

<xsl:variable name="newsNode" select="$currentPage/descendant::NewsFolder[@isDoc]" />

<xsl:template match="/">

<div id="whats-new">
	<xsl:for-each select="$newsNode/descendant::*[@isDoc and articleFeatured = 1 and (name()='NewsArticle' or name()='Event' or name()='Newsletter')]">
        <xsl:sort select="articlePublishDate" order="descending" />

        <xsl:if test="position() &lt;= 5">
        	<xsl:call-template name="printEntry">
                <xsl:with-param name="node" select="." />
            </xsl:call-template>  
        </xsl:if>
    </xsl:for-each>
    
    <xsl:if test="count($newsNode/descendant::*[@isDoc and articleFeatured = 1 and (name()='NewsArticle' or name()='Event' or name()='Newsletter')]) &lt; 5">
    	<xsl:variable name="loop-count">
        	<xsl:value-of select="5-count($newsNode/descendant::*[@isDoc and articleFeatured = 1 and (name()='NewsArticle' or name()='Event' or name()='Newsletter')])" />
        </xsl:variable>
    
        <xsl:for-each select="$newsNode/descendant::*[@isDoc and articleFeatured != 1 and (name()='NewsArticle' or name()='Event' or name()='Newsletter')]">
            <xsl:sort select="articlePublishDate" order="descending" />
        
            <xsl:if test="position() &lt;= $loop-count">
                <xsl:call-template name="printEntry">
                    <xsl:with-param name="node" select="." />
                </xsl:call-template> 
            </xsl:if>   	
        </xsl:for-each>
        
    </xsl:if>
</div><!-- /whats-new -->

</xsl:template>

<xsl:template name="printEntry">
    <xsl:param name="node"/> 
    
    <div class="whats-new-entry">
        <div class="whats-new-date">
            <div class="month"><xsl:value-of select="umbraco.library:FormatDateTime($node/articlePublishDate, 'MMM')"/></div>
            <xsl:value-of select="umbraco.library:FormatDateTime($node/articlePublishDate, 'dd')"/>
        </div>
        
    	<xsl:choose>
        	<xsl:when test="$node/self::*[name()='NewsArticle']">
                <div class="whats-new-content">
                    <h4><xsl:value-of select="$node/articleTitle" /></h4>
                    <p><xsl:value-of select="$node/articleTeaser" /> <a href="{umbraco.library:NiceUrl($node/@id)}" class="read-more">Read more ></a></p> 
                </div>
            </xsl:when>
            <xsl:when test="$node/self::*[name()='Event']">
                <div class="whats-new-content">
                    <h4><xsl:value-of select="$node/eventTitle" /></h4>
                    <p><xsl:value-of select="$node/eventTeaser" /> <a href="{umbraco.library:NiceUrl($node/@id)}" class="read-more">Read more ></a></p> 
                </div>            
            </xsl:when>
            <xsl:when test="$node/self::*[name()='Newsletter']">
                <div class="whats-new-content">
                    <h4><xsl:value-of select="$node/newsletterTitle" /></h4>
                    <p><xsl:value-of select="$node/newsletterTeaser" /> <a href="{umbraco.library:NiceUrl($node/@id)}" class="read-more">Read more ></a></p> 
                </div>              
            </xsl:when>
        </xsl:choose>
    </div>
</xsl:template>

</xsl:stylesheet>