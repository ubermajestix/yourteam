class YourTeam::Team
  include DataMapper::Resource
  property :id, Serial
  
  property :member_id,    Integer, :key => true
  property :user_id,      Integer, :key => true
  property :tagged_by_id, Integer, :key => true, :nullable => false
 
  belongs_to :member,    :model => "YourTeam::Member", :child_key=>[:member_id]
  belongs_to :user,      :model => "YourTeam::User",   :child_key=>[:user_id]
  belongs_to :tagged_by, :model => "YourTeam::User",   :child_key=>[:tagged_by_id]
  
end