/* ****************************************************************** */
/* Mazda Style based on OSM BRIGHT                                    */
/* ****************************************************************** */

/* For basic style customization you can simply edit the colors and
 * fonts defined in this file. For more detailed / advanced
 * adjustments explore the other files.
 *
 * GENERAL NOTES
 *
 * There is a slight performance cost in rendering line-caps.  An
 * effort has been made to restrict line-cap definitions to styles
 * where the results will be visible (lines at least 2 pixels thick).
 */

/* ================================================================== */
/* FONTS
/* ================================================================== */

/* directory to load fonts from in addition to the system directories */
Map { font-directory: url(./fonts); }

/* set up font sets for various weights and styles */
@sans_lt:           "Open Sans Regular","DejaVu Sans Book","unifont Medium";
@sans_lt_italic:    "Open Sans Italic","DejaVu Sans Italic","unifont Medium";
@sans:              "Open Sans Semibold","DejaVu Sans Book","unifont Medium";
@sans_italic:       "Open Sans Semibold Italic","DejaVu Sans Italic","unifont Medium";
@sans_bold:         "Open Sans Bold","DejaVu Sans Bold","unifont Medium";
@sans_bold_italic:  "Open Sans Bold Italic","DejaVu Sans Bold Italic","unifont Medium";

/* Some fonts are larger or smaller than others. Use this variable to
   globally increase or decrease the font sizes. */
/* Note this is only implemented for certain things so far */
@text_adjust: 0;

/* ================================================================== */
/* LANDUSE & LANDCOVER COLORS
/* ================================================================== */

@land:              #333;
@water:             #666;
@grass:             #777;
@beach:             #999;
@park:              #777;
@cemetery:          #777;
@wooded:            #777;
@agriculture:       #777;

@building:          #888;
@hospital:          #888;
@school:            #888;
@sports:            #777;

@residential:       @land * 0.98;
@commercial:        @land * 0.97;
@industrial:        @land * 0.96;
@parking:           #999;

/* ================================================================== */
/* ROAD COLORS
/* ================================================================== */

/* For each class of road there are three color variables:
 * - line: for lower zoomlevels when the road is represented by a
 *         single solid line.
 * - case: for higher zoomlevels, this color is for the road's
 *         casing (outline).
 * - fill: for higher zoomlevels, this color is for the road's
 *         inner fill (inline).
 */

@motorway_fill:     #FF9326;
@motorway_line:     spin(darken(@motorway_fill,25),-10);
@motorway_case:     @motorway_line * 0.9;

@trunk_fill:        #FFDC73;
@trunk_line:        spin(darken(@trunk_fill,25),-10);
@trunk_case:        @trunk_line * 0.9;

@primary_fill:      #FFC926;
@primary_line:      spin(darken(@primary_fill,25),-10);
@primary_case:      @primary_line * 0.9;

@secondary_fill:    @primary_fill;
@secondary_line:    spin(darken(@secondary_fill,25),-10);
@secondary_case:    @secondary_line * 0.9;

@standard_line:     #000;
@standard_fill:     #fff;
@standard_case:     @land * 0.9;

@pedestrian_line:   @standard_line;
@pedestrian_fill:   #666;
@pedestrian_case:   @land;

@cycle_line:        @standard_line;
@cycle_fill:        #666;
@cycle_case:        @land;

@rail_line:         #999;
@rail_fill:         #fff;
@rail_case:         @land;

@aeroway:           #999;

/* ================================================================== */
/* BOUNDARY COLORS
/* ================================================================== */

@admin_2:           #333;

/* ================================================================== */
/* LABEL COLORS
/* ================================================================== */

/* We set up a default halo color for places so you can edit them all
   at once or override each individually. */
@place_halo:        fadeout(#fff,34%);

@country_text:      #333;
@country_halo:      @place_halo;

@state_text:        #222;
@state_halo:        @place_halo;

@city_text:         #111;
@city_halo:         @place_halo;

@town_text:         #222;
@town_halo:         @place_halo;

@poi_text:          #333;

@road_text:         #000;
@road_halo:         #fff;

@other_text:        #333;
@other_halo:        @place_halo;

@locality_text:     #444;
@locality_halo:     @land;

/* Also used for other small places: hamlets, suburbs, localities */
@village_text:      #444;
@village_halo:      @place_halo;

/* ****************************************************************** */


