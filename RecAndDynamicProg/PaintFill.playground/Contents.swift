import UIKit

/*
    Implement the paint fill function that one might see on many image editing progrmas. That is, given a screen(represented by two dimensional array  of colors), a point, and new color, fill in the surronding area until the color changes from the original color.
 */

enum Color { case Black, White, Red, Yellow, Green }

func paintFill(_ screen: inout [[Color]], _ r: Int, _ c:Int, _ nColor:Color ) -> Bool {
    if screen[r][c] == nColor { return false }
    return paintFillHelper(&screen, r, c, screen[r][c] as Color, nColor)
}

func paintFillHelper(_ screen: inout [[Color]], _ r:Int, _ c: Int, _ oColor: Color, _ nColor: Color) -> Bool {
    if r < 0 || r >= screen.count || c < 0 || c >= screen[0].count { return false }
    
    if screen[r][c] == oColor {
        screen[r][c] = nColor
        paintFillHelper(&screen, r-1, c, oColor, nColor) //up
        paintFillHelper(&screen, r+1, c, oColor, nColor) //down
        paintFillHelper(&screen, r, c-1, oColor, nColor) //left
        paintFillHelper(&screen, r, c+1, oColor, nColor) //right
    }
    return true
}
