require 'spec_helper'

describe "Dockerfile" do
    before(:all) do
        @mysql_image = Docker::Image.build_from_dir(File.dirname(File.dirname(File.dirname(__FILE__))) + '/docker/mysql')

        set :os, family: :debian
        set :backend, :docker
        set :mysql_image, @mysql_image.id
    end

    it "Make sure the table had been created" do
        expect(if_table_exist).to include("COUNT")
    end

    def if_table_exist
        command(`mysql --user="isophp" --password="secret" --database="isophpdb" \
        --execute="SELECT COUNT(*) FROM app_article_content;"`).stdout
    end
end
