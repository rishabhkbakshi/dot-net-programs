<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <xsl:for-each select="//Employee">
      <div style="border:1px black solid;width:300px;margin:1px">

        <div>
          <b>Employee ID:</b>
          <xsl:value-of select="ID"/>
        </div>
        <div>
          <b>Name:</b>
          <xsl:value-of select="FirstName"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="LastName"/>
        </div>
        <div>
          <b>Department:</b>
          <xsl:value-of select="Dept"/>
        </div>

      </div>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>

