module PaRequestsHelper

	def cmm_request_link_for(request)
		params = {
			:api_id => '1vd9o4427lyi0ccb2uem', 
			:token_id => request.cmm_token,
			:id => request.id
		}
		if request.cmm_link
			request.cmm_link+"?token_id=#{params[:token_id]}"
		else
			"https://api.covermymeds.com/requests/#{request.cmm_id}?v=1&#{params.to_query}"
		end
	end
end