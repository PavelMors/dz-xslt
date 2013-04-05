<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <ul>
            <li><h2>Выбрать людей, у которых есть телефон:</h2>
            <p><xsl:call-template name="hasPhone"/></p></li>

            <li><h2>Выбрать людей, у которых есть мобильный телефон:</h2>
            <p><xsl:call-template name="hasMob"/></p></li>

            <li><h2>Выбрать людей, у которых есть и рабочий, и мобильный телефон:</h2>
            <p><xsl:call-template name="hasPhoneMob"/></p></li>

            <li><h2>Выбрать людей, у которых email начинается с `login@`:</h2>
            <p><xsl:call-template name="hasLogin"/></p></li>

            <li><h2>Выбрать людей, у которых "длинный" логин (длиннее трех символов):</h2>
            <p><xsl:call-template name="hasLongLogin"/></p></li>

            <li><h2>Выбрать для каждого человека по одному его контакту -
                мобильный телефон, рабочий телефон или email (что-нибудь одно, все равно что):</h2>
            <p><xsl:call-template name="Login_Phone"/></p></li>

            <li><h2>Выбрать для каждого контакта его рабочий телефон, если нет рабочего, то мобильный,
                если нет никакого телефона, то email:</h2>
            <p><xsl:call-template name="Login_Any"/></p></li>
        </ul>
        </html>

    </xsl:template>

    <xsl:template name="hasPhone">
        <xsl:apply-templates select="//phone/parent::person/login"/>
    </xsl:template>

    <xsl:template name="hasMob">
        <xsl:apply-templates select="//phone[@type='mobile']/parent::person/login"/>
    </xsl:template>

    <xsl:template name="hasPhoneMob">
        <xsl:apply-templates select="//phone[@type='mobile' or @type='work']/parent::person/login"/>
    </xsl:template>

    <xsl:template name="hasLogin">
        <xsl:apply-templates select="//email[starts-with(., preceding-sibling::login)]/text()/parent::*"/>   <!--[starts-with(name(),'B')]-->
    </xsl:template>

    <xsl:template name="hasLongLogin">
        <xsl:apply-templates select="//login/text()[string-length() > 3]/parent::*"/>
    </xsl:template>

    <xsl:template name="Login_Phone">
        <xsl:for-each select="//login">
            <xsl:apply-templates select="self::*"/>
            <xsl:apply-templates select="parent::person/*[self::phone or self::email][1]"/>
            </xsl:for-each>
    </xsl:template>

        <xsl:template name="Login_Any">
            <xsl:for-each select="//login">
                <xsl:apply-templates select="self::*"/>
                <xsl:apply-templates select="parent::person/*[self::email or self::phone[@type='work'] or self::phone[@type='mobile']][last()]"/>
            </xsl:for-each>
        </xsl:template>


    <xsl:template match="//*">
        <p><xsl:value-of select="text()"/></p>
    </xsl:template>

</xsl:stylesheet>