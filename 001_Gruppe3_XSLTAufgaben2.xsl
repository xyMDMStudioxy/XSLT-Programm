<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="iso-8859-1"/>

<xsl:template match="/CDSAMMLUNG">
	<xsl:apply-templates select="/CDSAMMLUNG/ALBUM">
		<xsl:sort select="translate(LABEL/text(),'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" data-type="text" order="ascending"/>
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="/CDSAMMLUNG/ALBUM">
	<xsl:for-each select="LABEL[not(.=preceding::LABEL)]">
		<xsl:text>&#10;</xsl:text>
		Von Label <xsl:value-of select="text()"/>
		<xsl:text> veroeffentlichte CDs:</xsl:text>
	</xsl:for-each>
			Titel: <xsl:value-of select="./TITEL/text()"/>		
</xsl:template>

</xsl:stylesheet>