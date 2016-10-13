<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
      <h2>Akun ja Pojat Tehdas Työntekijät</h2>
        <table border="1">
          <tr bgcolor="#9acd32">
            <th>id</th>
            <th>etunimi</th>
            <th>sukunimi</th>
            <th>palkka</th>
            <th>työsuhde</th>
          </tr>
          <xsl:for-each select="tyontekijat/tyontekija">
            <xsl:if test="numero > 20">
            <tr>
              <td><xsl:value-of select="numero"/></td>
              <td><xsl:value-of select="etunimi"/></td>
              <td><xsl:value-of select="sukunimi"/></td>
              <td><xsl:value-of select="palkka"/></td>
              <td><xsl:value-of select="tyosuhde"/></td>
            </tr>
              </xsl:if>
          </xsl:for-each>
        </table>
  </xsl:template>
</xsl:stylesheet>
