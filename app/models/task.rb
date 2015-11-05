class Task < ActiveRecord::Base
    belongs_to :list
    include RankedModel
    ranks :row_order
end
