-------------------------
## learn dart for flutter app
##### dart和flutter教程 参考官方文档即可
[dart](https://www.dartlang.org/guides/language/language-tour)
-------------------------

### basic of dart language
[dart language tour](https://www.dartlang.org/guides/language/language-tour)

[learn dart in 30min](https://www.jianshu.com/p/06aebcad0543)

### dart package manager
[dart pub usage](https://www.dartlang.org/tools/pub/get-started)
```dart
pub is the package manager for the dart language, 
containing reusable libraries & packages for Flutter, AngularDart, and general Dart programs.

create a pubspec.yaml file in project, specify dependent packages in it.
run `pub get`
```

#### A basic Dart program
```dart
printInteger(int a) {
  print('The number is $a.');
}
  
main() {
  var number = 42; 
  printInteger(number); 
}
```

#### Variables
```dart
// var
var name = 'Bob';

//dynamic type
//If an object isn’t restricted to a single type, specify dynamic type:
dynamic name = 'Bob'
```

#### Default value
```dart
//Uninitialized variables have an initial value of null.
int lineCount;
assert(lineCount == 0);
assert(lineCount == null);
```

#### final and const
```dart
final name = 'Bob'; 
const bar = 1000000;
```

#### data types
```dart
numbers (int/double)
strings
booleans
list (extensive arrays)  
map
runes (for expressing Unicode characters in a string)
symbols (operator, you may never need this)
generic type (List<String>, Map<String, int>)
```

#### int/double
```dart
// String -> int
var one = int.parse('1');
assert(one == 1);

// String -> double
var onePointOne = double.parse('1.1');
assert(onePointOne == 1.1);

// int -> String
String oneAsString = 1.toString();
assert(oneAsString == '1');

// double -> String
String piAsString = 3.14159.toStringAsFixed(2);
assert(piAsString == '3.14');
```

#### String
```dart
//You can put the value of an expression inside a string by using ${expression}
var s = 'string interpolation';
print('That deserves all caps ${s.toUpperCase()} is very handy!');

//String in dart very like String in Python !!
var s1 = 'String '
    'concatenation'
    " works even over line breaks.";
assert(s1 == 'String concatenation works even over line breaks.');

var s2 = 'The + operator ' + 'works, as well.';
assert(s2 == 'The + operator works, as well.');

var s1 = '''
You can create
multi-line strings like this one.
''';

var s2 = """This is also a
multi-line string.""";

//raw string prefixing it with r
var s = r'In a raw string, not even \n gets special treatment.';

//Runes to express Unicode characters in a string.

```

#### Boolean
```dart
//Dart’s type safety means that you can’t use code like: 
//  if (nonbooleanValue) or assert (nonbooleanValue). 
//  Instead, explicitly check for values, like this:

// Check for an empty string.
var fullName = '';
assert(fullName.isEmpty);

// Check for zero.
var hitPoints = 0;
assert(hitPoints <= 0);

// Check for null.
var unicorn;
assert(unicorn == null);

// Check for NaN.
var iMeantToDoThis = 0 / 0;
assert(iMeantToDoThis.isNaN);
```

#### List (里面类型必须相同)
```dart
var list = [1, 2, 3];
list.add(55);
assert(list.length == 3);
assert(list[1] == 2);

list[1] = 1;
assert(list[1] == 1);

 //The analyzer infers that list has type List<int>. 
 //If you try to add non-integer objects to this list, 
 //the analyzer or runtime raises an error. 
```

#### map (里面类型必须相同)
```dart
var gifts = {
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
};

var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 'argon',
};

gifts['fifth'] = 'X golden rings';
nobleGases[18] = 'X argon';

//If you look for a key that isn’t in a map, you get a null in return:
var gifts = {'a': 'partridge'};
assert(gifts['b'] == null);

//The analyzer infers that:
//  gifts has the type Map<String, String> and 
//  nobleGases has the type Map<int, String>
//If you try to add the wrong type of value to either map, 
//the analyzer or runtime raises an error
```

#### generic type
```dart
var names = List<String>();
names.addAll(['Seth', 'Kathy', 'Lars']);
names.add(42);    // Error
names.add('42');  // Ok
```

#### Runes 
```dart
In Dart, runes are the UTF-32 code points of a string.

Unicode defines a unique numeric value for each letter, digit, and symbol 
used in all of the world’s writing systems. 
Because a Dart string is a sequence of UTF-16 code units, 
expressing 32-bit Unicode values within a string requires special syntax.

The usual way to express a Unicode code point is \uXXXX, 
where XXXX is a 4-digit hexadecimal value. 
For example, the heart character (♥) is \u2665. 
To specify more or less than 4 hex digits, place the value in curly brackets. 
For example, the laughing emoji (😆) is \u{1f600}.

The String class has several properties you can use to extract rune information. The codeUnitAt and codeUnit properties return 16-bit code units. 
Use the runes property to get the runes of a string.
```

#### Symbols
```dart
A Symbol object represents an operator or identifier declared in a Dart program. You might never need to use symbols, 
but they’re invaluable for APIs that refer to identifiers by name, 
because minification changes identifier names but not identifier symbols.

To get the symbol for an identifier, use a symbol literal, 
which is just # followed by the identifier:

#radix
#bar
```

#### Functions
```dart
bool isNoble(int atomicNumber) {
  return atomicNumber != 0;
}

//Although Effective Dart recommends type annotations for public APIs, 
//the function still works if you omit the types:
isNoble(atomicNumber) {
  return atomicNumber != 0;
}

//The => expr syntax is a shorthand for { return expr; }. 
//The => notation is sometimes referred to as fat arrow syntax.
bool isNoble(int atomicNumber) => atomicNumber != 0;
```

#### Function parameters
```dart
A function can have 2 types of parameters: required and optional
The optional parameters also have 2 types: named and positional
```
```dart
//Normal required parameters
String func(int a, String b){...}

func(1, 'abc')

//Optional named parameters
void func(String from, String msg, {bool bold, bool hidden}) {...}

func('a', 'b')
func('a', 'b', bold: true, hidden: false)

//Optional positional parameters
String func(String from, String msg, [String device]) {...}

func('Bob', 'Howdy') 
func('Bob', 'Howdy', 'smoke signal') 

//Optional parameters's default value is null, except you have specifed it.
void func(String from, String msg, {bool bold=true, bool hidden=true}) {...}
String func(String from, String msg, [String device='haha']) {...}

//You can also pass lists or maps as default values.
void doStuff({List<int> list = const [1, 2, 3],
              Map<String, String> gifts = const {
                  'first': 'paper',
                  'second': 'cotton',
                  'third': 'leather'
              }}) {
  print('list:  $list');
  print('gifts: $gifts');
}
```

#### The main() function
```dart
Every app must have a top-level main() function, 
which serves as the entrypoint to the app. 
The main() function returns void and has an optional List<String> parameter.
Here’s an example of the main() function for a web app:

void main(List<String> arguments) {
  print(arguments);

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');
}
```

#### Functions as first-class objects
```dart
//You can pass a function as a parameter to another function. For example:
void printElement(int element) {
  print(element);
}

var list = [1, 2, 3];
list.forEach(printElement);

//You can also assign a function to a variable, such as:
var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
assert(loudify('hello') == '!!! HELLO !!!');
```

#### Anonymous functions
```dart
var list = ['apples', 'bananas', 'oranges'];
list.forEach( (item){
    print('${list.indexOf(item)}: $item');
  }
);
```

#### Lexical closures
```dart
A closure is a function object that has access to variables in its lexical scope, 
even when the function is used outside of its original scope.

makeAdder() captures the variable addBy. 
Wherever the returned function goes, it remembers addBy.

/// Returns a function that adds [addBy] to the
/// function's argument.
Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

void main() {
  // Create a function that adds 2. it remember 2.
  var add2 = makeAdder(2); 

  // Create a function that adds 4. it remember 4.
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}
```

#### Operators
```dart
&&  ||  !
conditional	expr1 ? expr2 : expr3
```

#### Control flow statements
```dart
if (isRaining()) {
  you.bringRainCoat();
} else if (isSnowing()) {
  you.wearJacket();
} else {
  car.putTopDown();
}

var message = StringBuffer('Dart is fun');
for (var i = 0; i < 5; i++) {
  message.write('!');
}

var collection = [0, 1, 2];
for (var x in collection) {
  print(x); // 0 1 2
}

while (true) {
  if (shutDownRequested()) break;
  processIncomingRequests();
}

var comman = 'OPEN';
switch (command) {
  case 'CLOSED':
    executeClosed();
    break;
  case 'PENDING':
    executePending();
    break;
  default:
    executeUnknown();
}
```

#### Exceptions
```dart
try {
  breedMoreLlamas();
} on OutOfLlamasException {
  print('OutOfLlamasException happen !');
  rethrow;
} on InOfLlamasException {
  print('InOfLlamasException happen !');
  throw MyException('this is my exception...');;
} on Exception catch (e) {
  print('Exception: $e');
} catch (e, s) {
  // No specified type, handles all
  print('Exception: $e');
  print('Traceback: $s');
}finally {
  cleanLlamaStalls();
}

```

#### Classes
```dart
Dart is an OOP language with classes and mixin-based inheritance. Every object is an instance of a class
```
[dart Class](https://www.dartlang.org/guides/language/language-tour#classes)

```dart
// 一个简单的类如下代码所示
class Person {
  String name;
  int age;
  String gender;

  Person(this.name, this.age, this.gender);

  sayHello() {
    print("hello, this is $name, I am $age years old, I am a $gender");
  }
}
/*
上面的Person类中有3个成员变量，一个构造方法和一个成员方法.
看起来比较奇怪的是Person的构造方法，里面传入的3个参数都是this.xxx，而且没有大括号{}包裹的方法体，
这种语法是Dart比较独特而简洁的构造方法声明方式，它等同于下面的代码：
*/
Person(String name, int age, String gender) {
    this.name = name;
    this.age = age;
    this.gender = gender;
}

//类的使用
var p = new Person("zhangsan", 20, "male");
  p.sayHello(); 
  p.age = 50;
  p.gender = "female";
  p.sayHello(); 


// 类的静态变量和静态方法
class Cons {
  static const name = "zhangsan";

  static sayHello() {
    print("hello, this is ${Cons.name}");
  }
}

main() {
  Cons.sayHello(); 
  print(Cons.name);
}

```

#### async/await异步语法
*Dart提供了类似python3中的async/await语法,这种异步操作在Flutter开发中会经常遇到,比如网络IO操作*
```dart
import 'dart:async';
import 'package:http/http.dart' as http;

Future<String> getNetData() async {
  http.Response res = await http.get("http://www.baidu.com");
  return res.body;
}

main() {
    getNetData().then( 
      (str) {
        print(str);
      }
    );
}

```




