	require 'spec_helper'

	describe "get correct iso state codes " do 
		
		it "should give correct state iso code for Gauteng" do
		    expect(FourKites::Country.get_correct_state_code("Gauteng" , "ZA")).to eq ("GT") 
		end

		it "should give correct state iso code for Durango" do
			expect(FourKites::Country.get_correct_state_code("Durango" , "MX")).to eq ("DUR")
		end

		it "should give correct state iso code for Manicaland" do
			expect(FourKites::Country.get_correct_state_code("Manicaland" , "ZW")).to eq ("MA")
		end
	    
	    it "should give correct state iso code for Bulawayo" do
			expect(FourKites::Country.get_correct_state_code("Bulawayo Province" , "ZW")).to eq ("BU")
		end

		it "should return nil if either state or country is empty" do
			expect(FourKites::Country.get_correct_state_code("Bulawayo Province" , "")).to eq (nil)
		end

	    it "should give correct state iso code for Punakha" do
			expect(FourKites::Country.get_correct_state_code("Punakha" , "BT")).to eq ("23")
		end

		it "should give correct state iso code for Uttar Pradesh" do
			expect(FourKites::Country.get_correct_state_code("Uttar Pradesh" , "IN")).to eq ("UP")
		end

		it "should give correct state iso code for Kagosima (unofficial_names)" do
			expect(FourKites::Country.get_correct_state_code("Kagosima" , "JP")).to eq ("46")
		end

		it "should give correct state iso code for Staffordshire" do
			expect(FourKites::Country.get_correct_state_code("Staffordshire" , "GB")).to eq ("STS")
		end

		it "should give correct state iso code for Norrbottens län" do
			expect(FourKites::Country.get_correct_state_code("Norrbottens län" , "SE")).to eq ("BD")
		end

		it "should give correct state iso code for Luzern" do
			expect(FourKites::Country.get_correct_state_code("Luzern" , "CH")).to eq ("LU")
		end

		it "should give correct state iso code for Khyber Pakhtunkhwa (translations)" do
			expect(FourKites::Country.get_correct_state_code("Khyber Pakhtunkhwa" , "PK")).to eq ("KP")
		end

		it "should give correct state iso code for Khyber Balochistan (translations)" do
			expect(FourKites::Country.get_correct_state_code("Balochistan" , "PK")).to eq ("BA")
		end

	end

	describe "check if a given state code is an official one for the given country" do
		it "should return true if GT is given for Gauteng, South Africa" do
			expect(FourKites::Country.is_state_valid? "gt" , "ZA").to eq (true)
		end

		it "should return false if AT is given for Uttar Pradesh , India (non existent state code for a country" do 
			expect(FourKites::Country.is_state_valid? "AT" , "IN").to eq (false)
		end
	end