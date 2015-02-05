<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:PS.XSLTsearch="urn:PS.XSLTsearch" xmlns:frr="urn:frr" 
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets PS.XSLTsearch frr">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>
<xsl:variable name="rootNode" select="$currentPage/ancestor-or-self::root" />
<xsl:variable name="newsNode" select="$rootNode/descendant::NewsFolder[@isDoc]" />
<xsl:variable name="industriesNode" select="$rootNode/descendant::IndustriesFolder[@isDoc]" />
<xsl:variable name="servicesNode" select="$rootNode/descendant::ServicesFolder[@isDoc]" />

<xsl:variable name="qIndustry" select="umbraco.library:RequestForm('qIndustry')" />
<xsl:variable name="qService" select="umbraco.library:RequestForm('qService')" />
<xsl:variable name="page" select="frr:param(umbraco.library:RequestQueryString('p'), 1)" />
<xsl:variable name="pageSize" select="5" />

<xsl:template match="/">

<div id="filters-results">
    <div id="keyword">
        <form action="/news-events/search-results.aspx" method="get">
           <div class="keyword-container">
			  <label class="title">Keyword Search:</label>
    	      <input type="text" class="searchinput" name="search" value="" />
		  </div>
          
          <div>
            <label class="title">Date Range:</label>
            <label for="from" >From:</label>
            <input type="text" id="from" name="searchFromDate" class="daterange" />
            <label for="to" class="to">to</label>
            <input type="text" id="to" name="searchToDate"  class="daterange" />
          	<input type="image" src="/images/misc/button-go.png" alt="submit" name="submit" class="button-go" />
          </div>
        </form>
    </div>	

    <form action="/news-events/news.aspx" method="post">
    
    <div class="greyBg_Holder">
		<div id="andor"><img src="/images/style/and-or.png" /></div>
		<h4>Filter by Industry:</h4> 
        <ul>
        <xsl:for-each select="$industriesNode/descendant::Industry[@isDoc]">
            <li>
			<label>
                &nbsp;
                <input type="checkbox" value="{@id}" class="checkBoxes" name="qIndustry" onclick="this.form.submit();">
                    <xsl:if test="contains($qIndustry, @id)">
                        <xsl:attribute name="checked">checked</xsl:attribute>
                    </xsl:if>
                </input>
                &nbsp;<xsl:value-of select="@nodeName" />
            </label>
			</li>
        </xsl:for-each>
		</ul>
</div>
<div class="greyBg_Holder">
	<h4>Filter by Services: </h4>
 		<ul>
            <xsl:for-each select="$servicesNode/descendant::Service[@isDoc]">
                <li><label>
                    &nbsp;
                    <input type="checkbox" value="{@id}" class="checkBoxes" name="qService" onclick="this.form.submit();">
                        <xsl:if test="contains($qService, @id)">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                        </xsl:if>
                    </input>
                    &nbsp;<xsl:value-of select="@nodeName" />
                </label>
                </li>
            </xsl:for-each> 
        </ul> 
</div>         
        
    </form>     
 
   </div>

  
    
    <xsl:variable name="matchingArticles" select="$newsNode/descendant::NewsArticle[@isDoc and string(umbracoNaviHide) != '1' and ($qIndustry='' or frr:ListInList($qIndustry, articleIndustries)) and ($qService='' or frr:ListInList($qService, articleServices))]" />     	


    <div class="nextHolder">
		<span id="results">RESULTS</span>
        <xsl:if test="count($matchingArticles) &gt; $pageSize">
              <xsl:choose>
                <xsl:when test="($page)*$pageSize &lt; count($matchingArticles)">
                    <span class="floatLeft"><a rel="next" href="?qIndustry={$qIndustry}&amp;p={$page + 1}&amp;qService={$qService}" style="background:none;">Next</a></span>
                </xsl:when>
                <xsl:otherwise>
                    <span class="floatLeft">Next</span>
                </xsl:otherwise>  
            </xsl:choose>
            <span class="floatLeft"> / </span>
			<xsl:choose>
                <xsl:when test="$page &gt; 1">
                    <span class="floatLeft"><a rel="prev" href="?qIndustry={$qIndustry}&amp;p={$page - 1}&amp;qService={$qService}" style="background:none;">Prev</a></span>
                </xsl:when>
                <xsl:otherwise>
                    <span class="floatLeft">Prev</span>
                </xsl:otherwise>  
            </xsl:choose>
        </xsl:if>        
      </div>
      
      <ul id="" class="newsList">
		  
        <xsl:for-each select="$matchingArticles">
			
          <xsl:sort select="articlePublishDate" order="descending" />
          
            <xsl:if test="position() &gt;= (($page - 1)*$pageSize) + 1 and position() &lt;= $page*$pageSize">
              <li class="">
                <xsl:variable name="tagsPreNodes">
                    <xsl:variable name="industryTags" select="articleIndustries" />
                    <xsl:variable name="industryTagsNodeIds" select="umbraco.library:Split($industryTags, ',')" />
                    <xsl:for-each select="$industryTagsNodeIds/value">
                      <xsl:copy-of select="umbraco.library:GetXmlNodeById(.)"/>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="tagNodes" select="msxml:node-set($tagsPreNodes)/*[@isDoc]" />
                
                <xsl:variable name="tagsServicePreNodes">
                    <xsl:variable name="serviceTags" select="articleServices" />
                    <xsl:variable name="serviceTagsNodeIds" select="umbraco.library:Split($serviceTags, ',')" />
                    <xsl:for-each select="$serviceTagsNodeIds/value">
                      <xsl:copy-of select="umbraco.library:GetXmlNodeById(.)"/>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="serviceTagNodes" select="msxml:node-set($tagsServicePreNodes)/*[@isDoc]" />
                
                <a href="{umbraco.library:NiceUrl(@id)}" class="titleLarge">
                	<xsl:value-of select="@nodeName" />
                </a> 
                <em><xsl:value-of select="umbraco.library:FormatDateTime(articlePublishDate, 'MMMM d, yyyy')"/></em>
                
				<xsl:choose>
                	<xsl:when test="string-length(articleTeaser)>0">
						<p>
							<xsl:value-of select="articleTeaser" /><br />
							<a href="{umbraco.library:NiceUrl(@id)}">Read More ></a>
						</p>
					</xsl:when>          
					<xsl:otherwise>			
						<p>
							<xsl:value-of select="umbraco.library:TruncateString(articleText, 150, '...')" disable-output-escaping="yes"/>
							<a href="{umbraco.library:NiceUrl(@id)}">Read More ></a>
						</p>
				    </xsl:otherwise>
				</xsl:choose>  
                
                
               <!-- <xsl:if test="count($tagNodes) &gt; 0">
                    Industry Tags: 
                    <span class="blueText">
                        <xsl:for-each select="$tagNodes">
                            <xsl:value-of select="@nodeName" />&nbsp;
                        </xsl:for-each>
                     </span>
                 </xsl:if>
                 
                 <xsl:if test="count($serviceTagNodes) &gt; 0">
                    <br />Service Tags: 
                    <span class="blueText">
                        <xsl:for-each select="$serviceTagNodes">
                            <xsl:value-of select="@nodeName" />&nbsp;
                        </xsl:for-each>
                     </span>
                 </xsl:if>-->
              </li>     
            </xsl:if>
        </xsl:for-each>    
    </ul>  
            
    <xsl:if test="count($matchingArticles) = 0">
        <p>Sorry, no results matched your criteria. Please try again.</p>
    </xsl:if>       
</xsl:template>

</xsl:stylesheet>