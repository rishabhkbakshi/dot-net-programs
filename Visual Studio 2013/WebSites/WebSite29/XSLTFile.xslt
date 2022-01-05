<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:template match="/">
    <html>
      <body>
        <h2>My CD Collection</h2>
        <table border="1">
          <tr bgcolor="#9acd32">
            <th style="text-align:left">Title</th>
            <th style="text-align:left">Artist</th>
            <th>Country</th>
            <th>Company</th>
            <th>Price</th>
            <th>Year</th>
          </tr>
          <xsl:for-each select="catalog/cd[price &gt; 8]">
            <xsl:choose>
              <xsl:when test="price = 10.10">
                <tr>
                  <td style="background-color:red;">
                    <xsl:value-of select="title"/>
                  </td>
                  <td>
                    <xsl:value-of select="artist"/>
                  </td>
                  <td>
                    <xsl:value-of select="country"/>
                  </td>
                  <td>
                    <xsl:value-of select="company"/>
                  </td>
                  <td>
                    <xsl:value-of select="price"/>
                  </td>
                  <td>
                    <xsl:value-of select="year"/>
                  </td>
                </tr>
              </xsl:when>
              <xsl:when test="price = 10.10">
                <tr>
                  <td style="background-color:red;">
                    <xsl:value-of select="title"/>
                  </td>
                  <td>
                    <xsl:value-of select="artist"/>
                  </td>
                  <td>
                    <xsl:value-of select="country"/>
                  </td>
                  <td>
                    <xsl:value-of select="company"/>
                  </td>
                  <td>
                    <xsl:value-of select="price"/>
                  </td>
                  <td>
                    <xsl:value-of select="year"/>
                  </td>
                </tr>
              </xsl:when>
              <xsl:otherwise>
                <tr>
                  <td style="background-color:yellow;">
                    <xsl:value-of select="title"/>
                  </td>
                  <td>
                    <xsl:value-of select="artist"/>
                  </td>
                  <td>
                    <xsl:value-of select="country"/>
                  </td>
                  <td>
                    <xsl:value-of select="company"/>
                  </td>
                  <td>
                    <xsl:value-of select="price"/>
                  </td>
                  <td>
                    <xsl:value-of select="year"/>
                  </td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>

          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>


