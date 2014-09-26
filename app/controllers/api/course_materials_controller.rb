module Api
  class CourseMaterialsController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def self.queryable_keys
      [:owner_id, :source_id, :parent_id]
    end

    def index
      @course_materials = CourseMaterial.where(queryable_keys)
    end

    def show
      begin
        @course_material = CourseMaterial.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render not_found
      end
    end

    def create
      if source_id != nil
        @course_material = CourseMaterial.fork_file(CourseMaterial.find(source_id), parent_id)
      else
        @course_material = current_user.course_materials.new(course_material_params)
      end

      if @course_material.save
        render :show
      else
        render unprocessable_entity(@course_material)
      end
    end

    def update
      @course_material = current_user.course_materials.find(params[:id])

      if @course_material.update(course_material_params)
        render :show
      else
        render unprocessable_entity(@course_material)
      end
    end

    # def destroy
    #   @curriculum = current_user.curricula.find(params[:id])

    #   if @curriculum && @curriculum.destroy
    #     render deleted
    #   else
    #     render not_permitted
    #   end
    # end

  private
    def queryable_keys
      params.inject({}) do |result, (key, value)|
        result[key] = value if CourseMaterialsController.queryable_keys.include? key.to_sym
        result
      end
    end

    def course_material_params
      params.require(:course_material)
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
