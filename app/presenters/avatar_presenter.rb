# require needed in production
class AvatarPresenter
  include ActionView::Context
  include ActionView::Helpers::AssetTagHelper

  # AvatarPresenter.new(user).call
  # AvatarPresenter.call(user)

  def self.call(user)
    new(user).call
  end

  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def call
    initials_element
  end

  private

  def initials_element
    style = "background-color: #{avatar_color(initials)};"
    content_tag :div, class: 'avatar-circle', style: style do
      content_tag :div, initials, class: 'avatar-text'
    end
  end

  def email
    user.email
  end

  def name
    user.name
  end

  def initials
    names = name.split
    if names.size > 1
      [names[0].first.upcase, names[1].first.upcase].join
    elsif name.size < 2
      [email[0].upcase, email[1].downcase].join
    else
      [name[0].upcase, name[1].downcase].join
    end
  end

  def avatar_color(initials)
    colors = [
      '#00AA55', '#009FD4', '#B381B3', '#939393', '#E3BC00',
      '#D47500', '#DC2A2A', '#696969', '#ff0000', '#ff80ed',
      '#407294', '#133337', '#065535', '#c0c0c0', '#5ac18e',
      '#666666', '#f7347a', '#576675', '#696966', '#008080',
      '#ffa500', '#40e0d0', '#0000ff', '#003366', '#fa8072',
      '#800000'
    ]
    colors[initials.first.to_s.downcase.ord - 97] || '#000000'
  end
end
