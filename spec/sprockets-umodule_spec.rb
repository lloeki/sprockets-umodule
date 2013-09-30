require 'spec_helper'

RSpec.configure do |c|
  c.filter_run_excluding broken: true
  c.filter_run_excluding todo: true
end

describe Sprockets::Umodule do
  before :each do
    @root   = create_construct
    @assets = @root.directory 'assets'
    @env    = Sprockets::Environment.new @root.to_s
    @env.append_path @assets.to_s
  end

  after :each do
    @root.destroy!
  end

  it 'processes umodule js files' do
    @assets.file 'foo.js.umodule', %Q[bar = function () { "bar" };\n]
    asset = @env['foo.js']
    asset.to_s.should eq <<-SOURCE
(function () {
  define = require('module').define;

  define('foo', function (exports, require, module) {
    bar = function () { "bar" };

  });
})();
    SOURCE
  end

  it 'sets the module name with the directory' do
    @assets.file 'sub/foo.js.umodule', %Q[bar = function () { "bar" };\n]
    asset = @env['sub/foo.js']
    asset.to_s.should include %q[define('sub/foo',]
  end

  it 'indents the module contents prettily'
  it 'works with coffeescript'

end
