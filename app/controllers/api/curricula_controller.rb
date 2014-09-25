module Api
  class CurriculaController < ApplicationController
    def self.queryable_keys
      [:owner_id, :source_id]
    end

    def index
      @curricula = Curriculum.where(queryable_keys)
    end

    def show
      @curriculum = Curriculum.find(params[:id])
    end

  private
    def queryable_keys
      params.inject({}) do |result, (key, value)|
        result[key] = value if CurriculaController.queryable_keys.include? key.to_sym
        result
      end
    end
  end
end
