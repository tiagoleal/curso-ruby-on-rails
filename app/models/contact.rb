class Contact < ActiveRecord::Base
  belongs_to :kind
  has_one :address #pode acessar do contact > address tbm
  has_many :phones #plural pois e mais de um telefone

  # z = Contact.all.sample
  # z.address.city
  accepts_nested_attributes_for :address #permite inserir em mais de uma tabela (atributos aninhados)
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true 

  validates :name, presence: true, length: {minimum: 3 }
  validates :email, presence: true
end
