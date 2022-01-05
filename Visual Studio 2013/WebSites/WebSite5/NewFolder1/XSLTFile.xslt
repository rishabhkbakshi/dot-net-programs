<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <html>
      <table>
        <xsl:for-each select="Candidates/Candidate">
          <tr>
            <td>
              <xsl:value-of select="Id"/>
            </td>
            <td>
              <xsl:value-of select="Name"/>
            </td>
          </tr>
        </xsl:for-each>

      </table>
    </html>

  </xsl:template>
</xsl:stylesheet>
