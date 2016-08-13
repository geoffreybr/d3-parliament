# d3 Parliament chart

[![](http://www.geoffreybrossard.fr/github/d3-parliament/example.png)](http://www.geoffreybrossard.fr/github/d3-parliament/)

* [Live example](http://www.geoffreybrossard.fr/github/d3-parliament/)
* [Example code](example/)

## Quick Start

### Install with Bower
```
bower install d3-parliament
```

### Use it!
````javascript
/* set up the parliament */
var parliament = d3.parliament();
parliament.width(500).height(500).innerRadiusCoef(0.4);
parliament.enter.fromCenter(true).smallToBig(true);
parliament.exit.toCenter(false).bigToSmall(true);

/* register event listeners */
parliament.on("click", function(d) { alert("You clicked on a seat of " + d.party.name); });
parliament.on("mouseover", function(d) { console.log("mouse on " + d.party.name); });
parliament.on("mouseout", function(d) { console.log("mouse out of " + d.party.name); });

/* add the parliament to the page */
d3.json("data.json", function(d) {
    d3.select("svg").datum(d).call(parliament);
});
````

## Documentation
### Parameters
You can set up the parameters of the parliament passing the values through the function named as the
parameter (see [the example](example/)):
* **width** *Number* = The max. width of the parliament (which will always be half a circle)
* **height** *Number* = The max. height of the parliament (which will always be half a circle)
* **innerRadiusCoef** *Number* = The coefficient applied to get the free space in the middle (min=0: no space; max=0.99: very few space for the seats)

### Events
All the mouse and touch events that can be thrown on the circles that will represent the seats are available :
**click**, **dblclick**, **mousedown**, **mouseenter**, **mouseleave**, **mousemove**, **mouseout**, **mouseover**, **mouseup**, **touchcancel**, **touchend**, **touchmove**, **touchstart**

You can register event listeners calling *on*. The first parameter given to the event listener is
an object containing the following fields:
* **polar** *Object* = The polar coordinates of the seat
  * **r** *Number* = radius
  * **teta** *Number* = angle
* **cartesian** *Object* = The cartesian coordinates of the seat, origin is centered on the bottom of the chart
  * **x** *Number* = number of pixels on x axe from the origin
  * **y** *Number* = number of pixels on y axe from the origin
* **party** *Object* = data of a party that you put in the array (see Data)
* **data** *Object* = data of this seat (see Data)

### Data
The data given to *datum* before calling *parliament* (see example) should be an array of objects,
one object per party in the parliament. These objects should contain the fields:
* **id** *String* = the unique id of the party
* **seats** *Array* | *Number* = if it is a number, it is the number of seats for this party in the parliament ; if it is an *Array*, one element is a seat (or MP), you can put all you want in it (*String*, *Object*...), you will retrieve it as **data** field in your event listener.

Then, you can add more data if you want to retrieve them in your event listeners.

## License
MIT License

## TODO
* Check the data to avoid infinite loop or division by zero
* Animation enter from / exit to outside of the playground svg
* Other? Let me know!
