module ApplicationHelper
  def blank_image
    "data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+ip1sAAAAASUVORK5CYII="
  end

  def link_to_fighter_action(fight, fighter, action, &block)
    if action == :add_fighter
      path = fight.new_record? ? fights_path(fighter_id: fighter.id) : fight_path(fight, fighter_id: fighter.id)
      method = fight.new_record? ? "post" : "patch"
      link_to path, method: method, &block
    else
      capture(&block)
    end
  end
end
