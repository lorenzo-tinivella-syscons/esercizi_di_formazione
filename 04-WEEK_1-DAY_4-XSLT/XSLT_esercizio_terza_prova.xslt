<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mov="http://www.esempio.it/movies" xmlns:per="http://www.esempio.it/person" exclude-result-prefixes="mov per">
	<xsl:template match="/">
		<html>
			<body>
				<h1>Movies</h1>
				<ul>
					
					<xsl:for-each select="mov:movies/mov:movie">
						<xsl:sort select="@year" order="descending"/>
						<li>
							<strong>
								<xsl:value-of select="mov:title"/>
							</strong>
							<ul>
								<li>Year: <xsl:value-of select="@year"/>
								</li>
								<li>Director: <xsl:value-of select="mov:director/per:name"/>&#160;<xsl:value-of select="mov:director/per:surname"/>
								</li>
								<li>Cast:
							<ul>
										<xsl:for-each select="mov:cast/mov:actor">
											<li>
												<xsl:value-of select="per:name"/>&#160;<xsl:value-of select="per:surname"/>
											</li>
										</xsl:for-each>
									</ul>
								</li>
								<li>Production:
							<ul>
										<xsl:for-each select="mov:production">
											<li>
												<xsl:value-of select="."/>
											</li>
										</xsl:for-each>
									</ul>
								</li>
								<li>Length: <xsl:value-of select="substring-before(substring-after(mov:length, 'T'), 'H')"/> h <xsl:value-of select="substring-before(substring-after(mov:length, 'H'), 'M')"/> min</li>
							</ul>
						</li>
					</xsl:for-each>
				</ul>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>