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
      if source_id != nil
        @curriculum = current_user.curricula.fork_file(Curriculum.find(source_id), parent_id)
      else
        @curriculum = current_user.curricula.new(curriculum_params)
      end

      if @curriculum.save
        render :show
      else
        render unprocessable_entity(@curriculum)
      end
    end

    def update
      @curriculum = current_user.curricula.find(params[:id])

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

    def source_id
      params[:curriculum][:source_id] unless params[:curriculum].nil?
    end

    def parent_id
      params[:curriculum][:parent_id] unless params[:curriculum].nil?
    end
  end
end
