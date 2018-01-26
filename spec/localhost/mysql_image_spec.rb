require 'spec_helper'

describe "Dockerfile" do
    before(:all) do
        @node_image = Docker::Image.build_from_dir(File.dirname(File.dirname(File.dirname(__FILE__))) + '/docker/mysql')

        set :os, family: :debian
        set :backend, :docker
        set :docker_image, @image.id
    end

    describe command("`mysql --user="isophp" --password="secret" --database="isophpdb" \
        --execute="SELECT COUNT(*) FROM app_article_content;"`") do
            its(:stdout) { should eq "1" }
    end
end
