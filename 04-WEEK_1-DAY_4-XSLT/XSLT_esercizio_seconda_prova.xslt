<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">

	<html>
	<body>
		<h1>Movies</h1>
		<list>
			<ul>
				<xsl:for-each select="movies/movie">
					<li>
						<strong><xsl:value-of select="title"/></strong>
					</li>
					<li>
						<p>Year: </p>
						<xsl:value-of select="@year"/>
					</li>
					<li>
						<p>Director: </p>
						<xsl:value-of select="director/name"/>-<xsl:value-of select="director/surname" />
					</li>
					<li>
						<p>Cast: </p>
						<xsl:for-each select="cast/actor">
							<li>
								<xsl:value-of select="name"/>-<xsl:value-of select="surname"  />
							</li>
						</xsl:for-each>
					</li>
					<li>
						<p>Production</p>
						<xsl:for-each select="production">
							<li>
								<xsl:value-of select="."/>
							</li>
						</xsl:for-each>
					</li>
					<li>
						<p>Length</p>
						<xsl:value-of select="substring-before(substring-after(length, 'T'), 'H')"/> h <xsl:value-of select="substring-before(substring-after(length, 'H'), 'M')"/> min
					</li>
			
			
				</xsl:for-each>
			</ul>
		</list>
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>