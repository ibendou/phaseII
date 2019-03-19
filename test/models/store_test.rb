require 'test_helper'

class StoreTest < ActiveSupport::TestCase
    should have_many(:assignments)
  
    should validate_presence_of(:name)
    should validate_presence_of(:street)
    should validate_presence_of(:zip)
    should validate_uniqueness_of (:name)
    should validate_inclusion_of(:state).
    in_array(%w(OH WV PA)).
    with_message('State must be Pennsylvania, West Virginia, or Ohio')
    
    
    context "Creating stores" do
    setup do
      create_stores
    end 
    
    teardown do
      destroy_stores
    end 
      
      should "have a scope to alphabetize stores" do
        assert_equal ["CMU", "Damam", "Texas"], Store.alphabetical.map{|s| s.name}
      end
    
      should "have a scope to select only active stores" do
        assert_equal ["CMU", "Damam"], Store.active.map{|s| s.name}
      end 
      
      should "have a scope to select only inactive stores" do
        assert_equal ["Texas"], Store.inactive.map{|s| s.name}
      end 
      
      should "have a valid phone number" do
        assert_equal @cmu.phone, '541-754-3010'
      end 
      
      
    end

end
