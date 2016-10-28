require_dependency "app_nodes/application_controller"

module AppNodes
  class NodesController < ApplicationController
    load_and_authorize_resource class: "AppNodes::Node" if AppNodes.use_cancancan

    before_action :set_node, only: [:show, :edit, :update, :destroy]

    # GET /nodes
    def index
      @nodes = Node.all
    end

    # GET /nodes/1


    # GET /nodes/new
    def new
      @node = Node.new
    end

    # GET /nodes/1/edit


    # POST /nodes
    def create
      @node = Node.new(node_params)

      if @node.save
        redirect_to nodes_url, notice: 'Node was successfully created.'
      else
        render :index
      end
    end

    # DELETE /nodes/1
    def destroy
      @node.destroy
      redirect_to nodes_url, notice: 'Node was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_node
        @node = Node.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def node_params
        params.require(:node).permit(:address, :name, :version, :extended_info)
      end
  end
end
