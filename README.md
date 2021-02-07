For Developers
============
You can also see [Java](https://github.com/starlangsoftware/Math), [Python](https://github.com/starlangsoftware/Math-Py), [Cython](https://github.com/starlangsoftware/Math-Cy), [C++](https://github.com/starlangsoftware/Math-CPP), or [C#](https://github.com/starlangsoftware/Math-CS) repository.

## Requirements

* Xcode Editor
* [Git](#git)

### Git

Install the [latest version of Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

## Download Code

In order to work on code, create a fork from GitHub page. 
Use Git for cloning the code to your local or below line for Ubuntu:

	git clone <your-fork-git-link>

A directory called Math-Swift will be created. Or you can use below link for exploring the code:

	git clone https://github.com/starlangsoftware/Math-Swift.git

## Open project with XCode

To import projects from Git with version control:

* XCode IDE, select Clone an Existing Project.

* In the Import window, paste github URL.

* Click Clone.

Result: The imported project is listed in the Project Explorer view and files are loaded.


## Compile

**From IDE**

After being done with the downloading and opening project, select **Build** option from **Product** menu. After compilation process, user can run Math-Swift.

Detailed Description
============

+ [Vector](#vector)
+ [Matrix](#matrix)
+ [Distribution](#distribution)

## Vector

Bir vektör yaratmak için:

	a = Vector(values: [])

Vektörler eklemek için

	func add(x: Double)

Çıkarmak için

	func subtract(v: Vector)
	func difference(v: Vector) -> Vector

İç çarpım için

	func dotProduct(v: Vector) -> Double
	func dotProductWithSelf() -> Double

Bir vektörle cosinüs benzerliğini hesaplamak için

	func cosineSimilarity(v: Vector) -> Double

Bir vektörle eleman eleman çarpmak için

	func elementProduct(v: Vector) -> Vector

## Matrix

3'e 4'lük bir matris yaratmak için

	a = Matrix(row: 3, col: 4)

Elemanları rasgele değerler alan bir matris yaratmak için

	init(row: Int, col: Int, min: Double, max: Double)

Örneğin, 

	a = Matrix(row: 3, col: 4, min: 1, max: 5)
 
3'e 4'lük elemanları 1 ve 5 arasında değerler alan bir matris yaratır.

Birim matris yaratmak için

	init(size: Int)

Örneğin,

	a = Matrix(size: 4)

4'e 4'lük köşegeni 1, diğer elemanları 0 olan bir matris yaratır.

Matrisin i. satır, j. sütun elemanını getirmek için 

	func getValue(rowNo: Int, colNo: Int) -> Double

Örneğin,

	a.getValue(rowNo: 3, colNo: 4)

3. satır, 4. sütundaki değeri getirir.

Matrisin i. satır, j. sütunundaki elemanı değiştirmek için

	func setValue(rowNo: Int, colNo: Int, value: Double)

Örneğin,

	a.setValue(rowNo: 3, colNo: 4, value: 5)

3. satır, 4.sütundaki elemanın değerini 5 yapar.

Matrisleri toplamak için

	func add(m: Matrix)

Çıkarmak için 

	func subtract(m: Matrix)

Çarpmak için 

	func multiply(m: Matrix) -> Matrix

Elaman eleman matrisleri çarpmak için

	func elementProduct(m: Matrix) -> Matrix

Matrisin transpozunu almak için

	func transpose() -> Matrix

Matrisin simetrik olup olmadığı belirlemek için

	func isSymmetric() -> Bool

Determinantını almak için

	func determinant() -> Double

Tersini almak için

	func inverse()

Matrisin eigenvektör ve eigendeğerlerini bulmak için

	func characteristics() -> [Eigenvector]

Bu metodla bulunan eigenvektörler eigendeğerlerine göre büyükten küçüğe doğru 
sıralı olarak döndürülür.

## Distribution

Verilen bir değerin normal dağılımdaki olasılığını döndürmek için

	func zNormal(z: Double) -> Double

Verilen bir olasılığın normal dağılımdaki değerini döndürmek için

	func zInverse(p: Double) -> Double

Verilen bir değerin chi kare dağılımdaki olasılığını döndürmek için

	func chiSquare(x: Double, freedom: Int) -> Double

Verilen bir olasılığın chi kare dağılımdaki değerini döndürmek için

	func chiSquareInverse(p: Double, freedom: Int) -> Double

Verilen bir değerin F dağılımdaki olasılığını döndürmek için

	func fDistribution(F: Double, freedom1: Int, freedom2: Int) -> Double

Verilen bir olasılığın F dağılımdaki değerini döndürmek için

	func fDistributionInverse(p: Double, freedom1: Int, freedom2: Int) -> Double

Verilen bir değerin t dağılımdaki olasılığını döndürmek için

	func tDistribution(T: Double, freedom: Int) -> Double

Verilen bir olasılığın t dağılımdaki değerini döndürmek için

	func tDistributionInverse(p: Double, freedom: Int) -> Double
