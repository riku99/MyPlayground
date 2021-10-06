import UIKit

var str = "Hello, playground"
print(str)

var hensu = "hey"
let teisu = "ya"
hensu = "ok"
// teisu = "good" letは定数定義なので再割り当てできない

let intger: Int = 70 // 整数のデフォルト型はInt
let float: Float = 4.5
let double: Double = 2.5 // 浮動小数点のデフォルトはDouble

let label = "The width is"
let width = 94
//let _widthLabel = label + width typeを変換するには望んでいるtypeのインスタンスを生み出さなければいけない。ここではString
let widthLabel = label + String(width)
print(widthLabel)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."  // stringに何か値を組み込みたい場合は \() を使う。jsでいう${}と同じ感じ(?)
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
print(appleSummary)
print(fruitSummary)

// 複数行の文字列には """ を使う
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""
print(quotation)

var shoppingList = ["catfish", "water", "tulips"]
print(shoppingList)
shoppingList[1] = "bottle of water" // indexで変更可能
print(shoppingList)

var occupations = ["Melcom": "Captain","Kaylee": "Mechanic"]
occupations["Janye"] = "Public" // キー指定でで追加可能
print(occupations)

shoppingList.append("blue paint") // appendで最後に追加可能
print(shoppingList)

let emptyArray: [String] = []
let emptyDictionary:  [String: Float] = [:] // 空のディクショナリはこれで作れる

let indivisualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in indivisualScores { // for in を使ったループ。jsに似てるな
    if score > 50 {
        teamScore += 3
        print("more 50")
    } else {
        teamScore += 1
        print("less 50")
    }
}
print(teamScore)

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John"
var greeting = "Hello"
if let name = optionalName { // optionalの場合はif let で値の有無を判定(unwrap)する。nilの場合はfalseとなる
    greeting = "Hello \(name)"
} else {
    greeting = "no name"
}
print(greeting)

let nickname: String? = nil
let fulname: String = "John Appleseed"
let informationGreeting = "Hi \(nickname ?? fulname)" // nicknameが存在しなければfulnameが使われる
print(informationGreeting)

let vegetable = "red pepper"
// switch文はマッチしたスコープが実行されたら次行かないからbreakいらない
switch vegetable {
case "celery":
    print("This is celery")
case "cucmber", "watercress":
    print("This is cucumber or watercress")
case let x where x.hasSuffix("pepper"): // これはとりあえずこういう書き方をする、ということで覚える
    print("has pepper")
default:
    print("This is default")
}


// for ~ in でディクショナリのキーと値のペアを取得して繰り返し処理を行うことができる
// 今回キー側は使わない。その場合_でおかないと警告出る
let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25]
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

// whileによる条件ループ
var n = 2
while n < 100 {
    n *= 2
}
print(n)

// repeat ~ whileでも同じようにループできる
var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

// ..< を使ったループ。この場合だと3回繰り返される。iにはindexが渡される
var total = 0
for i in 0..<4 {
    total += i
}
print(total)

// ... を使ったループ。この場合は3回繰り返される。iにはindexが渡される
var _total = 0
for i in 0...3 {
    _total += i
}
print(_total)

// 関数。-> で戻り値。
func greet (person: String, day: String) -> String {
    return "Hello \(person), today is \(day)"
}
let greetResult = greet(person: "Bob", day: "Tuesday") // 呼び出しはどの引数かの指定も必要
print(greetResult)

// 通常引数名には関数定義の時点で与えられたパラメータの名前を使うが、_を使えばなくせるし、直前に違う名前与えることでそれ使える
func _greet (_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}
let _greetResult = _greet("Bob", on: "Tuesday")

// 複数の要素を返すことができる
func calculateStatistics (scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5,3,100,3,9])
print(statistics) // (min: 3, max: 100, sum: 120)
print(statistics.sum) // 120
print(statistics.2) // 120

// 関数in関数。一番上の関数スコープにある変数はネストされている関数の中でも使えるよ
func returnFifteen () -> Int {
    var y = 10
    func add () {
        y += 5
    }
    add()
    return y
}

// 関数は関数を返すこともできる
func makeIncrementer () -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer() // 関数返してる
var incrementResult = increment(7)
print(incrementResult)

// 関数を引数として受け取って実行できる
func hasAnyMatch(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen (number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]

let hasManyMatchResult = hasAnyMatch(list: numbers, condition: lessThanTen)
print(hasManyMatchResult) // true

// jsでいうmap
// swiftの基本(?)となるクロージャ
let numbersResult = numbers.map({(number: Int) -> Int in
    let result = 3 * number
    return result
})
print(numbersResult)

// やってることは上と同じ
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

// 上と同じ。nmaeの代わりに $数字　の形で取ることができる
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)

// クラス。変数や定数、関数の宣言は同じように書かれる
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

var shape = Shape() // インスタンスの作成
shape.numberOfSides = 7 // プロパティにアクセス
var shapeDescription = shape.simpleDescription() // メソッドの使用
print(shapeDescription)

class NamedShape {
    var numbersOfSides: Int = 0
    var name: String
    
    // イニシャライザ。NamedShape(name: "my name")のような形でプロパティnameに代入できる
    init (name: String) {
        self.name = name // イニシャライザの中ではプロパティのアクセスにselfを使う
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numbersOfSides) sides"
    }
}

// サブクラス: スーパクラスで継承可能
class Square: NamedShape {
    var sideLength: Double
    
    init (sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name) // スーパークラスのイニシャライザの実行
        numbersOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    // オーバーライドする場合は overrride つけないとエラー
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square") // インスタンス作成
let area = test.area()
let _desc = test.simpleDescription()
print(area)
print(_desc)

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init (sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numbersOfSides = 3 // スーパークラスのプロパティを変更
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0 // セッターの新しい値はデフォルトでnewValueに格納される
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
    // プロパティオブザーバーは変更を監視するのでプロパティが変更できなければいけない。なのでvar
    var triangle: EquilateralTriangle {
        // willSetはプロパティオブザーバ。対象のプロパティの変更を監視。イニシャライザでの変更の場合は実行されない
        willSet {
            print("新しくtriangleに \(newValue) がセットされました")
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            print("新しくaquareに \(newValue) がセットされました")
            triangle.sideLength = newValue.sideLength
        }
    }
    init (size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square") // squareが変更されるので、319行目のwillSetが実行される。その中でtriangle.sideLengthも変更される
print(triangleAndSquare.triangle.sideLength)

// optionalな値には ? つける。TSと似てるな
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

// aceに1を入れた場合、twoは2, threeは3が代入される
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        case .three:
            return "value is three"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
print(ace) // ace
print(aceRawValue) // 1
let two = Rank.two
let twoValue = two.rawValue // aceに1を入れているのでここは2になる。もし3をいれた場合は4になる
print(two) // two
print(twoValue) // 2

// rawValue: 3 でインスタンス作成。このインスタンスのselfはthree
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    print(threeDescription) // "value is three"
    print(convertedRank.self) // three
}

enum BloodType {
    case ab
    case a
    case b
    case o
}
let typeAB = BloodType.ab
print(typeAB) // ab

enum Signal: Int {
    case blue = 1
    case yellow = 2
    case red = 3
//    case others = "ok" enumに型を指定した場合、全ての要素がその型でないといけない
}
let signalBlue: Signal = .blue // enumの型 :Signal を指定しているので .blue のみで取得可能
print(signalBlue) // blue
let signalBlueValue = signalBlue.rawValue // .rawValueを使うことで割り当てられた値を取得できる
print(signalBlueValue) // 1

enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        default:
            return "othrers"
        }
    }
}
let _hearts = Suit.hearts // SuitにはrawValueが提供されてないので .rawValue は使えない
print(_hearts) // hearts
let _heartsDescription = _hearts.simpleDescription()
print(_heartsDescription) // "hearts"

enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese")
print(success)
print(failure)

switch success {
case let .result(sunrise, sunset): // "6:00 am", "8:09 pm"が取れる
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure... \(message)")
}

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
print(threeOfSpadesDescription) // The value is three of spades

// class, structの違い
class Cat {
    var like: String = "魚"
}
struct Dog {
    var like: String = "肉"
}
let tama: Cat = Cat()
let pochi: Dog = Dog()

func initWithData(_ data: Cat) {
    let data = data
    data.like = "マタタビ"
}

func initWithData2(_ data: Dog) {
    var data = data
    data.like = "マタタビ"
}

initWithData(tama)
initWithData2(pochi)

print(tama.like) // マタタビ。classから生成されたtamaは参照型なので変更がそのまま参照される
print(pochi.like) // 肉。structから生成されたpochiは値型なので初回生成された値は不変

protocol ExampleProtocl {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocl {
    var simpleDescription: String = "a very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted"
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription
print(aDescription)

// structでは自身のストラクチャを変更するメソッドにはmutatingが必要
struct SimpleStructure: ExampleProtocl {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
print(bDescription)

struct User {
    var firstName: String
    var lastName: String
    
    func ensureNameCapitalization() {
       // firstName = firstName.capitalized Structのプロパティは内部で不変。なのでここはエラーがでる。
    }
    
    // mutatingキーワードを使えば内部プロパティを変換することができる。
    // 内部的にコピーが起こっていてそれに置き換わっている。
    // https://ichi.pro/swift-no-mutating-ki-wa-do-o-rikaisuru-124340177265398
    mutating func newEnsureNameCapitalization() {
        firstName = firstName.capitalized
    }
}

// extensionは既存のTypeに対してメソッドやプロパティを追加するもの
// これはIntのように元々組み込まれているTypeやライブラリから提供されているものにも追加することができる
extension Int: ExampleProtocl {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

// protoclは他の型のように使うことができる
// ここではprotocolValueのにExampleProtocolを指定しているのでここで定義されているもの以外のメソッドを使うことはできない
// aは本来SimpleClassのはずだが、SimpleClassとExampleProtoclのメソッドが一致しているので割り当てることができる
let protocolValue: ExampleProtocl = a
print(protocolValue.simpleDescription)

// Errorを使いエラーを表すことができる
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// Errorを返す可能性のある関数はthrowsを記す
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// エラーハンドリングの方法はいくつかある。その中の1つはdo-catch try
do {
    let pResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(pResponse)
} catch {
    // 発生したエラーは error で取れる。(変更可能)
    print(error) // noToner
}

// もう1つは try? を使う方法
// errorが返された場合はnilが返され、それ以外の場合はoptional(...)が返される。
let printerSuccess = try? send(job: 1884, toPrinter: "Bob")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
print(printerSuccess) // optional(...)
print(printerFailure) // nil

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

// deferキーワード
// returnされる直前に実行されるブロック
// この関数を実行すると、 1, 3, 2の順でprintされる
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    print(1)
    defer {
        print(2)
        fridgeIsOpen = false
    }
    print(3)
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen) // false

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
let arrayResult = makeArray(repeating: "knock", numberOfTimes: 4)
print(arrayResult) // [knock, knock, knock, knock]

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Element: Equatable, T.Element == U.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])

func makeTuple(_ a: Int, _ b: Int) -> (Int, Int) {
    return (a, b)
}
let intTuple = makeTuple(24, 32) // (24, 32)
print(intTuple)

// makeTupleのInt受け取る部分をStringにした
func makeTuple2(_ a: String, _ b: String) -> (String, String) {
    return (a, b)
}
let stringTuple = makeTuple2("前", "うしろ")

// Doubleでもこれを作りたいとなると、、何回も同じものを作ることになる

// ジェネリクスを使って対応
// 引数、戻り値から型を推論
func makeTupleGenerics<T>(_ a: T, _ b: T) -> (T, T) {
    return (a, b)
}
let testTuple = makeTupleGenerics(1, 10)
print(testTuple) // (1, 10)

// < などはComparableに準拠してるデータでないと使えない
// <T>のみだと、Comparableに準拠しているかどうか判断できないので、<T: Comparable>としてTはComparableに準拠していることを保証
func makeTuple3<T: Comparable>(_ a: T, _ b: inout T) -> (T, T) {
    if b < a {
          b = a
    }
    return (a, b)
}
