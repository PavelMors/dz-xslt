<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="@* | node()">
    <xsl:copy>
    <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
    </xsl:template>
    <xsl:template match="b">
    <xsl:element name="strong">
    <xsl:apply-templates select="@* | node()" />
    </xsl:element>
    </xsl:template>
    <xsl:template match="i">
        <xsl:element name="em">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="div[@class = 'code']">
        <xsl:element name="pre">
            <xsl:apply-templates select="* | node()" />
        </xsl:element>
    </xsl:template>
    <xsl:template match="div[@class = 'head']">
        <xsl:element name="h1">
            <xsl:apply-templates select="* | node()" />
        </xsl:element>
    </xsl:template>

    <xsl:template match="* | node()">
        <xsl:copy>
            <xsl:apply-templates select="* | node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="@class">
            <xsl:apply-templates select="* | node()" />
    </xsl:template>
    <xsl:template match="@style">
        <xsl:apply-templates select="* | node()" />
    </xsl:template>

    <xsl:template match="//div[@class ='code']//@* | //div[@class ='code']//node()">
        <xsl:copy>
            <xsl:apply-templates select="@*| node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="@*">
        <xsl:apply-templates select="@* | node()" />
    </xsl:template>





</xsl:stylesheet>
