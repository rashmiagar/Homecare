class SearchController < ApplicationController
	include SearchHelper

	def dosearch
		p params

		@searchoptions = getsearch_options
		@search_critieria = @searchoptions[params[:service_id]]
		# render :update do |page|
		# 	page.replace_html 'search_result', :partial => 'result'
		# end
		respond_to do |format|
			
			format.js 
			
		end
	end
end

