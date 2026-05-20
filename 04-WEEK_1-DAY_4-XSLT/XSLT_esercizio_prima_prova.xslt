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
					<p>Year</p>
					<ul><xsl:value-of select="@year"/></ul>
					<p>Director</p>
					<ul><xsl:value-of select="director/name"/>-<xsl:value-of select="director/surname"/></ul>
					<p>Cast</p>
					<ul>
						<xsl:for-each select="cast/actor">
							<xsl:value-of select="name"/>-<xsl:value-of select="surname"/>
						</xsl:for-each>
					</ul>
					<p>Production</p>
					<ul>
						<xsl:for-each select="production">
							<xsl:value-of select="name"/>
						</xsl:for-each>
					</ul>
					<p>Length</p>
					<ul><xsl:value-of select="length"/></ul>
			
			
				</xsl:for-each>
			</ul>
		</list>
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>