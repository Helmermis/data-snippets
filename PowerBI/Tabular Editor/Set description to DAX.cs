// Adds the calculation of a given measure to the description - useful DQ models
foreach(var measure in Model.AllMeasures){
    measure.Description = measure.Expression;
};