class SaveExpression < ApplicationRecord
  belongs_to :user
  belongs_to :job
  belongs_to :save_question
end
