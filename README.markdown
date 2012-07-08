<h1 id="iOS Model-View-Presenter">Model-View-Presenter Example in iOS</h1>

<p>
<b>NOTE</b>  This sample code demonstrates only ONE method in the presenter class, a method to push an array of book titles to the view. In a typical, busy view controller with multiple events being handled, the underlying presenter class might have many methods to serve each of these activities.
</p>

<p>
Over time, I will try and add additional presenter methods to this example.
</p>

<hr/>

<h3>Explanation of Model-View-Presenter (used with protocols in iOS)</h3>
<p>
MVP is a solution to the age-old problem of business logic and external coordination concerns slipping into the presentation layer. The view controllers in iOS are largely concerned with serving the view, either by listening for events and handling them (typically through delegate methods or IBAction methods), or by assigning information to properties. But it is difficult to prevent the rest of the application's concerns slipping into this layer by default.
</p>

<p>
The best way to prevent this is by writing unit tests against the view controller. However, the view controller has many concerns and couplings that would make truly isolated unit-tests difficult.
</p>

<p>
The Model-View-Presenter pattern addresses this by creating a new, simple class called a presenter, with no direct dependencies on any concerns above it (presentation) or below it (business logic, IO, data). The Presenter achieves this by only operating against protocols (interfaces in java/C#) which have been injected into the constructor (alloc/init) of the class. Unit tests use a combination of mock objects (that observe and verify behavior), stubs (simple auto-generated implementations of the protocol) or fully-created fake classes to verify the behavior of the presenter, without ever directly connecting to the view controller or underlying data sources.
</p>

<p>
In this example code, the implementation of Model-View-Presenter uses:
<ul>
<li>groups that store Presenters, Views, Models (and also: Repositories and ViewControllers)</li>
<li>the Presenter init takes as parameters protocols (in Java and C#, this would be interfaces)</li>
<li>the first parameter is a protocol for a repository (to query and return the Model)</li>
<li>the second parameter is a protocol for the View (to receive content that is pushed to it, and to notify of events that it has received)</li>
<li>the Model group is empty; the model in this implementation is merely an NSString* (a book title)</li>
</ul>
</p>

<p>
The first unit test in this sample code uses mock objects to design and verify the behavior of the presenter methods. These methods coordinate the actions of the protocols that have been dependency-injected into the presenter's init. Specifically, the test verifies its expectation that the presenter's displayBooksFromBookstore method will:
<ul>
<li>find all books from the book store repository</li>
<li>"push" those books to the view</li>
</ul>
</p>

<p>
The second unit test uses a fake class to verify that data passed through the presenter matches as expected.
</p>

<p>
Finally: What should the view controller look like when Model-View-Presenter is used?
</p>

<p>
It should have 4 main effects:
<ul>
<li>An init or early event in the view controller should instantiate the presenter, passing in "self" as the conforming view protocol</li>
<li>your view controller will still have lots of methods--filled with the event handling and delegate fulfilment methods that are typically required for an objective-C application. But the CONTENT of those methods will have changed.</li>
<li>these methods should now contain only presentation logic. For example, the table row event will still have to retrieve the cell by its identifier and assign values to the cell's contents--those are a presentation-level concern</li>
<li>but any non-presentation logic (coordination logic, business logic, model manipulation) will now be passed to presenter methods instead.</li>
</ul>
</p>

<p>
And those presenter methods will now be isolated/decoupled and therefore can (and should) each be verified and validated by mock and unit tests.
</p>