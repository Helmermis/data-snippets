// Creates a measures for every currently selected column and hides it afterwards - inspired by TE website
// Comment out measures as needed
foreach(var col in Selected.Columns)
{
    var sumMeasure = col.Table.AddMeasure(
        "Sum of " + col.Name,                    // Name
        "SUM(" + col.DaxObjectFullName + ")",    // DAX expression
        col.DisplayFolder                        // Display Folder
    );
    
      var cntMeasure = col.Table.AddMeasure(
        "Count of " + col.Name,                    // Name
        "COUNt(" + col.DaxObjectFullName + ")",    // DAX expression
        col.DisplayFolder                          // Display Folder
    );

      var avgMeasure = col.Table.AddMeasure(
        "Avg of " + col.Name,                         // Name
        "AVERAGE(" + col.DaxObjectFullName + ")",     // DAX expression
        col.DisplayFolder                             // Display Folder
    );

      var minMeasure = col.Table.AddMeasure(
        "min of " + col.Name,                    // Name
        "MIN(" + col.DaxObjectFullName + ")",    // DAX expression
        col.DisplayFolder                        // Display Folder
    );

      var maxMeasure = col.Table.AddMeasure(
        "Max of " + col.Name,                    // Name
        "MAX(" + col.DaxObjectFullName + ")",    // DAX expression
        col.DisplayFolder                        // Display Folder
    );


    // Set the format string on the new measure:
    sumMeasure.FormatString = "0.00";
    avgMeasure.FormatString = "0.00";
    cntMeasure.FormatString = "0.00";
    minMeasure.FormatString = "0.00";
    maxMeasure.FormatString = "0.00";

    // Provide some documentation:
    sumMeasure.Description = "This measure is the sum of column " + col.DaxObjectFullName;
    avgMeasure.Description = "This measure is the avg of column " + col.DaxObjectFullName;
    cntMeasure.Description = "This measure is the cnt of column " + col.DaxObjectFullName;
    minMeasure.Description = "This measure is the min of column " + col.DaxObjectFullName;
    maxMeasure.Description = "This measure is the max of column " + col.DaxObjectFullName;


    // Hide the base column:
    col.IsHidden = true;
}