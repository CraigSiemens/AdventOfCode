import Foundation

extension Day5: HasInput {
    public static var input: String {
        return """
        FBFBFBFRRL
        BFBBFFFRRL
        FFBFFFFRLL
        BFFFBBBRLL
        BBFFBFBLLR
        FFFFBBBRLR
        FBBBBFFLRR
        FBFFFBFRLL
        FFFFBFFRRR
        FFFBBFFRLR
        BFBBBBFRLL
        FBBFBFFLLL
        FFFBFFBRRL
        BFBFFBBLLL
        FFBBFBBLLR
        FFBFFBBRRL
        BFBFBBBRRL
        FFBFFBBLLL
        BFFFBBBLRR
        BFBFFBFRRR
        BFFBFFBRRL
        BFBFFFFLLR
        FFFFBBBLRR
        FFBBFBFRRR
        BFFFBFBLLL
        FBFFBBBRRL
        FBBBBBBRRL
        BBFBFFBLLL
        BFFBFFFLLL
        FBFFBBFLLR
        FBFBFFBLRL
        FFBFFFBRLR
        FFBBBBFRLL
        FBFBFFFLRL
        FBBFBBFRLR
        FFBBBBBLLL
        FBFFBFBLLL
        FBFFFBBRRR
        BBFFBBFRRR
        FBFFBFBRLL
        FBBBFBBRRR
        BFFFBFFRRL
        FFBFBFBLLL
        FBFBFFFRLR
        FBBFBBBLLL
        FFFBBBBLLL
        FFFBFFBLLL
        BFBFFBBLRR
        FFBBFFFLLR
        FFBBBBBLRR
        BBFFFFBRLL
        BFFFBBFLRR
        BFBFFFBRRR
        FBBFFFBLRR
        BFBFBFFLLL
        FBBFFBFRLL
        FFBBBBFLRL
        BFFFFBFLLR
        FBFBBBFLLR
        FFFBBFBRLL
        FFBFFBBRLL
        BFBBFFBRRR
        FFFFBFBRLL
        FBFFFBFRRL
        FBBFFBBLLR
        FFBBFFBRRL
        FBBBFFBRRL
        BFFFBBFLRL
        FFBBBFBRRL
        FFFFBFBRRL
        BFBFFBFLLR
        FBBBBBFLLR
        BFFBFFFLRL
        FFFBFBFRRL
        FFFFBBBRLL
        BFFFBFFRLL
        BFFFBBBLLR
        BBFFFFFRLR
        BBFFFBFRLR
        BFBBFBBLLL
        FBFBBBFRLL
        BFFBBFFRLR
        BFFBFBBLRR
        FFBFBBFRRR
        BFBBBFFLRR
        BFFBFBBRRR
        BBFFFFFRRL
        BBFFBFBLLL
        BFBBFBFLRL
        FBBFFBFLLL
        FBBFBFFRLL
        FBBBBFFLRL
        FBBFBFFRRL
        FFFBFBFLLL
        FFBFFBFRLR
        FBBFFFBLLR
        FFFFBFBLRL
        FFFBBFBLRR
        FFBBBFFRLL
        FBFBBBFRRR
        BFBBBBFLLL
        BBFFBFFLRL
        FFFFBBBLLL
        FFBFBBBLLL
        BFBFBFFRRL
        FBFFBBFRRR
        FFFBBBBLRR
        FBBBBFBLLL
        FBBBBBBLRL
        FFBFFFBLRR
        BBFBFFBRRL
        BFBBFFBLLL
        BFFFFFFLRL
        BFFFFBFRLR
        FBFFFFFLLL
        BFFBBFFRRL
        BFBFBBFLLL
        BFBFBFBRLL
        FBFBFBBLLL
        BFFFBFFLLR
        FBBBFBBLLL
        FFBFFFBRLL
        FBBFFBBLRR
        FFBFBFBRLL
        BFFFBBBRLR
        BBFFBFBLRL
        BBFFBFBLRR
        BBFFBBFRLL
        BFFFFBBRRR
        FBFBBFFLRR
        FFBBBBBRRR
        BFBBBFFRLL
        BFBBFFFLRR
        FBFBFFBRRR
        FFBFFBFLRR
        BFBBBBBLRL
        FBFFFFBRRR
        FFBFFFFLLR
        BFFFFFBLRL
        FFBBBBFLLL
        FBFFFBBLRL
        BBFFBFFLLR
        FBBFFFBRLL
        BBFFBBBRLR
        FBFFFBFLRR
        BFFBBFBRRL
        FBBFFFFRLR
        BFFBBBFLRR
        FFBBFBBLRR
        BFBBBBFRRL
        FBFBBBBLLL
        BBFFBFBRRR
        FFFFBBFRLR
        BFBBBBFRLR
        FBBFFBFRLR
        BFBFFFBRLL
        FBFBFBBRRL
        FBFBBFBRLR
        BFBBBBBRRR
        BBFBFFBRLR
        FFBFFFBLRL
        FBBFFBFLLR
        BFFBFBFLLL
        BFFFFFBLLL
        BFBFFBBRLR
        FBBBBFBRLR
        BFBBBFBRLR
        BFBBFBBRLL
        BBFFFFBLLR
        FBFBFBFRLL
        FFFBBFBRRL
        FBFFBBFRLR
        FFFBBBBLLR
        BBFFBFFLRR
        FBBBFFFRRL
        BBFFBBFLLL
        BBFFFBFRLL
        FFBFBBFLRR
        BFBFFFBLRL
        FFBFBBFLLR
        FBBBBFFLLL
        FFBBBBFLRR
        FFFBFBBLRL
        FFFBBFFLRR
        FBBBFBBRLL
        FFBFFFFLLL
        FBBBFBFLRL
        FBFBFBFRRR
        FFBBFBFLRR
        FFBFBBFRRL
        FBFBBFFLRL
        BFFFBBBRRL
        BFBBBBFLLR
        FFFBBFFRRR
        BFBBFBBRRL
        BBFFFBBLRL
        BFBFBFFLRR
        FFFFBFFLRL
        BFBFFBFRLL
        BFBFBBFRLR
        BFFBFFFLRR
        FBFFFFFLRR
        BFFBFBFRLL
        FBBFBFFLRR
        FBFBBBBLRR
        BFFFFFFRLR
        FBBFBBBRRL
        BFFBFBFRLR
        FFFBFFFRRL
        FFBFFFFRLR
        BFFBFFBLLL
        FFBFBBFLRL
        BBFFFFFLRL
        FFFBBFFRRL
        FFBBBFFLRL
        BFBBFFBLRR
        FFBBFBFRLR
        FFBFBFFRRR
        FFFFBFFLRR
        FBBBBFBRRL
        BFBBFBBLRL
        BFFBBFFLLR
        FBFFFBFLLR
        FBFBFFBLRR
        FFBBFBBRLL
        FBFFFFFRLR
        FFBBBBFRRL
        FBBFFBFRRR
        FFFFBBFRRR
        FBBBFFBLLL
        FFBBFBBLLL
        BFBFBFFRLL
        BFFFBBFLLL
        BFFBBFFRLL
        FBFBBFFRRL
        BBFBFFFLLR
        BBFBFFBLRR
        FBFFFFFRRR
        FBFFBFFRRR
        BFFBBFBRLR
        FBFBFBFLLL
        BFFBBBBLRR
        BFBBFBBRLR
        FFBBBFFLRR
        FBFBBBBRRR
        BFBBBBBRLL
        BFBFFBBRRR
        FBFBBFBRLL
        FBFFBFBLRL
        FBBFBBBRLL
        FBFBBBBLRL
        FBFFFBBLLR
        BBFFFBFRRL
        FBFBFBBRLL
        BFBBBBBRLR
        BFBFFFFRLR
        FBFBBFBLRR
        BFBBFBFRLR
        BBFFBBBLLL
        BFFFFFFRRR
        BFBBBFBLRL
        FBFBBFFLLR
        FBFBBFFRLR
        FFFBFBBLLR
        FFBBFFFRLL
        BFBFFFFLRR
        FFFFBBBRRL
        BFFFBFFRRR
        BFFFBFBRLL
        FFFFBFFRRL
        BFFFBBFRRL
        FFFBBFFLLL
        BFBBFFBRRL
        FBFBFFFRRR
        FBFBFBFLRL
        BFBFBFBLLL
        FBBBFFBRLL
        FBFFBBBLRL
        BFBFFFFRRL
        BFFBBFBLLL
        FBFFFBBRLR
        BBFBFFFRLL
        FFBFBFFLRL
        FBBFBBBLRL
        BBFBFFFLRR
        BBFBFFBRRR
        BFFBFFBRLR
        BBFFBBFRRL
        FBFBBBFLRR
        FBBFFFFLLL
        BFFBBFBLRR
        BFBFFFFLLL
        BFFBBBBRLL
        FFBFFBFLLL
        FBBBBFBLLR
        BBFFFBFLLR
        BFBBBFBRLL
        FBFFFFBRLR
        FFBBBFFRRL
        FFBFFFBRRR
        BFFBFFFRLL
        FFFBFBBLLL
        FFFBBBFLLL
        BFBBFBFRLL
        BFBFFFBRLR
        FBBFBBFRLL
        FBBBFBFRRL
        FFBFBFFRLR
        BFBBFBBLLR
        FBBFBFBRLR
        BBFFFBBLLL
        FBFBFFFLLL
        BBFBFFFRRR
        FBFBBFBLRL
        FFBBBFBRLR
        BFBBFFBRLR
        FBFFBBBLRR
        FFBBFFBRRR
        BBFFBFBRRL
        FFBBBFFRRR
        BFBFFBFLRL
        FBFFFFBLLL
        BBFFFFBRRL
        BBFFFFBLRR
        FFBBFFBRLL
        BFBBFFFLLL
        FBBFBFBLLL
        FBBBFFFLRL
        FBFBBBBRRL
        FFFBBBFRRR
        FFBFFBBRRR
        FBFFFFFLRL
        BFFBFBFLRR
        BBFFBBBRRR
        FBFFFFFRRL
        FBBFBFBLRR
        BFFBBBBLLL
        FBBBFFFLLR
        BFFFFBFLLL
        FFBFBFBLLR
        FBFFFBBRLL
        BFFFBFBRLR
        FBBBFBFLLR
        FBBBBFFLLR
        BFFFFBBLLR
        FFBBBBBRLR
        BFFFBFBLRR
        FBBBFFBLLR
        FBFFBFBRRL
        FBFBFBBRRR
        FBBBBBBLRR
        FFBBBBBRRL
        FBFFFFBLLR
        BBFBFFBRLL
        FFFBBBFRLR
        FBFFFBBLLL
        FBFFBBBLLR
        BFBFBBFRRL
        BBFFBFBRLL
        BFFFBBFRRR
        BFFBBFBLRL
        FBBBFBFLRR
        FFFBFBFRRR
        FFBBBFBLRR
        BFBFBBFRRR
        FFBBBFBRLL
        BFFFBBBLLL
        BFFFBFBRRL
        BFFBFBBRLL
        FBBFFFFLRL
        FFFFBFFRLR
        FFFBBBBRRL
        BFFBFBFRRL
        FFFBBFBRRR
        FFBFBFBLRR
        FFFFBBFLRL
        BBFFFFBLRL
        BFBBBBBRRL
        FBBBBBFLLL
        FBFFBFFLRL
        FFBFBBBRRR
        FBFBBBBRLL
        BBFFFBBRRL
        FFBBFBFRRL
        FFBBBFFRLR
        FFFBFBFRLL
        FBBFBFBLLR
        FFBBBBBLLR
        FBFBFFBLLR
        BFFFBBFRLR
        FFBBFFFRRL
        FFFFBBFLRR
        BBFFFFFRRR
        FFBBFFBLLR
        FBFFFFBLRR
        FFFFBFFRLL
        BFBBFFFRLL
        BFBBFFBRLL
        BBFFFBBRLR
        FFBFFFFRRR
        BFBFBFBRRR
        FFBBFBFLLR
        BFFBBBFRLL
        FBBBFFFRRR
        BFBBBBBLLL
        FFBFFFFLRR
        FBFFFFBRLL
        BFFFFBFRRL
        FBBBBBBRRR
        FFFFBBFLLL
        FBFFBFFLRR
        FFFBBBFRRL
        FBBFFFBRRL
        BFBFBBBRLL
        BBFFFBFLRR
        FBBFBFBRRL
        FBBFFFFLRR
        BFBBBFBLLL
        BFFFFFBRRL
        BBFFFBBLRR
        BFFFFFBLRR
        BFBBBBFLRL
        FBFBFFBRRL
        BBFFFFFLRR
        FFFFBBBLLR
        BFBBFBFLLL
        FBBFFFBRRR
        FFBBBFBRRR
        FFBFBFFRLL
        FFBBFBBLRL
        FBBFFBFRRL
        FFFBBFBLRL
        FFBBFFBLRR
        BFFFFBBLLL
        FBBFBBFLRL
        FFFBFFBLRL
        FBBFFBBRRL
        FBFFFBFRRR
        BFBBBFFLRL
        FFFFBFFLLL
        FBFFFFFRLL
        BFBFFFFRLL
        FFBFBBBLRL
        BFFBBBBLLR
        BFFBBBFRRL
        FFBBBBFLLR
        FFFBFBFLRR
        FBFFBFFRLR
        BFBFBBBRLR
        BFFBFFFLLR
        FFFFBFBLLR
        FBFFBFBLRR
        BFFBFBFRRR
        BFFBFFBLRL
        FBBBBBFRRR
        BFBBFFBLRL
        FFBBFBBRRL
        FBFFBFFRLL
        FFBFFBFLLR
        BFBBBBBLRR
        BFFBBFFLRL
        FBBBFBBRRL
        BBFFBBBLRR
        BBFFFBFRRR
        FBFFBFBRLR
        FBFBFFBRLR
        BBFFFFBLLL
        FBBFBFFRRR
        FFBBFBFRLL
        FFFFBFBLRR
        FBFBFFFRRL
        FBBFBBFRRL
        FFBFFBFLRL
        FFBFBFBRRR
        FFFFBBFRRL
        BFFBBBFRLR
        FFBFBBBRRL
        BFFBFBBLLL
        FBBBBFFRRL
        FFFBFBFRLR
        FFBFFBBLRL
        BFFBFFBLRR
        FBBBFFFRLR
        FBBBFFBRLR
        FBBBBBBLLR
        FBBFBFFLLR
        BBFFBFFRRL
        FBBBBBFRRL
        FFFBBFFRLL
        FFFBBFFLRL
        FFBFFBBLRR
        FBBFFFBLLL
        FFFFBBFRLL
        FFBFFBBLLR
        BFFFBFFLLL
        BFFBBFBRLL
        FBBFFFBRLR
        FFFBFBBLRR
        BFBFFBBLRL
        FBFFFBFRLR
        BFBFFFFLRL
        BFBBBBBLLR
        FFFBBFFLLR
        BFBFFFBLLR
        FFFFBBFLLR
        FBBFBBFLRR
        FBBBFBBLLR
        BFFFFFBRRR
        FBFBFFFLLR
        FBFBBBBRLR
        FFFBFFBLLR
        FFFBBFBLLL
        BFFBFBBRRL
        BFBFBBBLRL
        BFFFBBFRLL
        FBBFFBFLRL
        BFBFBBBRRR
        FFFBFFBRRR
        BFFFBFFLRL
        BBFFBBFRLR
        FFFBBBBLRL
        FBBFFFFRRL
        FBFFBFFRRL
        BFFFFFBRLL
        FBFBBFBRRR
        FBFBBBFLRL
        FBFFBBBLLL
        FFFFBBBRRR
        FBBBFBBLRL
        BFBFFBBRLL
        FBFBBBFRLR
        FFFBBBFLRR
        BFFBFFFRLR
        BFBFFBFRLR
        BFBBFFFLLR
        FBFFBBBRRR
        FBBBFFBLRL
        BFBFBBBLRR
        FBBBBBFLRR
        FBBBBBBRLR
        BFBFFFFRRR
        BFBBBBFLRR
        BFBBFFFRRR
        FFBFBFFLLL
        FBFFFBFLRL
        BFBBFBFLLR
        BFFBBBFLLR
        FBBFBFBRRR
        FFBFFBFRLL
        BFFFBFFLRR
        FBFBBFFLLL
        FFFBFBBRRR
        FBBBFBBRLR
        BFFFBBBRRR
        FFFBFBFLLR
        BFFBFBBLRL
        FBFBBFFRLL
        BFBBFBBLRR
        FFFBBBBRLR
        BFFFFFFLRR
        FBFFBBFLRL
        BFBFFFBRRL
        BBFFBFFLLL
        FFBBFBBRRR
        BFBFFBFRRL
        BFFFFBBLRL
        BFBBFFFLRL
        FBFFFBFLLL
        FBBFFBBRLL
        FFBBFFBRLR
        FFFBFFBLRR
        BFBFBFFLRL
        FBBBBFBRRR
        FBBFFBFLRR
        BFFBBFBRRR
        FFFBFFBRLL
        FFBFBFFLRR
        FFFBFFFLRL
        BFBFBFBRRL
        BFFFFBFRRR
        FFBFBBBRLR
        BFFBFFBRRR
        FBBBFBFRRR
        FBBBBBFRLL
        BBFBFBFLLL
        FBFFFBBRRL
        FBBBBFBRLL
        BBFFBFBRLR
        FFFFBFBLLL
        FFBFBBBLLR
        FFFBBFBRLR
        BFBFFBBRRL
        FFBFBFBRRL
        FFBFBFBRLR
        FFFBBBFRLL
        FFBFBBFRLL
        FFFFBFBRRR
        FFFFBFBRLR
        BBFFFFFLLL
        BFBFFFBLLL
        BFBBBFFRRR
        FBBBBBBLLL
        FFBFBBBRLL
        FBFBBBFLLL
        FBBBFFBRRR
        BFBBFBFLRR
        FFFBBFBLLR
        FFFBBBBRRR
        FFBFBFBLRL
        FFBBFFFLRR
        FBBFBFBLRL
        FBBFFBBRLR
        FBBFFBBRRR
        BFBFFBFLLL
        FBFFFFBLRL
        FFBBBBBRLL
        FBFBFBBLRL
        FBFFFFBRRL
        BFBBBFBRRR
        FFFBBBFLRL
        FBFBFBFLRR
        BFFBFFBLLR
        BFBFBFBRLR
        FBBFBBFRRR
        BFBFFBBLLR
        BFBFFFBLRR
        FBBBBBFLRL
        BFFFBFBLLR
        BBFFFFBRLR
        BBFBFFFRRL
        BBFBFFBLRL
        BBFFFBFLRL
        FFBBFFFLRL
        FBBBFBFRLL
        BFFFFBFRLL
        FBBBFFFLRR
        FFBFFBFRRR
        FBBBFBFRLR
        FFBFBFFRRL
        FBFBBFBLLL
        FFBBBFBLRL
        FFBBBBFRRR
        FBFBFBBLLR
        FBBBBFBLRL
        FFBBBFFLLL
        FBFFBBFLRR
        FBFBFBBRLR
        BBFFBBFLRR
        FBFBBBFRRL
        BFFBBFFRRR
        BBFFFBBRRR
        BFFBBBBRRL
        BBFFFFFLLR
        BFBBBFFLLR
        BBFBFFFLLL
        BFFBBBFLRL
        BFBFFBFLRR
        FBBFBFBRLL
        BFFFFFBLLR
        BFBFBBFRLL
        FBBFBBBRRR
        FFBFFFBRRL
        BFBBBBFRRR
        BFFFBBFLLR
        FBBBFFFLLL
        FBFFFFFLLR
        FFBFFFFRRL
        FFBBFFFRLR
        FBFBFFFRLL
        FFBBBBBLRL
        FBFFBFBLLR
        BFBFBBFLRL
        BFFFBFFRLR
        BBFFBBFLRL
        BFFBFFBRLL
        BFFFFBBLRR
        BFBFBBBLLR
        BFFBBBBRLR
        FBBBBFFRRR
        BBFFBBBLRL
        FBBBFFFRLL
        FBBFFFFRRR
        FFBBBFFLLR
        BBFFBBFLLR
        BFFBBBBRRR
        BFBBFFBLLR
        BFBFBBBLLL
        BFFBBFBLLR
        BFBBFBFRRR
        BFFFBFBRRR
        BFBBBFFLLL
        BBFFBFFRLL
        FBBFFFBLRL
        FFFBFFFLLL
        BFBBBFBLRR
        FFBBBBFRLR
        BFFBFBFLRL
        BFBFBFBLLR
        BBFFFBBLLR
        FBFBFFFLRR
        FFBFBFFLLR
        FFBBFFBLLL
        BFBFBFFRRR
        FBFBBBBLLR
        BFBFBBFLLR
        FBBFFBBLLL
        FBFFBBBRLR
        FBFFBBBRLL
        FBFFBFFLLR
        BFFBBBFRRR
        BFFFFFFLLR
        BFBBFBFRRL
        FFBFFBBRLR
        FBBBBFFRLR
        BFFBFFFRRL
        FFBFBBFLLL
        FFFBFBBRLL
        FFFBBBBRLL
        FBBFBBBRLR
        FFFBFBBRRL
        FFBBFFFRRR
        BFFFFFFRRL
        FFBBFFBLRL
        BFFFFFBRLR
        BFFBBBFLLL
        FBFFBFFLLL
        FFBFFFFLRL
        FFFFBBBLRL
        FBFBBFFRRR
        FBFFBBFRLL
        BFFFFFFLLL
        FFBFFFBLLL
        BFBFBBFLRR
        FBBFFFFLLR
        BFBFBFFRLR
        BFBBFFFRLR
        BFBBBFFRLR
        BFFBBFFLRR
        BBFFBBBRLL
        FBBFFFFRLL
        BFFFFBBRRL
        FBFBBFBRRL
        BFFBFFFRRR
        FFBFFBFRRL
        BFFFFBBRLR
        BFFFFBFLRL
        BFBBBFFRRL
        FBBBFBFLLL
        BFFBFBBLLR
        FBFBFBBLRR
        FBBFBBBLRR
        BFBFBFFLLR
        BFFBBBBLRL
        BFFFFFFRLL
        FFFBFFFRLR
        FFBBFBFLRL
        FBFBFFBLLL
        BBFFBFFRLR
        FBBFBBFLLL
        BFBBFBBRRR
        FBBBBFFRLL
        BFBBBFBLLR
        FFBFFFBLLR
        FFFBFFFLRR
        FBFBFBFRLR
        BBFFFFBRRR
        FBBFBBBLLR
        BFBBBFBRRL
        BBFBFFBLLR
        FFBFBBBLRR
        FFBBBFBLLL
        FBBBFFBLRR
        FFFBFBFLRL
        FBFFBBFRRL
        FFFBBBFLLR
        BFFFBBBLRL
        BBFFFBBRLL
        BBFFFBFLLL
        FBBFBFFLRL
        FFFBFBBRLR
        FFBFBBFRLR
        FBBBFBBLRR
        FBFFBFBRRR
        BFFBBFFLLL
        FFBBFFFLLL
        FFFBFFBRLR
        FFBBFBFLLL
        FBBFBBFLLR
        FFFFBFFLLR
        BFFBFBBRLR
        FBFBFFBRLL
        BBFFFFFRLL
        BBFBFFFLRL
        FFFBFFFRRR
        BFFBFBFLLR
        FFBBBFBLLR
        FBFFBBFLLL
        FBFFFBBLRR
        BBFFBBBRRL
        FBFBBFBLLR
        FFFBFFFLLR
        BBFFBFFRRR
        FBBFFBBLRL
        FBBFBFFRLR
        BBFBFFFRLR
        BFBFBFBLRR
        FFBBFBBRLR
        FFFBFFFRLL
        BBFFBBBLLR
        FBBBBFBLRR
        FBFBFBFLLR
        BFFFFBFLRR
        BFFFFBBRLL
        FBBBBBBRLL
        FBBBBBFRLR
        BFFFBFBLRL
        """
    }
}
