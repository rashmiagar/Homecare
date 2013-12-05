module LoginHelper

	def replace_nav(id)
		if(id=="home")
			"<li><a href='/about'>About Us</a></li><li><a href='/'>Services</a></li><li>
			<a href='/login/_contactus'>Contact Us</a></li>"
		elsif (id =="admin")

		elsif (id=="user")

		end
	end
end
