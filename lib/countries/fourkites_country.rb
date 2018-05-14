
	$: << 'lib'
	require_relative 'iso3166'
	require 'pry'

	module FourKites
		class Country 
			class << self
			def is_state_valid? state_code , country_code
				return false if state_code.empty? || country_code.empty?
	            country = ISO3166::Country.new(country_code)
	            return true if country.states.include?(state_code.upcase)
	            false
			end

			def get_correct_state_code state_name , country_code
				 return nil if state_name.empty? || country_code.empty?
	             country = ISO3166::Country.new(country_code)
	             max_count = 0
	             final_key = ""
	             translated_key = is_translation_match(state_name , country_code)
	             return translated_key unless translated_key.nil?
	             country.states.each do | key , value| 
                      int_size_official = is_official_name_match(value.name , state_name)
                      int_size_unofficial = is_unofficial_name(value.unofficial_names, state_name)
                      max_int_size = [int_size_official , int_size_unofficial].max
                      if max_int_size > max_count 
                      	final_key = key
                      	max_count = max_int_size
                      end
	             end
	             return final_key if max_count > 0
	             nil
			end

			private

			def is_unofficial_name(name, state_name)
				is_array = (name.class == Array) ? true : false
				return 0 if (!is_array && name.nil?) || (is_array && name.empty?)
				name_array = name.split(' ').map{|nm| nm.upcase} unless is_array
			   	name_array = name.map{|nm| nm.upcase} if is_array
		        state_name_array = state_name.split(' ').map{|nm| nm.upcase}
		        intersection_size = (name_array & state_name_array).size
		        intersection_size
		   end

		   def is_official_name_match(name , state_name)
		   	    return 0 if name.nil? || state_name.nil?
		   	    name_array = name.split(' ').map{|nm| nm.upcase}
		   	    state_name_array = state_name.split(' ').map{|nm| nm.upcase}
		   	    intersection_size = (name_array & state_name_array).size
		   	    intersection_size
		   end

		   def is_translation_match(state_name , country_code)
		   	   country = ISO3166::Country.new(country_code)
		   	   country.states.each do |key , subdivision|
		   	   	subdivision.translations.each do |trans_key , value|
		   	   		return key if value == state_name
		   	   	end
		   	   end
		   	   nil
		   end
	end
	end
	end