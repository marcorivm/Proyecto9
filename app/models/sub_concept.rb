class SubConcept < ActiveRecord::Base
  belongs_to :concept
  has_many :master_questions, dependent: :destroy, foreign_key: 'subconcept_id'

  validates :name, presence: true
  validates :concept, presence: true

  attr_accessible :name, :concept_id
end
