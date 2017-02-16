module Simplepay
	module SignatureGenerator
		
		def self.generate_request(data)
			data = data.sort
			data.unshift([:script, 'init_payment'])
			data.push([:secret_key, Simplepay.secret_key])
			data = data.to_h.values.join(";")
			self.md5(data)
		end

		def self.generate_response(data)
			data = data.sort
			data.pop
			data.unshift([:script, 'success']) 
			data.push([:secret_key, Simplepay.secret_key_for_result])
			data = data.to_h.values.join(";")
			self.md5(data)
		end

		protected

	    def self.md5(data)
	      Digest::MD5.hexdigest data
	    end
	end
end

