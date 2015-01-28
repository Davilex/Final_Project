# -*- coding: utf-8 -*-
# ---------------------------------------------------------------------------
# GPS_Points_to_csv.py
# Created on: 2015-01-27 16:01:12.00000
#   (generated by ArcGIS/ModelBuilder)
# Usage: GPS_Points_to_csv <Expression> <cross_section_locations_Tejeria> <Interval__units_are_in_units_of_input_> <Interpolate_values_at_the_point_locations> 
# Description: 
# ---------------------------------------------------------------------------

# Import arcpy module
print 'Load arcpy'
import arcpy

# Set path
rel_path = D:/GS_Final

# Check out any necessary licenses
arcpy.CheckOutExtension("spatial")

# Load required toolboxes
arcpy.ImportToolbox("ToolCreatePointsFromLines/Create Points From Lines/CreatePointsFromLines.pyt")

# Set Geoprocessing environments
arcpy.env.newPrecision = "DOUBLE"
arcpy.env.autoCommit = "1000"
arcpy.env.XYResolution = "0.001 Meters"
arcpy.env.XYDomain = ""
arcpy.env.scratchWorkspace = "D:\\GS_Final\\DEMs\\Step.gdb"
arcpy.env.cartographicPartitions = ""
arcpy.env.terrainMemoryUsage = "true"
arcpy.env.MTolerance = ""
arcpy.env.compression = "LZ77"
arcpy.env.coincidentPoints = "MEAN"
arcpy.env.randomGenerator = "0 ACM599"
arcpy.env.outputCoordinateSystem = ""
arcpy.env.rasterStatistics = "STATISTICS 1 1"
arcpy.env.ZDomain = ""
arcpy.env.transferDomains = "false"
arcpy.env.resamplingMethod = "NEAREST"
arcpy.env.snapRaster = ""
arcpy.env.projectCompare = "NONE"
arcpy.env.cartographicCoordinateSystem = ""
arcpy.env.configKeyword = ""
arcpy.env.outputZFlag = "Disabled"
arcpy.env.qualifiedFieldNames = "true"
arcpy.env.tileSize = "128 128"
arcpy.env.parallelProcessingFactor = ""
arcpy.env.pyramid = "PYRAMIDS -1 NEAREST DEFAULT 75 NO_SKIP"
arcpy.env.referenceScale = ""
arcpy.env.extent = "DEFAULT"
arcpy.env.XYTolerance = "0.001 Meters"
arcpy.env.tinSaveVersion = "CURRENT"
arcpy.env.nodata = "NONE"
arcpy.env.MDomain = ""
arcpy.env.spatialGrid1 = "0"
arcpy.env.cellSize = "MAXOF"
arcpy.env.outputZValue = ""
arcpy.env.outputMFlag = "Same As Input"
arcpy.env.geographicTransformations = ""
arcpy.env.spatialGrid2 = "0"
arcpy.env.ZResolution = ""
arcpy.env.mask = ""
arcpy.env.spatialGrid3 = "0"
arcpy.env.maintainSpatialIndex = "false"
arcpy.env.workspace = "D:\\GS_Final\\DEMs\\Step.gdb"
arcpy.env.MResolution = ""
arcpy.env.derivedPrecision = "DOUBLE"
arcpy.env.ZTolerance = ""

# Script arguments
Expression = arcpy.GetParameterAsText(0)
if Expression == '#' or not Expression:
    Expression = "\"id\" = 'TEJGUL039' OR \"id\" = 'TEJGUL041'" # provide a default value if unspecified

cross_section_locations_Tejeria = arcpy.GetParameterAsText(1)
if cross_section_locations_Tejeria == '#' or not cross_section_locations_Tejeria:
    cross_section_locations_Tejeria = "cross section locations Tejeria" # provide a default value if unspecified

Interval__units_are_in_units_of_input_ = arcpy.GetParameterAsText(2)
if Interval__units_are_in_units_of_input_ == '#' or not Interval__units_are_in_units_of_input_:
    Interval__units_are_in_units_of_input_ = "0.05" # provide a default value if unspecified

Interpolate_values_at_the_point_locations = arcpy.GetParameterAsText(3)
if Interpolate_values_at_the_point_locations == '#' or not Interpolate_values_at_the_point_locations:
    Interpolate_values_at_the_point_locations = "true" # provide a default value if unspecified

# Local variables:
Tej_Cross_Sect_39_41_ = cross_section_locations_Tejeria
Tej_39_41_line = Tej_Cross_Sect_39_41_
Tej_39_41_Points_Along_Line = Tej_39_41_line
Tej_39_41_Extracted_Point_Values = Tej_39_41_Points_Along_Line
Tej_39_41_Extracted_Point_Values__2_ = Tej_39_41_Extracted_Point_Values
Tej_39_41_Extracted_Point_Values__3_ = Tej_39_41_Extracted_Point_Values__2_
Tej_39_41_csv = Tej_39_41_Extracted_Point_Values__3_
Sort_Field = "y"
tejeria_dsm_medium_tif = "tejeria_dsm_medium.tif"
Value_Field = "RASTERVALU;Distance"
Delimiter = "COMMA"
Add_Field_Names_to_Output = "true"
Field_Name = "Distance"
Field_Name__2_ = "Distance"
Expression__2_ = "([OBJECTID] -1) * 0.05"
Field_Type = "FLOAT"

# Process: Select
arcpy.Select_analysis(cross_section_locations_Tejeria, Tej_Cross_Sect_39_41_, Expression)

# Process: Points To Line
arcpy.PointsToLine_management(Tej_Cross_Sect_39_41_, Tej_39_41_line, "", Sort_Field, "NO_CLOSE")

# Process: Create Points Along Lines
arcpy.CreatePointsAlongLines_alonglines(Tej_39_41_line, Tej_39_41_Points_Along_Line, Interval__units_are_in_units_of_input_, "VALUE", "NO_END_POINTS")

# Process: Extract Values to Points
arcpy.gp.ExtractValuesToPoints_sa(Tej_39_41_Points_Along_Line, tejeria_dsm_medium_tif, Tej_39_41_Extracted_Point_Values, Interpolate_values_at_the_point_locations, "VALUE_ONLY")

# Process: Add Field
arcpy.AddField_management(Tej_39_41_Extracted_Point_Values, Field_Name, Field_Type, "", "", "", "", "NULLABLE", "NON_REQUIRED", "")

# Process: Calculate Field
arcpy.CalculateField_management(Tej_39_41_Extracted_Point_Values__2_, Field_Name__2_, Expression__2_, "VB", "")

# Process: Export Feature Attribute to ASCII
arcpy.ExportXYv_stats(Tej_39_41_Extracted_Point_Values__3_, Value_Field, Delimiter, Tej_39_41_csv, Add_Field_Names_to_Output)
