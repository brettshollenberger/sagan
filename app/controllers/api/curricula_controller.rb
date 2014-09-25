module Api
  class CurriculaController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def self.queryable_keys
      [:owner_id, :source_id]
    end

    def index
      @curricula = Curriculum.where(queryable_keys)
    end

    def show
      begin
        @curriculum = Curriculum.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render not_found
      end
    end

    def create
      if params[:source_id] != nil
        @curriculum = Curriculum.fork_from(Curriculum.find(params[:id]), params[:source_id])
      else
        @curriculum = Curriculum.new(curriculum_params)
      end

      if @curriculum.save
        render :show
      else
        render unprocessable_entity(@curriculum)
      end
    end

    def update
      @curriculum = Curriculum.find(params[:id])

      if @curriculum.update(curriculum_params)
        render :show
      else
        render unprocessable_entity(@curriculum)
      end
    end

    def destroy
      @curriculum = current_user.curricula.find(params[:id])

      if @curriculum && @curriculum.destroy
        render deleted
      else
        render not_permitted
      end
    end

  private
    def queryable_keys
      params.inject({}) do |result, (key, value)|
        result[key] = value if CurriculaController.queryable_keys.include? key.to_sym
        result
      end
    end

    def curriculum_params
      params.require(:curriculum)
            .permit(:name, :filetype, :type, :classification, :parent_id, :owner_id, :source_id)
    end
  end
end
