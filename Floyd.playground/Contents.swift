import UIKit

var i=0, k=1

print("Floyd's Triangle for 4 Rows")

for i in 1...4{
    for _ in 1...i{
        print(k, terminator:" "); k+=1
    }
    print(" ")
}
