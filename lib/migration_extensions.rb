module MigrationExtensions
  def add_gist_index(table)
    execute %{
      CREATE INDEX #{ table }_gist_index ON #{ table } USING gist (
        ST_GeographyFromText(
          'SRID=4326;POINT(' || #{ table }.longitude || ' ' || #{ table }.latitude || ')'
        )
      )
    }
  end

  def add_gin_index(table, column)
    execute "CREATE INDEX #{ table }_#{ column }_gin_index ON #{ table } USING gin(#{ column })"
  end
end
