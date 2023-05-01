// This is the basic functionality used to apply incremental refresh for a PowerBI Model

// First setup variables
RangeStart = #datetime(2021, 6, 9, 0, 0, 0)  //Exact dates doesn't matter as this will update automatically
RangeEnd = #datetime(2021, 6, 9, 0, 0, 0) 

//Apply the filter to the table to get the new table
let
    source = Sql.Databases("[Database server]"),
    database = source{[Name="[Database name]"]}[Data],
    table = database{[Schema="[Table Schema]",Item="[Table Name]"]}[Data],
    filtered = Table.SelectRows(table, each [Date Column] > RangeStart and [Date Colmn] <= RangeEnd)
in
    filtered

// Save model and apply incremental refresh policy