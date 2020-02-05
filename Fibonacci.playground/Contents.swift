import UIKit

func fibo(fiblimit: Int){
    var i=0, j=1, k=0

    print(i, j, terminator:" ")
    for _ in 1...fiblimit{
        k=i+j
        i=j
        j=k
        print(k, terminator:" ")
    }
}

fibo(fiblimit: 30)
