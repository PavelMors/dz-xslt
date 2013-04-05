<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template  match="i | b">
        <xsl:copy>
            <xsl:apply-templates select="* | node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="*">
            <xsl:apply-templates select="* | node()" />
    </xsl:template>
</xsl:stylesheet>
