/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Singleton
 - - - - - - - - - -
 ![Singleton Diagram](Singleton_Diagram.png)
 
 The singleton pattern restricts a class to have only _one_ instance.
 
 The "singleton plus" pattern is also common, which provides a "shared" singleton instance, but it also allows other instances to be created too.
 
 ## Code Example
 */
import UIKit

// MARK: - Singleton
let app = UIApplication.shared

public class MySingleton {
    //1
    static let shared = MySingleton()
    //2
    private init() { }
}
//3
let mySingleton = MySingleton.shared
//4
//let mySingleton1 = MySingleton()  -> 'MySingleton' initializer is inaccessible due to 'private' protection level

// MARK: - Singleton Plus
let defaultFileManager = FileManager.default
let customFileManager = FileManager()

public class MySingletonPlus {
    //1
    static let shared = MySingletonPlus()
    //2
    public init() { }
}
//3
let mySingletonPlus = MySingletonPlus.shared
//4
let mySingletonPlus1 = MySingletonPlus()

