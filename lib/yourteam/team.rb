class YourTeam::Team
  include DataMapper::Resource
  property :id, Serial
  belongs_to :member, :model => "YourTeam::Member", :child_key=>[:member_id]
  belongs_to :user, :model => "YourTeam::User", :child_key=>[:user_id]
end