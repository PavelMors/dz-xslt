

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <ul>
                <li><h2>Выбрать все ноды, "глубина залегания" которых является четным числом
                    (для корневого элемента "глубина" равно 0.:</h2>
                    <p><xsl:call-template name="first"/></p></li>

                <li><h2>Выбрать все ноды, у которых есть "старший брат" и "младший брат":</h2>
                    <p><xsl:call-template name="second"/></p></li>

                <li><h2>Выбрать все ноды, у "деда" которых ровно 6 потомков:</h2>
                    <p><xsl:call-template name="third"/></p></li>

                <li><h2>Выбрать все ноды, у которых есть предок и потомок с одинаковым классом.`:</h2>
                    <p><xsl:call-template name="fourth"/></p></li>

                <li><h2>Вычислить максимальное и минимальное значение среди всех `item`'ов:</h2>
                    <p><xsl:call-template name="five"/></p></li>
            </ul>
        </html>

    </xsl:template>

    <xsl:template name="first">
        <xsl:apply-templates select="//item[position() mod 2 = 0 ]"/>
    </xsl:template>

    <xsl:template name="second">
        <xsl:apply-templates select="//item[following-sibling::* and preceding-sibling::*]"/>
    </xsl:template>

    <xsl:template name="third">
        <xsl:apply-templates select="//*[count(descendant::item)=6]"/>
    </xsl:template>

    <xsl:template name="fourth">
        <xsl:apply-templates select="//*[child::*[@class = parent::*/@class]]"/>
    </xsl:template>

    <xsl:template name="five">
        <xsl:apply-templates select="//item[last()][not (. &lt; //item)]/text() | //item[1][not (. &gt; //item)]/text()"/>
    </xsl:template>

    <xsl:template match="//*">
        <p><xsl:value-of select="@id"/></p>
    </xsl:template>

</xsl:stylesheet>