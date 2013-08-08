module RelationshipsHelper
  def relationship_id(user)
    current_user.relationships.find_by(followed_id: user.id).id
  end
end
