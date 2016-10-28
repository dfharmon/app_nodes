require 'test_helper'

module AppNodes
  class NodesControllerTest < ActionController::TestCase
    setup do
      @node = app_nodes_nodes(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:nodes)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create node" do
      assert_difference('Node.count') do
        post :create, node: { address: @node.address, extended_info: @node.extended_info, name: @node.name, version: @node.version }
      end

      assert_redirected_to node_path(assigns(:node))
    end

    test "should show node" do
      get :show, id: @node
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @node
      assert_response :success
    end

    test "should update node" do
      patch :update, id: @node, node: { address: @node.address, extended_info: @node.extended_info, name: @node.name, version: @node.version }
      assert_redirected_to node_path(assigns(:node))
    end

    test "should destroy node" do
      assert_difference('Node.count', -1) do
        delete :destroy, id: @node
      end

      assert_redirected_to nodes_path
    end
  end
end