module LaborHelper
	
	def getsearch_options
		@searchlist = {	'1' => ['userid', 'username', 'city', 'phone', 'email'], 
						'2' => ['name', 'phone', 'status', 'city'], 
						'3' => ['request id', 'by service', 'by status', 'by user']} 
		#p "#{id} #{@searchlist[id]}"
		return @searchlist

	end
end
