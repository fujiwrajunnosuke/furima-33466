class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence:true do

          validates :name
          validates :password, length:{ minimum: 6}, confirmation: true,
                              format: { with:  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数字を使用してください' }

        with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
          validates :family_name
          validates :first_name
        end
        
        with_options format: {with: /\A[ァ-ン]+\z/, message: 'カナ文字を使用してください' } do
          validates :call_family_name
          validates :call_first_name
        end

         validates :birth_day
  end

  has_many :items

end