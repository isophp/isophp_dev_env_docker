require 'spec_helper'

HTTP_PORT = 80
SSL_PORT  = 443
CGI_PORT  = 9000

describe "Dockerfile" do
    before(:all) do
        @image = Docker::Image.build_from_dir(File.dirname(File.dirname(File.dirname(__FILE__))) + '/docker/app')

        set :os, family: :debian
        set :backend, :docker
        set :docker_image, @image.id
    end

    it "installs the right version of Ubuntu" do
        expect(os_version).to include("Ubuntu 16")
    end

    it "installs the right version of Phalcon" do
        expect(phalcon_version).to include("3.2.4")
    end

    describe 'Dockerfile#config' do
        it 'should expose the expected ports' do
            expect(@image.json['ContainerConfig']['ExposedPorts']).to include("#{HTTP_PORT}/tcp")
            expect(@image.json['ContainerConfig']['ExposedPorts']).to include("#{SSL_PORT}/tcp")
            expect(@image.json['ContainerConfig']['ExposedPorts']).to include("#{CGI_PORT}/tcp")
        end
    end

    describe file('/opt/docker/provision/entrypoint.d/fix-permissions.sh') do
        it { should be_file }
    end

    def phalcon_version
        command("php --ri phalcon | grep Version | grep -v Zephir").stdout
    end

    def os_version
        command("lsb_release -a").stdout
    end
end
