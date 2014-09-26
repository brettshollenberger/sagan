module Api
  class SfilesController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def ancestors
      @ancestors = ancestry_chain(Sfile.find(params[:id]))
    end

  private
    def ancestry_chain(file, chain=[])
      return chain if file.nil?
      if file.parent_node
        chain.push(file.parent_node)
        ancestry_chain(file.parent_node, chain)
      end
      chain
    end
  end
end
