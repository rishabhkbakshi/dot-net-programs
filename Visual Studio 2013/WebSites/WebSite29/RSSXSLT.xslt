<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <xsl:for-each select="//item">
      <div>
        <div>
          <A>
            <xsl:attribute name="href">
              <xsl:value-of select="link" />
            </xsl:attribute>
            <xsl:value-of select="title"/>
          </A>
        </div>
        <div>
          <xsl:value-of select="description"/>
        </div>
      </div>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>

