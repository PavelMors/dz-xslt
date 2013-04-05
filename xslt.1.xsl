<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="items">
<xsl:apply-templates select="item"/>
<!--
    для каждого item'а вызовется один из нижеследующих шаблонов,
    спрашивается какой именно
-->
</xsl:template>

<xsl:template match="/item">
<xsl:text>1. </xsl:text>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="item[1]">
<xsl:text>2. </xsl:text>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="*/*[..//*[@current]]">
<xsl:text>3. </xsl:text>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="*[@*]">
<xsl:text>4. </xsl:text>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="*">
<xsl:text>5. </xsl:text>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="items/item">
<xsl:text>6. </xsl:text>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="item/@current">
<xsl:text>7. </xsl:text>
<xsl:apply-templates select="." mode="mode"/>
</xsl:template>

<xsl:template match="item[@current]">
<xsl:text>8. </xsl:text>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="item" mode="mode">
<xsl:text>9. </xsl:text>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="@item">
<xsl:text>10. </xsl:text>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="item[following-sibling::item[2]]">
<xsl:text>11. </xsl:text>
<xsl:apply-templates/>
</xsl:template>


</xsl:stylesheet>

<!--
Вызывает:

11. first second 8. third 6. last-->
