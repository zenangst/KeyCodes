/// Layout: com.apple.keylayout.Swedish-Pro (swedishLayout)")
/// ---------------------------------------------
import KeyCodes
import InputSources
import Testing

fileprivate let tests = [
Test(that: 0, isEqualTo: "a", on: .swedishLayout),
Test(that: 0, withModifiers: [.leftShift], isEqualTo: "A", on: .swedishLayout),
Test(that: 0, withModifiers: [.leftOption], isEqualTo: "", on: .swedishLayout),
Test(that: 0, withModifiers: [.leftShift, .leftOption], isEqualTo: "◊", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 1, isEqualTo: "s", on: .swedishLayout),
Test(that: 1, withModifiers: [.leftShift], isEqualTo: "S", on: .swedishLayout),
Test(that: 1, withModifiers: [.leftOption], isEqualTo: "ß", on: .swedishLayout),
Test(that: 1, withModifiers: [.leftShift, .leftOption], isEqualTo: "∑", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 2, isEqualTo: "d", on: .swedishLayout),
Test(that: 2, withModifiers: [.leftShift], isEqualTo: "D", on: .swedishLayout),
Test(that: 2, withModifiers: [.leftOption], isEqualTo: "∂", on: .swedishLayout),
Test(that: 2, withModifiers: [.leftShift, .leftOption], isEqualTo: "∆", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 3, isEqualTo: "f", on: .swedishLayout),
Test(that: 3, withModifiers: [.leftShift], isEqualTo: "F", on: .swedishLayout),
Test(that: 3, withModifiers: [.leftOption], isEqualTo: "ƒ", on: .swedishLayout),
Test(that: 3, withModifiers: [.leftShift, .leftOption], isEqualTo: "∫", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 4, isEqualTo: "h", on: .swedishLayout),
Test(that: 4, withModifiers: [.leftShift], isEqualTo: "H", on: .swedishLayout),
Test(that: 4, withModifiers: [.leftOption], isEqualTo: "˛", on: .swedishLayout),
Test(that: 4, withModifiers: [.leftShift, .leftOption], isEqualTo: "˘", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 5, isEqualTo: "g", on: .swedishLayout),
Test(that: 5, withModifiers: [.leftShift], isEqualTo: "G", on: .swedishLayout),
Test(that: 5, withModifiers: [.leftOption], isEqualTo: "¸", on: .swedishLayout),
Test(that: 5, withModifiers: [.leftShift, .leftOption], isEqualTo: "¯", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 6, isEqualTo: "z", on: .swedishLayout),
Test(that: 6, withModifiers: [.leftShift], isEqualTo: "Z", on: .swedishLayout),
Test(that: 6, withModifiers: [.leftOption], isEqualTo: "÷", on: .swedishLayout),
Test(that: 6, withModifiers: [.leftShift, .leftOption], isEqualTo: "⁄", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 7, isEqualTo: "x", on: .swedishLayout),
Test(that: 7, withModifiers: [.leftShift], isEqualTo: "X", on: .swedishLayout),
Test(that: 7, withModifiers: [.leftOption], isEqualTo: "≈", on: .swedishLayout),
Test(that: 7, withModifiers: [.leftShift, .leftOption], isEqualTo: "ˇ", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 8, isEqualTo: "c", on: .swedishLayout),
Test(that: 8, withModifiers: [.leftShift], isEqualTo: "C", on: .swedishLayout),
Test(that: 8, withModifiers: [.leftOption], isEqualTo: "ç", on: .swedishLayout),
Test(that: 8, withModifiers: [.leftShift, .leftOption], isEqualTo: "Ç", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 9, isEqualTo: "v", on: .swedishLayout),
Test(that: 9, withModifiers: [.leftShift], isEqualTo: "V", on: .swedishLayout),
Test(that: 9, withModifiers: [.leftOption], isEqualTo: "‹", on: .swedishLayout),
Test(that: 9, withModifiers: [.leftShift, .leftOption], isEqualTo: "«", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 10, isEqualTo: "§", on: .swedishLayout),
Test(that: 10, withModifiers: [.leftShift], isEqualTo: "°", on: .swedishLayout),
Test(that: 10, withModifiers: [.leftOption], isEqualTo: "¶", on: .swedishLayout),
Test(that: 10, withModifiers: [.leftShift, .leftOption], isEqualTo: "•", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 11, isEqualTo: "b", on: .swedishLayout),
Test(that: 11, withModifiers: [.leftShift], isEqualTo: "B", on: .swedishLayout),
Test(that: 11, withModifiers: [.leftOption], isEqualTo: "›", on: .swedishLayout),
Test(that: 11, withModifiers: [.leftShift, .leftOption], isEqualTo: "»", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 12, isEqualTo: "q", on: .swedishLayout),
Test(that: 12, withModifiers: [.leftShift], isEqualTo: "Q", on: .swedishLayout),
Test(that: 12, withModifiers: [.leftOption], isEqualTo: "•", on: .swedishLayout),
Test(that: 12, withModifiers: [.leftShift, .leftOption], isEqualTo: "°", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 13, isEqualTo: "w", on: .swedishLayout),
Test(that: 13, withModifiers: [.leftShift], isEqualTo: "W", on: .swedishLayout),
Test(that: 13, withModifiers: [.leftOption], isEqualTo: "Ω", on: .swedishLayout),
Test(that: 13, withModifiers: [.leftShift, .leftOption], isEqualTo: "˝", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 14, isEqualTo: "e", on: .swedishLayout),
Test(that: 14, withModifiers: [.leftShift], isEqualTo: "E", on: .swedishLayout),
Test(that: 14, withModifiers: [.leftOption], isEqualTo: "é", on: .swedishLayout),
Test(that: 14, withModifiers: [.leftShift, .leftOption], isEqualTo: "É", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 15, isEqualTo: "r", on: .swedishLayout),
Test(that: 15, withModifiers: [.leftShift], isEqualTo: "R", on: .swedishLayout),
Test(that: 15, withModifiers: [.leftOption], isEqualTo: "®", on: .swedishLayout),
Test(that: 15, withModifiers: [.leftShift, .leftOption], isEqualTo: "√", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 16, isEqualTo: "y", on: .swedishLayout),
Test(that: 16, withModifiers: [.leftShift], isEqualTo: "Y", on: .swedishLayout),
Test(that: 16, withModifiers: [.leftOption], isEqualTo: "µ", on: .swedishLayout),
Test(that: 16, withModifiers: [.leftShift, .leftOption], isEqualTo: "˜", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 17, isEqualTo: "t", on: .swedishLayout),
Test(that: 17, withModifiers: [.leftShift], isEqualTo: "T", on: .swedishLayout),
Test(that: 17, withModifiers: [.leftOption], isEqualTo: "†", on: .swedishLayout),
Test(that: 17, withModifiers: [.leftShift, .leftOption], isEqualTo: "‡", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 18, isEqualTo: "1", on: .swedishLayout),
Test(that: 18, withModifiers: [.leftShift], isEqualTo: "!", on: .swedishLayout),
Test(that: 18, withModifiers: [.leftOption], isEqualTo: "©", on: .swedishLayout),
Test(that: 18, withModifiers: [.leftShift, .leftOption], isEqualTo: "¡", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 19, isEqualTo: "2", on: .swedishLayout),
Test(that: 19, withModifiers: [.leftShift], isEqualTo: "\"", on: .swedishLayout),
Test(that: 19, withModifiers: [.leftOption], isEqualTo: "@", on: .swedishLayout),
Test(that: 19, withModifiers: [.leftShift, .leftOption], isEqualTo: "”", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 20, isEqualTo: "3", on: .swedishLayout),
Test(that: 20, withModifiers: [.leftShift], isEqualTo: "#", on: .swedishLayout),
Test(that: 20, withModifiers: [.leftOption], isEqualTo: "£", on: .swedishLayout),
Test(that: 20, withModifiers: [.leftShift, .leftOption], isEqualTo: "¥", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 21, isEqualTo: "4", on: .swedishLayout),
Test(that: 21, withModifiers: [.leftShift], isEqualTo: "€", on: .swedishLayout),
Test(that: 21, withModifiers: [.leftOption], isEqualTo: "$", on: .swedishLayout),
Test(that: 21, withModifiers: [.leftShift, .leftOption], isEqualTo: "¢", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 22, isEqualTo: "6", on: .swedishLayout),
Test(that: 22, withModifiers: [.leftShift], isEqualTo: "&", on: .swedishLayout),
Test(that: 22, withModifiers: [.leftOption], isEqualTo: "§", on: .swedishLayout),
Test(that: 22, withModifiers: [.leftShift, .leftOption], isEqualTo: "¶", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 23, isEqualTo: "5", on: .swedishLayout),
Test(that: 23, withModifiers: [.leftShift], isEqualTo: "%", on: .swedishLayout),
Test(that: 23, withModifiers: [.leftOption], isEqualTo: "∞", on: .swedishLayout),
Test(that: 23, withModifiers: [.leftShift, .leftOption], isEqualTo: "‰", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 24, isEqualTo: "´", on: .swedishLayout),
Test(that: 24, withModifiers: [.leftShift], isEqualTo: "`", on: .swedishLayout),
Test(that: 24, withModifiers: [.leftOption], isEqualTo: "´", on: .swedishLayout),
Test(that: 24, withModifiers: [.leftShift, .leftOption], isEqualTo: "`", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 25, isEqualTo: "9", on: .swedishLayout),
Test(that: 25, withModifiers: [.leftShift], isEqualTo: ")", on: .swedishLayout),
Test(that: 25, withModifiers: [.leftOption], isEqualTo: "]", on: .swedishLayout),
Test(that: 25, withModifiers: [.leftShift, .leftOption], isEqualTo: "}", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 26, isEqualTo: "7", on: .swedishLayout),
Test(that: 26, withModifiers: [.leftShift], isEqualTo: "/", on: .swedishLayout),
Test(that: 26, withModifiers: [.leftOption], isEqualTo: "|", on: .swedishLayout),
Test(that: 26, withModifiers: [.leftShift, .leftOption], isEqualTo: "\\", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 27, isEqualTo: "+", on: .swedishLayout),
Test(that: 27, withModifiers: [.leftShift], isEqualTo: "?", on: .swedishLayout),
Test(that: 27, withModifiers: [.leftOption], isEqualTo: "±", on: .swedishLayout),
Test(that: 27, withModifiers: [.leftShift, .leftOption], isEqualTo: "¿", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 28, isEqualTo: "8", on: .swedishLayout),
Test(that: 28, withModifiers: [.leftShift], isEqualTo: "(", on: .swedishLayout),
Test(that: 28, withModifiers: [.leftOption], isEqualTo: "[", on: .swedishLayout),
Test(that: 28, withModifiers: [.leftShift, .leftOption], isEqualTo: "{", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 29, isEqualTo: "0", on: .swedishLayout),
Test(that: 29, withModifiers: [.leftShift], isEqualTo: "=", on: .swedishLayout),
Test(that: 29, withModifiers: [.leftOption], isEqualTo: "≈", on: .swedishLayout),
Test(that: 29, withModifiers: [.leftShift, .leftOption], isEqualTo: "≠", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 30, isEqualTo: "¨", on: .swedishLayout),
Test(that: 30, withModifiers: [.leftShift], isEqualTo: "^", on: .swedishLayout),
Test(that: 30, withModifiers: [.leftOption], isEqualTo: "~", on: .swedishLayout),
Test(that: 30, withModifiers: [.leftShift, .leftOption], isEqualTo: "^", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 31, isEqualTo: "o", on: .swedishLayout),
Test(that: 31, withModifiers: [.leftShift], isEqualTo: "O", on: .swedishLayout),
Test(that: 31, withModifiers: [.leftOption], isEqualTo: "œ", on: .swedishLayout),
Test(that: 31, withModifiers: [.leftShift, .leftOption], isEqualTo: "Œ", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 32, isEqualTo: "u", on: .swedishLayout),
Test(that: 32, withModifiers: [.leftShift], isEqualTo: "U", on: .swedishLayout),
Test(that: 32, withModifiers: [.leftOption], isEqualTo: "ü", on: .swedishLayout),
Test(that: 32, withModifiers: [.leftShift, .leftOption], isEqualTo: "Ü", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 33, isEqualTo: "å", on: .swedishLayout),
Test(that: 33, withModifiers: [.leftShift], isEqualTo: "Å", on: .swedishLayout),
Test(that: 33, withModifiers: [.leftOption], isEqualTo: "˙", on: .swedishLayout),
Test(that: 33, withModifiers: [.leftShift, .leftOption], isEqualTo: "˚", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 34, isEqualTo: "i", on: .swedishLayout),
Test(that: 34, withModifiers: [.leftShift], isEqualTo: "I", on: .swedishLayout),
Test(that: 34, withModifiers: [.leftOption], isEqualTo: "ı", on: .swedishLayout),
Test(that: 34, withModifiers: [.leftShift, .leftOption], isEqualTo: "ˆ", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 35, isEqualTo: "p", on: .swedishLayout),
Test(that: 35, withModifiers: [.leftShift], isEqualTo: "P", on: .swedishLayout),
Test(that: 35, withModifiers: [.leftOption], isEqualTo: "π", on: .swedishLayout),
Test(that: 35, withModifiers: [.leftShift, .leftOption], isEqualTo: "∏", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 36, isEqualTo: "↩", on: .swedishLayout),
Test(that: 36, withModifiers: [.leftShift], isEqualTo: "↩", on: .swedishLayout),
Test(that: 36, withModifiers: [.leftOption], isEqualTo: "↩", on: .swedishLayout),
Test(that: 36, withModifiers: [.leftShift, .leftOption], isEqualTo: "↩", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 37, isEqualTo: "l", on: .swedishLayout),
Test(that: 37, withModifiers: [.leftShift], isEqualTo: "L", on: .swedishLayout),
Test(that: 37, withModifiers: [.leftOption], isEqualTo: "ﬁ", on: .swedishLayout),
Test(that: 37, withModifiers: [.leftShift, .leftOption], isEqualTo: "ﬂ", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 38, isEqualTo: "j", on: .swedishLayout),
Test(that: 38, withModifiers: [.leftShift], isEqualTo: "J", on: .swedishLayout),
Test(that: 38, withModifiers: [.leftOption], isEqualTo: "√", on: .swedishLayout),
Test(that: 38, withModifiers: [.leftShift, .leftOption], isEqualTo: "¬", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 39, isEqualTo: "ä", on: .swedishLayout),
Test(that: 39, withModifiers: [.leftShift], isEqualTo: "Ä", on: .swedishLayout),
Test(that: 39, withModifiers: [.leftOption], isEqualTo: "æ", on: .swedishLayout),
Test(that: 39, withModifiers: [.leftShift, .leftOption], isEqualTo: "Æ", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 40, isEqualTo: "k", on: .swedishLayout),
Test(that: 40, withModifiers: [.leftShift], isEqualTo: "K", on: .swedishLayout),
Test(that: 40, withModifiers: [.leftOption], isEqualTo: "ª", on: .swedishLayout),
Test(that: 40, withModifiers: [.leftShift, .leftOption], isEqualTo: "º", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 41, isEqualTo: "ö", on: .swedishLayout),
Test(that: 41, withModifiers: [.leftShift], isEqualTo: "Ö", on: .swedishLayout),
Test(that: 41, withModifiers: [.leftOption], isEqualTo: "ø", on: .swedishLayout),
Test(that: 41, withModifiers: [.leftShift, .leftOption], isEqualTo: "Ø", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 42, isEqualTo: "'", on: .swedishLayout),
Test(that: 42, withModifiers: [.leftShift], isEqualTo: "*", on: .swedishLayout),
Test(that: 42, withModifiers: [.leftOption], isEqualTo: "™", on: .swedishLayout),
Test(that: 42, withModifiers: [.leftShift, .leftOption], isEqualTo: "’", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 43, isEqualTo: ",", on: .swedishLayout),
Test(that: 43, withModifiers: [.leftShift], isEqualTo: ";", on: .swedishLayout),
Test(that: 43, withModifiers: [.leftOption], isEqualTo: "‚", on: .swedishLayout),
Test(that: 43, withModifiers: [.leftShift, .leftOption], isEqualTo: "„", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 44, isEqualTo: "-", on: .swedishLayout),
Test(that: 44, withModifiers: [.leftShift], isEqualTo: "_", on: .swedishLayout),
Test(that: 44, withModifiers: [.leftOption], isEqualTo: "–", on: .swedishLayout),
Test(that: 44, withModifiers: [.leftShift, .leftOption], isEqualTo: "—", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 45, isEqualTo: "n", on: .swedishLayout),
Test(that: 45, withModifiers: [.leftShift], isEqualTo: "N", on: .swedishLayout),
Test(that: 45, withModifiers: [.leftOption], isEqualTo: "‘", on: .swedishLayout),
Test(that: 45, withModifiers: [.leftShift, .leftOption], isEqualTo: "“", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 46, isEqualTo: "m", on: .swedishLayout),
Test(that: 46, withModifiers: [.leftShift], isEqualTo: "M", on: .swedishLayout),
Test(that: 46, withModifiers: [.leftOption], isEqualTo: "’", on: .swedishLayout),
Test(that: 46, withModifiers: [.leftShift, .leftOption], isEqualTo: "”", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 47, isEqualTo: ".", on: .swedishLayout),
Test(that: 47, withModifiers: [.leftShift], isEqualTo: ":", on: .swedishLayout),
Test(that: 47, withModifiers: [.leftOption], isEqualTo: "…", on: .swedishLayout),
Test(that: 47, withModifiers: [.leftShift, .leftOption], isEqualTo: "·", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 48, isEqualTo: "⇥", on: .swedishLayout),
Test(that: 48, withModifiers: [.leftShift], isEqualTo: "⇥", on: .swedishLayout),
Test(that: 48, withModifiers: [.leftOption], isEqualTo: "⇥", on: .swedishLayout),
Test(that: 48, withModifiers: [.leftShift, .leftOption], isEqualTo: "⇥", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 49, isEqualTo: "Space", on: .swedishLayout),
Test(that: 49, withModifiers: [.leftShift], isEqualTo: "Space", on: .swedishLayout),
Test(that: 49, withModifiers: [.leftOption], isEqualTo: "Space", on: .swedishLayout),
Test(that: 49, withModifiers: [.leftShift, .leftOption], isEqualTo: "Space", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 50, isEqualTo: "<", on: .swedishLayout),
Test(that: 50, withModifiers: [.leftShift], isEqualTo: ">", on: .swedishLayout),
Test(that: 50, withModifiers: [.leftOption], isEqualTo: "≤", on: .swedishLayout),
Test(that: 50, withModifiers: [.leftShift, .leftOption], isEqualTo: "≥", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 51, isEqualTo: "⌫", on: .swedishLayout),
Test(that: 51, withModifiers: [.leftShift], isEqualTo: "⌫", on: .swedishLayout),
Test(that: 51, withModifiers: [.leftOption], isEqualTo: "⌫", on: .swedishLayout),
Test(that: 51, withModifiers: [.leftShift, .leftOption], isEqualTo: "⌫", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 53, isEqualTo: "⎋", on: .swedishLayout),
Test(that: 53, withModifiers: [.leftShift], isEqualTo: "⎋", on: .swedishLayout),
Test(that: 53, withModifiers: [.leftOption], isEqualTo: "⎋", on: .swedishLayout),
Test(that: 53, withModifiers: [.leftShift, .leftOption], isEqualTo: "⎋", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 57, isEqualTo: "Caps Lock", on: .swedishLayout),
Test(that: 57, withModifiers: [.leftShift], isEqualTo: "Caps Lock", on: .swedishLayout),
Test(that: 57, withModifiers: [.leftOption], isEqualTo: "Caps Lock", on: .swedishLayout),
Test(that: 57, withModifiers: [.leftShift, .leftOption], isEqualTo: "Caps Lock", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 64, isEqualTo: "F17", on: .swedishLayout),
Test(that: 64, withModifiers: [.leftShift], isEqualTo: "F17", on: .swedishLayout),
Test(that: 64, withModifiers: [.leftOption], isEqualTo: "F17", on: .swedishLayout),
Test(that: 64, withModifiers: [.leftShift, .leftOption], isEqualTo: "F17", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 65, isEqualTo: ",", on: .swedishLayout),
Test(that: 65, withModifiers: [.leftShift], isEqualTo: ".", on: .swedishLayout),
Test(that: 65, withModifiers: [.leftOption], isEqualTo: ",", on: .swedishLayout),
Test(that: 65, withModifiers: [.leftShift, .leftOption], isEqualTo: ".", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 67, isEqualTo: "*", on: .swedishLayout),
Test(that: 67, withModifiers: [.leftShift], isEqualTo: "*", on: .swedishLayout),
Test(that: 67, withModifiers: [.leftOption], isEqualTo: "*", on: .swedishLayout),
Test(that: 67, withModifiers: [.leftShift, .leftOption], isEqualTo: "*", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 69, isEqualTo: "+", on: .swedishLayout),
Test(that: 69, withModifiers: [.leftShift], isEqualTo: "+", on: .swedishLayout),
Test(that: 69, withModifiers: [.leftOption], isEqualTo: "+", on: .swedishLayout),
Test(that: 69, withModifiers: [.leftShift, .leftOption], isEqualTo: "+", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 75, isEqualTo: "/", on: .swedishLayout),
Test(that: 75, withModifiers: [.leftShift], isEqualTo: "/", on: .swedishLayout),
Test(that: 75, withModifiers: [.leftOption], isEqualTo: "/", on: .swedishLayout),
Test(that: 75, withModifiers: [.leftShift, .leftOption], isEqualTo: "/", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 76, isEqualTo: "⌅", on: .swedishLayout),
Test(that: 76, withModifiers: [.leftShift], isEqualTo: "⌅", on: .swedishLayout),
Test(that: 76, withModifiers: [.leftOption], isEqualTo: "⌅", on: .swedishLayout),
Test(that: 76, withModifiers: [.leftShift, .leftOption], isEqualTo: "⌅", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 78, isEqualTo: "-", on: .swedishLayout),
Test(that: 78, withModifiers: [.leftShift], isEqualTo: "-", on: .swedishLayout),
Test(that: 78, withModifiers: [.leftOption], isEqualTo: "-", on: .swedishLayout),
Test(that: 78, withModifiers: [.leftShift, .leftOption], isEqualTo: "-", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 79, isEqualTo: "F18", on: .swedishLayout),
Test(that: 79, withModifiers: [.leftShift], isEqualTo: "F18", on: .swedishLayout),
Test(that: 79, withModifiers: [.leftOption], isEqualTo: "F18", on: .swedishLayout),
Test(that: 79, withModifiers: [.leftShift, .leftOption], isEqualTo: "F18", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 80, isEqualTo: "F19", on: .swedishLayout),
Test(that: 80, withModifiers: [.leftShift], isEqualTo: "F19", on: .swedishLayout),
Test(that: 80, withModifiers: [.leftOption], isEqualTo: "F19", on: .swedishLayout),
Test(that: 80, withModifiers: [.leftShift, .leftOption], isEqualTo: "F19", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 81, isEqualTo: "=", on: .swedishLayout),
Test(that: 81, withModifiers: [.leftShift], isEqualTo: "=", on: .swedishLayout),
Test(that: 81, withModifiers: [.leftOption], isEqualTo: "=", on: .swedishLayout),
Test(that: 81, withModifiers: [.leftShift, .leftOption], isEqualTo: "=", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 82, isEqualTo: "#0", on: .swedishLayout),
Test(that: 82, withModifiers: [.leftShift], isEqualTo: "#0", on: .swedishLayout),
Test(that: 82, withModifiers: [.leftOption], isEqualTo: "#0", on: .swedishLayout),
Test(that: 82, withModifiers: [.leftShift, .leftOption], isEqualTo: "#0", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 83, isEqualTo: "#1", on: .swedishLayout),
Test(that: 83, withModifiers: [.leftShift], isEqualTo: "#1", on: .swedishLayout),
Test(that: 83, withModifiers: [.leftOption], isEqualTo: "#1", on: .swedishLayout),
Test(that: 83, withModifiers: [.leftShift, .leftOption], isEqualTo: "#1", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 84, isEqualTo: "#2", on: .swedishLayout),
Test(that: 84, withModifiers: [.leftShift], isEqualTo: "#2", on: .swedishLayout),
Test(that: 84, withModifiers: [.leftOption], isEqualTo: "#2", on: .swedishLayout),
Test(that: 84, withModifiers: [.leftShift, .leftOption], isEqualTo: "#2", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 85, isEqualTo: "#3", on: .swedishLayout),
Test(that: 85, withModifiers: [.leftShift], isEqualTo: "#3", on: .swedishLayout),
Test(that: 85, withModifiers: [.leftOption], isEqualTo: "#3", on: .swedishLayout),
Test(that: 85, withModifiers: [.leftShift, .leftOption], isEqualTo: "#3", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 86, isEqualTo: "#4", on: .swedishLayout),
Test(that: 86, withModifiers: [.leftShift], isEqualTo: "#4", on: .swedishLayout),
Test(that: 86, withModifiers: [.leftOption], isEqualTo: "#4", on: .swedishLayout),
Test(that: 86, withModifiers: [.leftShift, .leftOption], isEqualTo: "#4", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 87, isEqualTo: "#5", on: .swedishLayout),
Test(that: 87, withModifiers: [.leftShift], isEqualTo: "#5", on: .swedishLayout),
Test(that: 87, withModifiers: [.leftOption], isEqualTo: "#5", on: .swedishLayout),
Test(that: 87, withModifiers: [.leftShift, .leftOption], isEqualTo: "#5", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 88, isEqualTo: "#6", on: .swedishLayout),
Test(that: 88, withModifiers: [.leftShift], isEqualTo: "#6", on: .swedishLayout),
Test(that: 88, withModifiers: [.leftOption], isEqualTo: "#6", on: .swedishLayout),
Test(that: 88, withModifiers: [.leftShift, .leftOption], isEqualTo: "#6", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 89, isEqualTo: "#7", on: .swedishLayout),
Test(that: 89, withModifiers: [.leftShift], isEqualTo: "#7", on: .swedishLayout),
Test(that: 89, withModifiers: [.leftOption], isEqualTo: "#7", on: .swedishLayout),
Test(that: 89, withModifiers: [.leftShift, .leftOption], isEqualTo: "#7", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 90, isEqualTo: "F20", on: .swedishLayout),
Test(that: 90, withModifiers: [.leftShift], isEqualTo: "F20", on: .swedishLayout),
Test(that: 90, withModifiers: [.leftOption], isEqualTo: "F20", on: .swedishLayout),
Test(that: 90, withModifiers: [.leftShift, .leftOption], isEqualTo: "F20", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 91, isEqualTo: "#8", on: .swedishLayout),
Test(that: 91, withModifiers: [.leftShift], isEqualTo: "#8", on: .swedishLayout),
Test(that: 91, withModifiers: [.leftOption], isEqualTo: "#8", on: .swedishLayout),
Test(that: 91, withModifiers: [.leftShift, .leftOption], isEqualTo: "#8", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 92, isEqualTo: "#9", on: .swedishLayout),
Test(that: 92, withModifiers: [.leftShift], isEqualTo: "#9", on: .swedishLayout),
Test(that: 92, withModifiers: [.leftOption], isEqualTo: "#9", on: .swedishLayout),
Test(that: 92, withModifiers: [.leftShift, .leftOption], isEqualTo: "#9", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 93, isEqualTo: "§", on: .swedishLayout),
Test(that: 93, withModifiers: [.leftShift], isEqualTo: "°", on: .swedishLayout),
Test(that: 93, withModifiers: [.leftOption], isEqualTo: "¶", on: .swedishLayout),
Test(that: 93, withModifiers: [.leftShift, .leftOption], isEqualTo: "•", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 94, isEqualTo: "<", on: .swedishLayout),
Test(that: 94, withModifiers: [.leftShift], isEqualTo: ">", on: .swedishLayout),
Test(that: 94, withModifiers: [.leftOption], isEqualTo: "≤", on: .swedishLayout),
Test(that: 94, withModifiers: [.leftShift, .leftOption], isEqualTo: "≥", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 96, isEqualTo: "F5", on: .swedishLayout),
Test(that: 96, withModifiers: [.leftShift], isEqualTo: "F5", on: .swedishLayout),
Test(that: 96, withModifiers: [.leftOption], isEqualTo: "F5", on: .swedishLayout),
Test(that: 96, withModifiers: [.leftShift, .leftOption], isEqualTo: "F5", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 97, isEqualTo: "F6", on: .swedishLayout),
Test(that: 97, withModifiers: [.leftShift], isEqualTo: "F6", on: .swedishLayout),
Test(that: 97, withModifiers: [.leftOption], isEqualTo: "F6", on: .swedishLayout),
Test(that: 97, withModifiers: [.leftShift, .leftOption], isEqualTo: "F6", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 98, isEqualTo: "F7", on: .swedishLayout),
Test(that: 98, withModifiers: [.leftShift], isEqualTo: "F7", on: .swedishLayout),
Test(that: 98, withModifiers: [.leftOption], isEqualTo: "F7", on: .swedishLayout),
Test(that: 98, withModifiers: [.leftShift, .leftOption], isEqualTo: "F7", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 99, isEqualTo: "F3", on: .swedishLayout),
Test(that: 99, withModifiers: [.leftShift], isEqualTo: "F3", on: .swedishLayout),
Test(that: 99, withModifiers: [.leftOption], isEqualTo: "F3", on: .swedishLayout),
Test(that: 99, withModifiers: [.leftShift, .leftOption], isEqualTo: "F3", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 100, isEqualTo: "F8", on: .swedishLayout),
Test(that: 100, withModifiers: [.leftShift], isEqualTo: "F8", on: .swedishLayout),
Test(that: 100, withModifiers: [.leftOption], isEqualTo: "F8", on: .swedishLayout),
Test(that: 100, withModifiers: [.leftShift, .leftOption], isEqualTo: "F8", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 101, isEqualTo: "F9", on: .swedishLayout),
Test(that: 101, withModifiers: [.leftShift], isEqualTo: "F9", on: .swedishLayout),
Test(that: 101, withModifiers: [.leftOption], isEqualTo: "F9", on: .swedishLayout),
Test(that: 101, withModifiers: [.leftShift, .leftOption], isEqualTo: "F9", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 103, isEqualTo: "F11", on: .swedishLayout),
Test(that: 103, withModifiers: [.leftShift], isEqualTo: "F11", on: .swedishLayout),
Test(that: 103, withModifiers: [.leftOption], isEqualTo: "F11", on: .swedishLayout),
Test(that: 103, withModifiers: [.leftShift, .leftOption], isEqualTo: "F11", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 105, isEqualTo: "F13", on: .swedishLayout),
Test(that: 105, withModifiers: [.leftShift], isEqualTo: "F13", on: .swedishLayout),
Test(that: 105, withModifiers: [.leftOption], isEqualTo: "F13", on: .swedishLayout),
Test(that: 105, withModifiers: [.leftShift, .leftOption], isEqualTo: "F13", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 106, isEqualTo: "F16", on: .swedishLayout),
Test(that: 106, withModifiers: [.leftShift], isEqualTo: "F16", on: .swedishLayout),
Test(that: 106, withModifiers: [.leftOption], isEqualTo: "F16", on: .swedishLayout),
Test(that: 106, withModifiers: [.leftShift, .leftOption], isEqualTo: "F16", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 107, isEqualTo: "F14", on: .swedishLayout),
Test(that: 107, withModifiers: [.leftShift], isEqualTo: "F14", on: .swedishLayout),
Test(that: 107, withModifiers: [.leftOption], isEqualTo: "F14", on: .swedishLayout),
Test(that: 107, withModifiers: [.leftShift, .leftOption], isEqualTo: "F14", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 109, isEqualTo: "F10", on: .swedishLayout),
Test(that: 109, withModifiers: [.leftShift], isEqualTo: "F10", on: .swedishLayout),
Test(that: 109, withModifiers: [.leftOption], isEqualTo: "F10", on: .swedishLayout),
Test(that: 109, withModifiers: [.leftShift, .leftOption], isEqualTo: "F10", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 111, isEqualTo: "F12", on: .swedishLayout),
Test(that: 111, withModifiers: [.leftShift], isEqualTo: "F12", on: .swedishLayout),
Test(that: 111, withModifiers: [.leftOption], isEqualTo: "F12", on: .swedishLayout),
Test(that: 111, withModifiers: [.leftShift, .leftOption], isEqualTo: "F12", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 113, isEqualTo: "F15", on: .swedishLayout),
Test(that: 113, withModifiers: [.leftShift], isEqualTo: "F15", on: .swedishLayout),
Test(that: 113, withModifiers: [.leftOption], isEqualTo: "F15", on: .swedishLayout),
Test(that: 113, withModifiers: [.leftShift, .leftOption], isEqualTo: "F15", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 114, isEqualTo: "?⃝", on: .swedishLayout),
Test(that: 114, withModifiers: [.leftShift], isEqualTo: "?⃝", on: .swedishLayout),
Test(that: 114, withModifiers: [.leftOption], isEqualTo: "?⃝", on: .swedishLayout),
Test(that: 114, withModifiers: [.leftShift, .leftOption], isEqualTo: "?⃝", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 115, isEqualTo: "↖", on: .swedishLayout),
Test(that: 115, withModifiers: [.leftShift], isEqualTo: "↖", on: .swedishLayout),
Test(that: 115, withModifiers: [.leftOption], isEqualTo: "↖", on: .swedishLayout),
Test(that: 115, withModifiers: [.leftShift, .leftOption], isEqualTo: "↖", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 116, isEqualTo: "⇞", on: .swedishLayout),
Test(that: 116, withModifiers: [.leftShift], isEqualTo: "⇞", on: .swedishLayout),
Test(that: 116, withModifiers: [.leftOption], isEqualTo: "⇞", on: .swedishLayout),
Test(that: 116, withModifiers: [.leftShift, .leftOption], isEqualTo: "⇞", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 117, isEqualTo: "⌦", on: .swedishLayout),
Test(that: 117, withModifiers: [.leftShift], isEqualTo: "⌦", on: .swedishLayout),
Test(that: 117, withModifiers: [.leftOption], isEqualTo: "⌦", on: .swedishLayout),
Test(that: 117, withModifiers: [.leftShift, .leftOption], isEqualTo: "⌦", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 118, isEqualTo: "F4", on: .swedishLayout),
Test(that: 118, withModifiers: [.leftShift], isEqualTo: "F4", on: .swedishLayout),
Test(that: 118, withModifiers: [.leftOption], isEqualTo: "F4", on: .swedishLayout),
Test(that: 118, withModifiers: [.leftShift, .leftOption], isEqualTo: "F4", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 119, isEqualTo: "↘", on: .swedishLayout),
Test(that: 119, withModifiers: [.leftShift], isEqualTo: "↘", on: .swedishLayout),
Test(that: 119, withModifiers: [.leftOption], isEqualTo: "↘", on: .swedishLayout),
Test(that: 119, withModifiers: [.leftShift, .leftOption], isEqualTo: "↘", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 120, isEqualTo: "F2", on: .swedishLayout),
Test(that: 120, withModifiers: [.leftShift], isEqualTo: "F2", on: .swedishLayout),
Test(that: 120, withModifiers: [.leftOption], isEqualTo: "F2", on: .swedishLayout),
Test(that: 120, withModifiers: [.leftShift, .leftOption], isEqualTo: "F2", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 121, isEqualTo: "⇟", on: .swedishLayout),
Test(that: 121, withModifiers: [.leftShift], isEqualTo: "⇟", on: .swedishLayout),
Test(that: 121, withModifiers: [.leftOption], isEqualTo: "⇟", on: .swedishLayout),
Test(that: 121, withModifiers: [.leftShift, .leftOption], isEqualTo: "⇟", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 122, isEqualTo: "F1", on: .swedishLayout),
Test(that: 122, withModifiers: [.leftShift], isEqualTo: "F1", on: .swedishLayout),
Test(that: 122, withModifiers: [.leftOption], isEqualTo: "F1", on: .swedishLayout),
Test(that: 122, withModifiers: [.leftShift, .leftOption], isEqualTo: "F1", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 123, isEqualTo: "←", on: .swedishLayout),
Test(that: 123, withModifiers: [.leftShift], isEqualTo: "←", on: .swedishLayout),
Test(that: 123, withModifiers: [.leftOption], isEqualTo: "←", on: .swedishLayout),
Test(that: 123, withModifiers: [.leftShift, .leftOption], isEqualTo: "←", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 124, isEqualTo: "→", on: .swedishLayout),
Test(that: 124, withModifiers: [.leftShift], isEqualTo: "→", on: .swedishLayout),
Test(that: 124, withModifiers: [.leftOption], isEqualTo: "→", on: .swedishLayout),
Test(that: 124, withModifiers: [.leftShift, .leftOption], isEqualTo: "→", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 125, isEqualTo: "↓", on: .swedishLayout),
Test(that: 125, withModifiers: [.leftShift], isEqualTo: "↓", on: .swedishLayout),
Test(that: 125, withModifiers: [.leftOption], isEqualTo: "↓", on: .swedishLayout),
Test(that: 125, withModifiers: [.leftShift, .leftOption], isEqualTo: "↓", on: .swedishLayout),
/// --------------------------------------------- 
Test(that: 126, isEqualTo: "↑", on: .swedishLayout),
Test(that: 126, withModifiers: [.leftShift], isEqualTo: "↑", on: .swedishLayout),
Test(that: 126, withModifiers: [.leftOption], isEqualTo: "↑", on: .swedishLayout),
Test(that: 126, withModifiers: [.leftShift, .leftOption], isEqualTo: "↑", on: .swedishLayout),
/// --------------------------------------------- 
]

@Test("com.apple.keylayout.Swedish-Pro", .tags(.keyCodes), arguments: tests)
@MainActor private func swedishLayout(_ test: Test) async throws {
  let keyCodes = KeyCodes()
  let inputManager = try InputSourceManager(test.identifier)
  let input = inputManager.selectedInputSource
  let result = try keyCodes.value(for: test.data.keyCode,
                                  modifiers: test.data.modifiers,
                                  from: input.source).displayValue
  #expect(result == test.data.expected)
}

private struct Test {
  let identifier: InputSourceIdentifier
  let data: Data

  init(that keyCode: Int, withModifiers modifiers: [VirtualModifierKey] = [],
       isEqualTo expected: String, on identifier: InputSourceIdentifier) {
    let data = Data(keyCode, expected: expected, modifiers: modifiers)
    self.identifier = identifier
    self.data = data
  }
}

private struct Data {
  let keyCode: Int
  let expected: String
  let modifiers: [VirtualModifierKey]

  init(_ keyCode: Int, expected: String, modifiers: [VirtualModifierKey]) {
    self.keyCode = keyCode
    self.expected = expected
    self.modifiers = modifiers
  }
}