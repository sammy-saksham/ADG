import UIKit
func Floyd(floyd: Int){
    var k=1

    print("Floyd's Triangle for \(floyd) Rows")

    for i in 1...floyd{
        for _ in 1...i{
            print(k, terminator:" "); k+=1
        }
        print(" ")
    }
}

Floyd(floyd: 10)
