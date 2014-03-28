class PublicAccount < ActiveRecord::Base
  # It will auto generate weixin token and secret
  include WeixinRailsMiddleware::AutoGenerateWeixinTokenSecretKey
  attr_accessible :name, :note

  has_many :diymenus, dependent: :destroy

  has_many :parent_menus, class_name: "Diymenu", foreign_key: :public_account_id

  def build_menu
    Jbuilder.encode do |json|
      json.button (parent_menus) do |menu|
        json.name menu.name
        if menu.sub_menus.present?
          json.sub_button(menu.sub_menus) do |sub_menu|
            json.type sub_menu.type
            json.name sub_menu.name
            sub_menu.button_type(json)
          end
        else
          json.type menu.type
          menu.button_type(json)
        end
      end
    end
  end
end
