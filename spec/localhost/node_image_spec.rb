require 'spec_helper'

NODE_PORT = 8000

describe "Dockerfile" do
    before(:all) do
        @node_image = Docker::Image.build_from_dir(File.dirname(File.dirname(File.dirname(__FILE__))) + '/docker/node_app')

        set :os, family: :debian
        set :backend, :docker
        set :node_image, @image.id
    end

    describe 'Dockerfile#config' do
        it 'should expose the expected ports' do
            expect(@node_image.json['ContainerConfig']['ExposedPorts']).to include("#{NODE_PORT}/tcp")
        end
    end
end
