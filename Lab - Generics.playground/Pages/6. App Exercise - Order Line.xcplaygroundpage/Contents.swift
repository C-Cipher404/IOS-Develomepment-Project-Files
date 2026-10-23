/*:
## App Exercise - Order Line

 >These exercises reinforce Swift concepts in the context of a coffee shop ordering app.

 Orders are made in the order they're placed, so the app keeps them in a queue. Copy your `Queue` and its extension from the last page, and paste them below the `Order` struct.
 */

struct Order: Equatable {
    let customerName: String
    let drinkName: String
}
struct Queue<Element> {
    private var items: [Element] = []

    mutating func enqueue(_ item: Element) {
        items.append(item)
    }

    mutating func dequeue() -> Element? {
        if items.isEmpty {
            return nil
        }
        return items.removeFirst()
    }

    func peek() -> Element? {
        return items.first
    }

    var count: Int {
        return items.count
    }
}

extension Queue where Element: Equatable {
    func contains(_ item: Element) -> Bool {
        return items.contains(item)
    }
}
//:  Create a `Queue<Order>` called `orderLine`. Enqueue orders for Ana (Latte), Ben (Mocha), Cal (Cold Brew) and Dee (Iced Tea).

var orderLine = Queue<Order>()

orderLine.enqueue(Order(customerName: "Ana", drinkName: "Latte"))
orderLine.enqueue(Order(customerName: "Ben", drinkName: "Mocha"))
orderLine.enqueue(Order(customerName: "Cal", drinkName: "Cold Brew"))
orderLine.enqueue(Order(customerName: "Dee", drinkName: "Iced Tea"))



//:  Dequeue the first order and print a line like "Now making a Latte for Ana". (Hint: `dequeue()` returns an optional, so unwrap it with `if let`.) Then print how many orders are still waiting.


if let nextOrder = orderLine.dequeue() {
    print("Now making a \(nextOrder.drinkName) for \(nextOrder.customerName)")
}

print("Orders still waiting: \(orderLine.count)")


//:  Make `Order` conform to `Equatable`. Then create a new `Order` for Dee's Iced Tea, pass it to `orderLine.contains(_:)`, and print the result.
let deeOrder = Order(customerName: "Dee", drinkName: "Iced Tea")

print(orderLine.contains(deeOrder))


//:  The app also has a tip jar. A protocol can't use `<T>`, so this protocol uses `associatedtype` for its placeholder type. Each type that conforms decides what `Item` is.


protocol Container {
    associatedtype Item
    mutating func add(_ item: Item)
    var count: Int { get }
}


//:  Write a struct called `TipJar` that conforms to `Container`, with `Double` as its `Item`. Store the tips in a `private var tips: [Double]` that starts empty, and write the `add(_:)` method and `count` property that `Container` requires. Create a `TipJar`, add three tips, and print its `count`.


struct TipJar: Container {
    private var tips: [Double] = []

    mutating func add(_ item: Double) {
        tips.append(item)
    }

    var count: Int {
        return tips.count
    }
}

// Create a tip jar
var tipJar = TipJar()

// Add three tips
tipJar.add(2.50)
tipJar.add(5.00)
tipJar.add(3.75)

// Print the number of tips
print(tipJar.count)


//:  In a comment, explain how Swift knows that `Item` is `Double` for `TipJar`.

// Answer: Swift knows Item is Double because we used
// typealias Item = Double in TipJar. This tells Swift
// that the container will hold Double values.

/*:
 [Previous](@previous)  |  page 6 of 6
 */
