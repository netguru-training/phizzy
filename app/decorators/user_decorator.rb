class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{model.firstname} #{model.lastname}"
  end
end

