#Rails Continued

##HTTP Requests with Typhoeus
- Typhoeus is a gem that wraps `libcurl`, which is a tool to make web requests using Ruby.
- Typhoeus also allows for parallel requests for maximum efficiency.

[Link to the Typhoeus documentation](https://github.com/typhoeus/typhoeus)

Let's go ahead and install the gem into our project:

```
gem "typhoeus"
```

####Making Requests with Typhoeus

```
request = Typhoeus::Request.new(
	"www.example.com",
	method: :post,
	params: { field1: "a field" },
	headers: { Accept: "text/html" }
)
```

####Accessing Properties of the Response

```
response = request.response.body
```

##In-Class Lab: Wine Manager
- In this assignment we will create a wine inventory management system using a pre-built API: http://daretodiscover.net/wines
- The app must use the following:
	- Routes for GET, POST, PUT, DELETE.
	- 3 views - show all wines, edit wine, new wine using ERB.
	- All CRUD operations using the correct verbs.
- Bonus: Make it pretty using Bootstrap

##Authentication in Rails
- Authentication scheme is built in with `has_secure_password`.
- Rails uses Bcrypt out of the box.

####Generating a User Model

```
rails g model User username:string password:string password_digest:string
```

####Under the Hood
- `has_secure_password` will automatically do the following operations for us:

```
attr_reader :password

validates_presence_of :password, on: create
validates_presence_of :password_confirmation
validates_confirmation_of :password

# methods
authenticate(plain_text_password)
```

####Testing the Authentication

- First, let's jump in rails console - rails c in terminal
- Let's create a new user
- Save the new user
- Test out the authenticate method on the user and pass in a correct and incorrect password and see what it returns
- Notice the fields for password and password digest. If you see a hashed password, you did something right!