What classes does each implementation include? Are the lists the same?
Both implementations use the same three classes (CartEntry, ShoppingCard, & Order) but in different ways. 

Write down a sentence to describe each class.
CartEntry is the class that initalizes for each product and the quantity desired of this product.
ShoppingCart is the class that collects the products that are wanting to be purchased.
Order is the class that determines the total cost for the items within ShoppingCart.

How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
When initialized, the Order class creates a new instance of the ShoppingCart class. That ShoppingCart instances in turn collects instances of CartEntry. Once CartEntry instances are housed within the ShoppingCart class, the Order class can determine the grand total cost for the items within ShoppingCart.
Composition: 1 Order contains 1 ShoppingCart; 1 ShoppingCart contains many CartEntries. 

What data does each class store? How (if at all) does this differ between the two implementations?
In Implementation A, CartEntry only stores @unit_price and @quantity of the product desired. In Implementation B, the price for that item based on the quantity is stored.
In Implementation A, ShoppingCart only stores instances of CartEntry within the @entries array. In Implementation B, additionally, the subtotal price of the items stores in @entries array is determined.
In Implementation A, Order stores an instance of ShoppingCart and determines the grand total of items in @entries in ShoppingCart.

What methods does each class have? How (if at all) does this differ between the two implementations?
In Implementation A, the CartEntry class only contains two reader methods for the @unit_price and @quantity of the product. In Implementation B, the CartEntry class adds to A with an instance method that determines the price of the product (unit_price * quantity desired).
In Implementation A, the ShoppingCart class contains only a reader method for @entries which is an array to house CartEntry instances. In Implementation B, it builds on A with a instance method called #price that essentially determines the subtotal of all the items contained in @entries array.
In Implementation A & B, the Order class initalizes an instance of ShoppingCart class and contains a method for #total_price that determines the grand total of items within the @entries array in ShoppingCart.

Consider the Order#total_price method. In each implementation:
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
In A, "lower logic" is contained in Order. In B, it is delegated to every class.

Does total_price directly manipulate the instance variables of other classes?
In A, total_price touches on the instance of ShoppingCart's reader method, @entries. In B, total_price only touches the one instance of ShoppingCart and the return value for the method ShoppingCart#price.

If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
I think B would be easier to modify if items are cheaper in bulk. The logic could be changes in CartEntry#price with an if-statement on the threshold of quantity of items and then returning #price.

Which implementation better adheres to the single responsibility principle?
They're both good implementations but I think B does a slightly better job of SRP. Even though there are more lines of code, it tries to calculate #price for each class versus leaving it all for Order to determine.

Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
B is slightly more loosely coupled because of Order#total_price method. In A, total_price is determined by going to ShoppingCart and then going into the unit_price and quantity of each item. Whereas in B, #total_price only goes into ShoppingCart and pulls out the sub_total value.