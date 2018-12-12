# frozen_string_literal: true

# Alterations to the inherited class ActiveRecord
# should be added here
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
