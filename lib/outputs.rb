class TextOutput
  def out(hash)
    hash.each_pair do |k,v|
			print(k, k, v) if v != nil
    end
  end

	def print(parent_key, k, v)
		if v.is_a?(Hash)
			print_hash(k, v)
		else
			puts k + ": " + v.to_s
		end
	end

	def print_hash(parent_key, hash)
		hash.each_pair do |k,v|
			print parent_key + "." + k, k, v if v != nil
		end
	end
end
