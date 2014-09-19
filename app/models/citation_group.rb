class CitationGroup < ActiveRecord::Base
  belongs_to :citing_paper, foreign_key: :citing_paper_id, class: Paper, inverse_of: :citation_groups
  has_many :citation_group_references, -> { order('position ASC') },
           dependent: :destroy
  has_many :references, through: :citation_group_references, class: Reference

  acts_as_list scope: :citing_paper
end
