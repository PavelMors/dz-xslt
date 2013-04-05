

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <ul>
                <li><h2>Выбрать `item`'ы, у которых `value` совпадает
                    с порядковым номером в списке, умноженным на 10.:</h2>
                    <p><xsl:call-template name="first"/></p></li>

                <li><h2>Выбрать `item`'ы, у которых `value` больше, чем у
                    следующего за ним `item`'а.</h2>
                    <p><xsl:call-template name="second"/></p></li>

                <li><h2> Выбрать все "хорошие" ноды.:</h2>
                    <p><xsl:call-template name="third"/></p></li>

                <li><h2>Выбрать ноды, являющиеся и "хорошими", и "плохими".</h2>
                    <p><xsl:call-template name="fourth"/></p></li>

                <li><h2>Выбрать все ноды, не связанные с "плохими" нодами.</h2>
                    <p><xsl:call-template name="five"/></p></li>
            </ul>
        </html>

    </xsl:template>

    <xsl:template name="first">
        <xsl:apply-templates select="//item[value/text() = position()*10]"/>
    </xsl:template>

    <xsl:template name="second">
        <xsl:apply-templates select="//item[value/text() &gt; following-sibling::item[value/text()][1]]"/>
    </xsl:template>

    <xsl:template name="third">
        <xsl:apply-templates select="//item[position() = number(substring(//good,1,1)) or position() =
        number(substring(//good,3,1)) or position() = number(substring(//good,5,1)) ]"/>
    </xsl:template>

    <xsl:template name="fourth">
        <xsl:apply-templates select="//item[(position() = number(substring(//good,1,1)) or position() =
        number(substring(//good,1,1)) or position() = number(substring(//good,3,1))) and  (position() =
        number(substring(//bad,3,1)) or position() =
        number(substring(//bad,5,1)) or position() = number(substring(//bad,5,1)))]"/>
    </xsl:template>

    <xsl:template name="five">
        <xsl:apply-templates select="//item[position() != number(substring(//bad,1,1)) and position() !=
        number(substring(//bad,3,1)) and position() != number(substring(//bad,5,1)) ]"/>
    </xsl:template>

    <xsl:template match="//*">
        <p><xsl:value-of select="@id"/></p>
    </xsl:template>

</xsl:stylesheet>