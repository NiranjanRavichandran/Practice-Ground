import Foundation


//This uses a trick commonly seen in C code of subtracting the value of the char ’0’ literal to convert from ascii values to decimal values. See this site for the conversions: https://www.asciitable.com

let intChar: Character = "3"
//Unicode.Scalar("0").value - returns 48
//intChar.unicodeScalars.first!.value - Unicode.Scalar("0").value - returns (51 - 48) = 3
